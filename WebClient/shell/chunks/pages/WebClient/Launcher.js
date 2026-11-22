(self.webpackChunk_N_E = self.webpackChunk_N_E || []).push([
    [86], {
        4631: (e, n, a) => {
            "use strict";
            a.d(n, {
                A: () => s
            });
            var r = a(7418),
                t = a(2781),
                o = a(8212),
                i = a(6055);

            function s(e, n) {
                o.A.sendEvent(t.Vc, {
                    localTimestamp: new Date().toISOString(),
                    url: window.location.href,
                    reason: e
                });
                let a = BigInt(Date.now());
                o.A.sendEvent(r.l, {
                    batchTimestampMilliseconds: a,
                    counters: [{
                        name: "WasmPlay_Redirect",
                        value: 1,
                        eventTimestampMillisecond: a,
                        attributes: {
                            stringAttributes: {
                                reason: t.fO[e]
                            }
                        }
                    }]
                }), window.location.replace("https://www.".concat(i.A).concat(n))
            }
        },
        5778: (e, n, a) => {
            "use strict";
            a.r(n), a.d(n, {
                default: () => x
            });
            var r = a(7876),
                t = a(4232),
                o = a(5873),
                i = a(2781),
                s = a(4631),
                d = a(6055);
            let c = [{
                name: "Brookhaven RP",
                placeId: 0x1258c596e
            }, {
                name: "Natural Disaster Survival",
                placeId: 189707
            }, {
                name: "Knockout",
                placeId: 0x7c62e5036153
            }, {
                name: "Beyond the Dark — Vistech Showcase",
                placeId: 0x1ada2bf84
            }, {
                name: "Pop and Drop",
                placeId: 0x442e6f1d37bd
            }, {
                name: "Starforged [Early Access]",
                placeId: 0x7f6bfeaeaad1
            }, {
                name: "Showdown: Anime FPS ⚔️ Jutsu Shooter",
                placeId: 0x722d416b6971
            }, {
                name: "\uD83D\uDD25Hypershot",
                placeId: 0x414120b96
            }, {
                name: "Jungle Blaster",
                placeId: 0x551cd9dcd856
            }, {
                name: "Pirate Vineyard Runway",
                placeId: 0x67a6000ed76a
            }];
            async function l() {
                try {
                    let e = await fetch("https://users.".concat(d.A, "/v1/users/authenticated"), {
                        credentials: "include"
                    });
                    if (401 === e.status || 403 === e.status) return;
                    if (!e.ok) return "";
                    let {
                        id: n
                    } = await e.json();
                    return await (0, o.V_)({
                        userId: n
                    })
                } catch (e) {
                    return ""
                }
            }

            function x() {
                return (0, t.useEffect)(() => {
                    l().then(e => {
                        if (void 0 === e) {
                            let e = encodeURIComponent(window.location.href);
                            (0, s.A)(i.fO.SIGNED_OUT, "/?returnUrl=".concat(e));
                            return
                        }
                        let n = document.createElement("script");
                        n.src = "".concat("/6536749aa05e452da9c4d6ed4b464613ff9ba84a/assets", "/launcher/launcher.js"), n.dataset.wasmJoinId = e, document.body.appendChild(n)
                    })
                }, []), (0, r.jsxs)(t.Fragment, {
                    children: [(0, r.jsx)("style", {
                        children: '\n    /* Approximation of Roblox\'s web design system (UIBlox): Builder Sans,\n       light gray canvas, white surfaces, green primary action. */\n    :root {\n        --rbx-bg: #f2f4f5;\n        --rbx-surface: #ffffff;\n        --rbx-border: #e3e5e6;\n        --rbx-text: #191919;\n        --rbx-text-muted: #757575;\n        --rbx-blue: #00a2ff;\n        --rbx-blue-hover: #0086d1;\n    }\n    body {\n        font-family: "Builder Sans", "Helvetica Neue", Helvetica, Arial, sans-serif;\n        max-width: 1000px;\n        margin: 40px auto;\n        padding: 0 20px;\n        background: var(--rbx-bg);\n        color: var(--rbx-text);\n    }\n    .columns {\n        display: flex;\n        gap: 24px;\n        align-items: flex-start;\n        flex-wrap: wrap;\n    }\n    .column {\n        flex: 1;\n        min-width: 300px;\n    }\n    .col-title {\n        font-size: 16px;\n        font-weight: 700;\n        color: var(--rbx-text);\n        margin: 16px 0 8px;\n    }\n    h1 {\n        color: var(--rbx-text);\n        font-weight: 700;\n        font-size: 28px;\n    }\n    .game-card {\n        background: var(--rbx-surface);\n        border: 1px solid var(--rbx-border);\n        border-radius: 8px;\n        padding: 16px 20px;\n        margin: 12px 0;\n        display: flex;\n        justify-content: space-between;\n        align-items: center;\n        box-shadow: 0 1px 2px rgba(25, 25, 25, 0.06);\n    }\n    .game-card .name {\n        font-size: 16px;\n        font-weight: 600;\n    }\n    .game-card .place-id {\n        font-size: 13px;\n        color: var(--rbx-text-muted);\n        margin-top: 4px;\n    }\n    .game-card .creator {\n        font-size: 13px;\n        color: var(--rbx-text-muted);\n        margin-top: 4px;\n    }\n    button {\n        background: var(--rbx-blue);\n        color: #fff;\n        border: none;\n        padding: 10px 24px;\n        border-radius: 8px;\n        cursor: pointer;\n        font-size: 15px;\n        font-weight: 700;\n        font-family: inherit;\n    }\n    button:hover { background: var(--rbx-blue-hover); }\n    button:disabled {\n        background: #c3c8cb;\n        cursor: not-allowed;\n    }\n    #log {\n        background: var(--rbx-surface);\n        border: 1px solid var(--rbx-border);\n        border-radius: 8px;\n        padding: 16px;\n        margin-top: 24px;\n        font-family: ui-monospace, "SF Mono", Menlo, Consolas, monospace;\n        font-size: 13px;\n        color: var(--rbx-text-muted);\n        min-height: 60px;\n        white-space: pre-wrap;\n    }\n    #search {\n        width: 100%;\n        padding: 12px 16px;\n        margin: 8px 0;\n        border-radius: 8px;\n        border: 1px solid var(--rbx-border);\n        background: var(--rbx-surface);\n        color: var(--rbx-text);\n        font-size: 16px;\n        font-family: inherit;\n        box-sizing: border-box;\n    }\n    #search:focus {\n        outline: none;\n        border-color: var(--rbx-blue);\n    }\n    .muted {\n        color: var(--rbx-text-muted);\n        font-size: 14px;\n        padding: 8px 0;\n    }\n\n/* webclient.css hides overflow for the full-screen game canvas; this page needs to scroll. */\nhtml,\nbody {\n    height: auto;\n    overflow: auto;\n}\n'
                    }), (0, r.jsx)("h1", {
                        children: "Join Experience"
                    }), (0, r.jsxs)("div", {
                        className: "columns",
                        children: [(0, r.jsxs)("div", {
                            className: "column",
                            children: [(0, r.jsx)("div", {
                                className: "col-title",
                                children: "Choose from a curated list of games"
                            }), (0, r.jsx)("div", {
                                id: "curated-list",
                                children: c.map(e => {
                                    let {
                                        name: n,
                                        placeId: a
                                    } = e;
                                    return (0, r.jsxs)("div", {
                                        className: "game-card",
                                        children: [(0, r.jsxs)("div", {
                                            children: [(0, r.jsx)("div", {
                                                className: "name",
                                                children: n
                                            }), (0, r.jsxs)("div", {
                                                className: "place-id",
                                                children: ["Place ID: ", a]
                                            })]
                                        }), (0, r.jsx)("button", {
                                            type: "button",
                                            "data-place-id": a,
                                            children: "Play"
                                        })]
                                    }, a)
                                })
                            })]
                        }), (0, r.jsxs)("div", {
                            className: "column",
                            children: [(0, r.jsx)("div", {
                                className: "col-title",
                                children: "Search for a game"
                            }), (0, r.jsx)("input", {
                                id: "search",
                                type: "text",
                                placeholder: "Search experiences by name…",
                                autoComplete: "off"
                            }), (0, r.jsx)("div", {
                                id: "search-status",
                                className: "muted",
                                style: {
                                    display: "none"
                                }
                            }), (0, r.jsx)("div", {
                                id: "search-results"
                            }), (0, r.jsx)("div", {
                                className: "col-title",
                                children: "…Or, manually enter a place ID"
                            }), (0, r.jsxs)("div", {
                                className: "game-card",
                                children: [(0, r.jsx)("div", {
                                    style: {
                                        flex: 1,
                                        marginRight: "16px"
                                    },
                                    children: (0, r.jsx)("input", {
                                        id: "custom-place-id",
                                        type: "text",
                                        placeholder: "Enter Place ID",
                                        style: {
                                            width: "100%",
                                            padding: "8px 12px",
                                            borderRadius: "6px",
                                            border: "1px solid var(--rbx-border)",
                                            background: "var(--rbx-surface)",
                                            color: "var(--rbx-text)",
                                            fontSize: "15px",
                                            fontFamily: "inherit",
                                            boxSizing: "border-box"
                                        }
                                    })
                                }), (0, r.jsx)("button", {
                                    type: "button",
                                    id: "custom-launch",
                                    children: "Play"
                                })]
                            })]
                        })]
                    }), (0, r.jsx)("div", {
                        id: "log",
                        children: "Waiting..."
                    })]
                })
            }
        },
        6055: (e, n, a) => {
            "use strict";
            a.d(n, {
                A: () => r
            });
            let r = "roblox.com"
        },
        8212: (e, n, a) => {
            "use strict";
            a.d(n, {
                A: () => o
            });
            var r = a(7657),
                t = a(6055);
            let o = new r._({
                baseUrl: "https://apis.".concat(t.A)
            })
        },
        9228: (e, n, a) => {
            (window.__NEXT_P = window.__NEXT_P || []).push(["/WebClient/Launcher", function() {
                return a(5778)
            }])
        }
    },
    e => {
        e.O(0, [625, 636, 593, 792], () => e(e.s = 9228)), _N_E = e.O()
    }
]);