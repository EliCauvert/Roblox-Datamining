/* eslint-disable */
"use strict";
(() => {
    // server-endpoints.ts
    var apiBaseUrls = {
        prod: {
            clientSettingsHost: "clientsettings.roblox.com",
            settingsFlagsHost: "clientsettingscdn.roblox.com",
            setupCdnBase: "https://setup.rbxcdn.com",
            websiteHost: "www.roblox.com"
        },
        st1: {
            clientSettingsHost: "clientsettings.sitetest1.robloxlabs.com",
            settingsFlagsHost: "clientsettingscdn.sitetest1.robloxlabs.com",
            setupCdnBase: "https://s3.amazonaws.com/setup.sitetest1.robloxlabs.com",
            websiteHost: "www.sitetest1.robloxlabs.com"
        },
        st2: {
            clientSettingsHost: "clientsettings.sitetest2.robloxlabs.com",
            settingsFlagsHost: "clientsettingscdn.sitetest2.robloxlabs.com",
            setupCdnBase: "https://s3.amazonaws.com/setup.sitetest2.robloxlabs.com",
            websiteHost: "www.sitetest2.robloxlabs.com"
        },
        st3: {
            clientSettingsHost: "clientsettings.sitetest3.robloxlabs.com",
            settingsFlagsHost: "clientsettingscdn.sitetest3.robloxlabs.com",
            setupCdnBase: "https://s3.amazonaws.com/setup.sitetest3.robloxlabs.com",
            websiteHost: "www.sitetest3.robloxlabs.com"
        }
    };

    function isServerName(value) {
        return typeof value === "string" && Object.prototype.hasOwnProperty.call(apiBaseUrls, value);
    }

    // channel-resolution.ts
    var WEB_CLIENT_BINARY_TYPE = "WebClientApp";

    function isProductionChannel(channel) {
        const normalizedChannel = channel.trim().toLowerCase();
        return normalizedChannel === "" || normalizedChannel === "live" || normalizedChannel === "production";
    }
    async function resolveUserChannel(server, proxy) {
        if (!(server in apiBaseUrls)) {
            console.error(`[ClientSettings] Unknown server environment "${server}" \u2014 defaulting to production channel`);
            return {
                channelName: "",
                token: ""
            };
        }
        const {
            clientSettingsHost
        } = apiBaseUrls[server];
        try {
            const userChannelUrl = `https://${clientSettingsHost}/v2/user-channel?binaryType=${WEB_CLIENT_BINARY_TYPE}`;
            const fetchUrl = proxy ? proxy.url(userChannelUrl) : userChannelUrl;
            const init = {
                credentials: "include"
            };
            if (proxy) {
                init.headers = proxy.authHeaders();
            }
            const resp = await fetch(fetchUrl, init);
            if (resp.ok) {
                const data = await resp.json();
                const rawChannel = data.channelName ?? "";
                const channelName = isProductionChannel(rawChannel) ? "" : rawChannel;
                console.log(`[ClientSettings] user-channel enrollment: "${channelName || "production"}"`);
                return {
                    channelName,
                    token: data.token ?? ""
                };
            }
            console.warn(`[ClientSettings] user-channel HTTP ${resp.status} from ${clientSettingsHost}; defaulting to production`);
        } catch (e) {
            console.warn(`[ClientSettings] user-channel fetch failed; defaulting to production:`, e);
        }
        return {
            channelName: "",
            token: ""
        };
    }

    // engine-version-resolution.ts
    async function resolveEngineBase(server, channel, proxy) {
        if (!(server in apiBaseUrls)) {
            console.error(`[ClientSettings] Unknown server environment "${server}" \u2014 cannot resolve engine base URL`);
            return null;
        }
        const {
            clientSettingsHost
        } = apiBaseUrls[server];
        const {
            channelName,
            token
        } = channel;
        let clientVersionUpload = null;
        try {
            const versionPath = isProductionChannel(channelName) ? `/v2/client-version/${WEB_CLIENT_BINARY_TYPE}` : `/v2/client-version/${WEB_CLIENT_BINARY_TYPE}/channel/${encodeURIComponent(channelName)}`;
            const clientSettingsUrl = `https://${clientSettingsHost}${versionPath}`;
            const fetchUrl = proxy ? proxy.url(clientSettingsUrl) : clientSettingsUrl;
            const init = {};
            if (token) {
                init.headers = {
                    "Roblox-Channel-Token": token
                };
            }
            const resp = await fetch(fetchUrl, init);
            if (resp.ok) {
                const data = await resp.json();
                clientVersionUpload = data.clientVersionUpload ?? null;
                if (clientVersionUpload) {
                    setCachedClientVersion(server, {
                        clientVersionUpload,
                        version: data.version ?? "",
                        channelName,
                        cachedAt: Date.now()
                    });
                    console.log(`[ClientSettings] channel=${channelName || "production"} version=${data.version} upload=${clientVersionUpload}`);
                }
            } else {
                console.warn(`[ClientSettings] HTTP ${resp.status} from ${clientSettingsHost}`);
            }
        } catch (e) {
            console.warn(`[ClientSettings] fetch failed:`, e);
        }
        if (!clientVersionUpload) {
            const cached = getCachedClientVersion(server);
            if (cached && cached.channelName === channelName) {
                clientVersionUpload = cached.clientVersionUpload;
                console.log(`[ClientSettings] Using cached channel=${cached.channelName || "production"} version=${cached.version} upload=${clientVersionUpload}`);
            } else if (cached) {
                console.warn(`[ClientSettings] Cached version is for channel "${cached.channelName || "production"}" but current channel is "${channelName || "production"}"; ignoring stale cache`);
            }
        }
        if (clientVersionUpload) {
            return engineBaseForUpload(server, clientVersionUpload);
        }
        console.log(`[ClientSettings] No version resolved, falling back to the loader's own directory`);
        return null;
    }

    function engineBaseForUpload(server, clientVersionUpload) {
        return `${apiBaseUrls[server].setupCdnBase}/webclient/${clientVersionUpload}-RobloxWebClient`;
    }
    var CLIENT_VERSION_KEY_PREFIX = "clientVersion_";

    function getCachedClientVersion(server) {
        const raw = localStorage.getItem(CLIENT_VERSION_KEY_PREFIX + server);
        if (!raw) return null;
        try {
            return JSON.parse(raw);
        } catch {
            return null;
        }
    }

    function setCachedClientVersion(server, info) {
        localStorage.setItem(CLIENT_VERSION_KEY_PREFIX + server, JSON.stringify(info));
    }

    // WasmLoader.ts
    var PLAYER_SCRIPT = "WasmPlayer.js";
    var loaderBase = (() => {
        const tag = document.currentScript;
        if (tag instanceof HTMLScriptElement)
            return new URL(".", tag.src).href.replace(/\/$/, "");
        throw new Error("Not running from an imported script!");
    })();
    async function resolveEngine(host, server, cdnProxy) {
        if (host.useCdnBinary === false) {
            console.log(`[WasmLoader] CDN binary disabled \u2014 loading engine from local base: ${loaderBase}`);
            return {
                engineBase: loaderBase,
                channel: null
            };
        }
        const userChannel = await resolveUserChannel(server, cdnProxy);
        let channel = userChannel.channelName;
        let versionedBase = host.engineVersion !== void 0 ? engineBaseForUpload(server, host.engineVersion) : await resolveEngineBase(server, userChannel, cdnProxy);
        if (versionedBase === null && channel) {
            console.warn(`[WasmLoader] No engine version resolved for channel "${channel}" \u2014 falling back to production binary and flags`);
            channel = "";
            versionedBase = await resolveEngineBase(server, {
                channelName: "",
                token: ""
            }, cdnProxy);
        }
        if (versionedBase === null) {
            console.log(`[WasmLoader] CDN resolution failed \u2014 loading engine from local base: ${loaderBase}`);
            return {
                engineBase: loaderBase,
                channel
            };
        }
        const engineBase = cdnProxy ? cdnProxy.url(versionedBase) : versionedBase;
        console.log(`[WasmLoader] Engine base ${versionedBase}${host.engineVersion !== void 0 ? " (pinned)" : ""}${cdnProxy ? " (via proxy)" : ""}`);
        return {
            engineBase,
            channel
        };
    }
    async function resolveLoaderContext() {
        const host = window.robloxWasmHostConfig;
        if (!host)
            throw new Error("window.robloxWasmHostConfig must be set before WasmLoader.js runs");
        let server = "prod";
        if (isServerName(host.server))
            server = host.server;
        else
            console.error(`[WasmLoader] Unknown server "${String(host.server)}" in robloxWasmHostConfig; using prod`);
        const {
            engineBase,
            channel
        } = await resolveEngine(host, server, window.__wasmDevSettings?.cdnProxy);
        return {
            engineBase,
            channel,
            server,
            canStoreTelemetry: host.canStoreTelemetry === true,
            ...host.workerStubUrl !== void 0 ? {
                workerStubUrl: new URL(host.workerStubUrl, location.href).href
            } : {}
        };
    }

    function showEngineLoadError() {
        const message = "Failed to load engine. Please reload the page.";
        const status = document.getElementById("status");
        if (status) status.textContent = message;
        const overlay = document.getElementById("loading-overlay");
        const errorPanel = overlay?.querySelector(".loading-error-panel");
        if (!overlay || !errorPanel)
            return;
        const title = document.getElementById("loading-error-title");
        const errorMessage = document.getElementById("loading-error-message");
        if (title) title.textContent = "Error";
        if (errorMessage) errorMessage.textContent = message;
        document.getElementById("loading-error-leave")?.addEventListener("click", () => {
            window.close();
            window.location.replace("about:blank");
        });
        errorPanel.hidden = false;
        overlay.classList.add("loading-failed");
        overlay.setAttribute("aria-label", "Unable to start Roblox");
        overlay.setAttribute("aria-busy", "false");
    }
    (async () => {
        const context = await resolveLoaderContext();
        window.__wasmLoaderContext = context;
        const playerUrl = `${context.engineBase}/${PLAYER_SCRIPT}`;
        const script = document.createElement("script");
        script.crossOrigin = "anonymous";
        script.src = playerUrl;
        script.onerror = () => {
            console.error(`[WasmLoader] Failed to load ${playerUrl}`);
            showEngineLoadError();
        };
        document.body.appendChild(script);
    })().catch((err) => {
        console.error("[WasmLoader] Engine resolution failed", err);
        showEngineLoadError();
    });
})();