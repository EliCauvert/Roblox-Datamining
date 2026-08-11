; // bundle: page___c3d8d7c4392c4aa30d1485bbb7b20375_m
; // files: Thumbnails/ThumbnailUtils.js, extensions/ThreeDeeThumbnails.js, extensions/AnimatedThumbnails.js, Thumbnails/ThumbnailView.js, Thumbnails/ThumbnailSpinner.js, ~/Generated/js/Roblox_TranslationResources_Feature_ProfileResources_en_us_standard.js, ~/viewapp/pages/profile/profile.js, utilities/datetime/formatDateTimesI18n.js, ~/viewapp/pages/profile/services/profileUtilitiesConstantsServices.js, ~/viewapp/pages/profile/services/profileService.js, ~/viewapp/pages/profile/constants/profileJsonEndPoints.js, ~/viewapp/pages/profile/constants/profileFriendEvents.js, ~/viewapp/pages/profile/controllers/profileBaseController.js, ~/viewapp/pages/profile/controllers/profileUtilitiesController.js, ~/viewapp/pages/profile/controllers/profileCollectionsController.js, ~/viewapp/pages/profile/controllers/profileGridController.js, ~/viewapp/pages/profile/directives/profileUtilitiesDirective.js, ~/viewapp/pages/profile/directives/profileEmptyTabDirective.js, ~/viewapp/pages/profile/directives/profileStatusInputElementDirective.js, ~/viewapp/pages/profile/directives/profileTabClickDirective.js, ~/viewapp/pages/profile/directives/scrollHorizontally.js, jquery/jquery.history.js, utilities/jquery.history.override.js, utilities/robloxTabs.js, StringTruncator.js, VotingPanel.js, GameItemCard.js, utilities/dialog.js, common/deviceMeta.js, AbuseReport/AbuseReportDispatcher.js

; // Thumbnails/ThumbnailUtils.js
Roblox = Roblox || {};
Roblox.ThumbnailUtils = (function() {
    var spinnerHtml = '<div class="thumbnail-loader"><span class="spinner spinner-default"></span></div>';
    var selector = ".thumbnail-loader";
    return {
        addLightsToScene: function(scene, camera) {
            var useDynamicLighting = false;
            var dynamicLightingFlag = $("#use-dynamic-thumbnail-lighting");
            if (dynamicLightingFlag !== null && dynamicLightingFlag.length > 0) {
                useDynamicLighting = dynamicLightingFlag.data("use-dynamic-thumbnail-lighting") === "True";
            }
            if (useDynamicLighting) {
                var ambient = new THREE.AmbientLight(0x444444);
                camera.add(ambient);
                var keylight = new THREE.DirectionalLight(0xd4d4d4);
                keylight.target = camera;
                keylight.position.set(-7.5, .5, -6.0).normalize();
                camera.add(keylight);
                var fillLight = new THREE.DirectionalLight(0xacacac);
                fillLight.target = camera;
                fillLight.position.set(20.0, 4.0, -0).normalize();
                camera.add(fillLight);
                var rimLight = new THREE.DirectionalLight(0xacacac);
                rimLight.target = camera;
                rimLight.position.set(0, 1, 1).normalize();
                camera.add(rimLight);
            } else {
                var ambient = new THREE.AmbientLight(0x878780);
                scene.add(ambient);
                var sunLight = new THREE.DirectionalLight(0xACACAC);
                sunLight.position.set(-0.671597898, 0.671597898, 0.312909544).normalize();
                scene.add(sunLight);
                var backLight = new THREE.DirectionalLight(0x444444);
                var backLightPos = new THREE.Vector3().copy(sunLight.position).negate().normalize();
                backLight.position.set(backLightPos);
                scene.add(backLight);
            }
            return {
                scene: scene,
                camera: camera,
            }
        }
    };
})();

; // extensions/ThreeDeeThumbnails.js
$(function() {
    var imageRetryDataElement = $("#image-retry-data");
    var gaLoggingPercent = imageRetryDataElement ? imageRetryDataElement.data("ga-logging-percent") : 0;
    var GoogleAnalyticsEvents_FireEvent = (window.GoogleAnalyticsEvents && GoogleAnalyticsEvents.FireEvent) || function() {};
    var GoogleAnalyticsEvents_FireEventPercentage = function(data) {
        if (Math.random() <= gaLoggingPercent / 100.0) {
            GoogleAnalyticsEvents_FireEvent(data);
        }
    }
    var minRenderDistanceDefault = 0.1;
    var maxRenderDistanceDefault = 1000;
    var loadingWaitBeforeShowingSpinner = 500;
    var maximumPollsToGet3DThumbnailJson = imageRetryDataElement ? imageRetryDataElement.data("image-retry-max-times") : 10;
    var retryInterval = imageRetryDataElement ? imageRetryDataElement.data("image-retry-timer") : 1500;
    var renderers = [];

    function getRenderer(container) {
        for (var n in renderers) {
            if (renderers[n].container == container) {
                return renderers[n].renderer;
            }
        }
        var renderObject = {
            container: container,
            renderer: new THREE.WebGLRenderer({
                antialias: true,
                alpha: true
            })
        };
        renderers.push(renderObject);
        return renderObject.renderer;
    }

    function addLightsToScene(scene, camera) {
        Roblox.ThumbnailUtils.addLightsToScene(scene, camera);
    }

    function clearContainer(container) {
        container.find("canvas").remove();
    }

    function isModerationMode(container) {
        return container.parent() ? typeof container.parent().data("moderation-mode") === "string" : false;
    }

    function loadObjAndMtl3D(modelHash, mtlHash, container, json, callBack, onError) {
        var renderer = getRenderer(container);
        var moderationMode = isModerationMode(container);
        var calculatedMaxRenderDistance = (new THREE.Vector3(json.aabb.max.x, json.aabb.max.y, json.aabb.max.z)).length() * 4;
        var maxRenderDistance = Math.max(calculatedMaxRenderDistance, maxRenderDistanceDefault);

        function containerWidth() {
            return container.parent().width();
        }

        function containerHeight() {
            return container.parent().height();
        }
        var fieldOfView = typeof json.camera.fov !== "undefined" ? json.camera.fov : 70;
        var camera = new THREE.PerspectiveCamera(fieldOfView, containerWidth() / containerHeight(), minRenderDistanceDefault, maxRenderDistance);
        var scene = new THREE.Scene();
        var controls;

        function render() {
            renderer.render(scene, camera);
        }

        function animate() {
            if (controls.enabled) {
                controls.update();
            }
            TWEEN.update();
            render();
            requestAnimationFrame(animate);
        }

        function setRendererSize() {
            camera.aspect = containerWidth() / containerHeight();
            camera.updateProjectionMatrix();
            renderer.setSize(containerWidth(), containerHeight());
        }

        function createCanvas() {
            renderer.setSize(containerWidth(), containerHeight());
            var canvas = renderer.domElement;
            var resizeTimer;
            $(window).resize(function() {
                clearTimeout(resizeTimer);
                resizeTimer = setTimeout(setRendererSize, 100);
            }).on("beforeunload", function() {
                $(canvas).hide();
            });
            return canvas;
        }

        function initializeControls() {
            var orbitControls = new THREE.OrbitControls(camera, container.get(0), json, 'static');
            if (moderationMode) {
                orbitControls.autoRotate = false;
                orbitControls.minDistance = 0.1;
                orbitControls.noPan = false;
                orbitControls.noKeys = false;
                orbitControls.noResetToInitialCameraPosition = true;
            } else {
                orbitControls.rotateSpeed = 1.5;
                orbitControls.zoomSpeed = 1.5;
                orbitControls.dynamicDampingFactor = 0.3;
            }
            orbitControls.addEventListener("change", render);
            return orbitControls;
        }

        function objAndMtlLoaded(modelObject) {
            addLightsToScene(scene, camera);
            scene.add(camera);
            scene.add(modelObject);
            var canvas = createCanvas();
            controls = initializeControls();
            render();
            animate();
            callBack(canvas);
        };
        var objMtlLoader = new THREE.OBJMTLLoader();
        objMtlLoader.load(modelHash, mtlHash, objAndMtlLoaded, undefined, onError);
    }
    $.fn.load3DThumbnail = function(callBack, onError) {
        var cancelled = false;

        function cancelLoading() {
            cancelled = true;
        }

        function getThumbnailJson(url, callBack, retries, options) {
            function retry(options) {
                options.realRegeneration = true;
                if (retries-- > 0) {
                    options.retriesDone++;
                    setTimeout(function() {
                        getThumbnailJson(url, callBack, retries, options);
                    }, retryInterval);
                } else {
                    var gap = new Date().getTime() - options.start;
                    GoogleAnalyticsEvents_FireEventPercentage(["ThumbnailGenTime", "3D", "Gave Up", gap]);
                    GoogleAnalyticsEvents_FireEventPercentage(["ThumbnailGenRetries", "3D", "Gave Up", options.retriesDone]);
                }
            }

            function success(data, options) {
                var gap = new Date().getTime() - options.start;
                if (data.Final) {
                    $.getJSON(data.Url, function(json) {
                        if (options.realRegeneration) {
                            GoogleAnalyticsEvents_FireEventPercentage(["ThumbnailGenTime", "3D", "Success", gap]);
                            GoogleAnalyticsEvents_FireEventPercentage(["ThumbnailGenRetries", "3D", "Success", options.retriesDone]);
                        }
                        callBack(json, options);
                    }).fail(function() {
                        GoogleAnalyticsEvents_FireEventPercentage(["ThumbnailGenErrors", "3D", "Failure", data.Url]);
                        GoogleAnalyticsEvents_FireEventPercentage(["ThumbnailGenTime", "3D", "Failure", gap]);
                        GoogleAnalyticsEvents_FireEventPercentage(["ThumbnailGenRetries", "3D", "Failure", options.retriesDone]);
                        onError("3D Thumbnail failed to load");
                    });
                } else {
                    retry(options);
                }
            }
            $.ajax({
                url: url + "&_=" + $.now(),
                method: "GET",
                crossDomain: true,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                xhrFields: {
                    withCredentials: true
                },
                cache: false
            }).success(function(data) {
                success(data, options);
            }).fail(function() {
                retry(options);
            });
        }
        this.each(function() {
            var container = $(this);
            try {
                var loadThreeDee = function() {
                    var options = {
                        start: new Date().getTime(),
                        realRegeneration: false,
                        retriesDone: 0
                    };
                    var jsonUrl = Roblox.Endpoints.generateAbsoluteUrl(container.data("3d-url"), null, true);
                    if (!jsonUrl) {
                        return;
                    }
                    clearContainer(container);
                    var loaderTimeout;

                    function cancelLoaderUI() {
                        if (loaderTimeout) {
                            clearTimeout(loaderTimeout);
                            loaderTimeout = undefined;
                        }
                    }

                    function startLoaderUI() {
                        loaderTimeout = setTimeout(function() {
                            if (!cancelled) {
                                Roblox.ThumbnailSpinner.show(container);
                            }
                        }, loadingWaitBeforeShowingSpinner);
                    }

                    function endLoaderUI() {
                        cancelLoaderUI();
                        Roblox.ThumbnailSpinner.hide(container);
                    }

                    function disposeRendererWhenCanvasRemoved(canvas) {
                        var observer = new MutationObserver(function(mutations) {
                            mutations.forEach(function(mutation) {
                                var removedNodes = mutation.removedNodes;
                                if (mutation.type === 'childList') {
                                    for (var i = 0; i < removedNodes.length; ++i) {
                                        if (removedNodes[i] === canvas) {
                                            var renderer = getRenderer(container);
                                            renderer.forceContextLoss();
                                            observer.disconnect();
                                            return;
                                        }
                                    }
                                }
                            });
                        });
                        observer.observe(canvas.parentNode, {
                            childList: true
                        });
                    }

                    function updateContainer(json, options) {
                        var start = new Date().getTime();
                        loadObjAndMtl3D(json.obj, json.mtl, container, json, function(canvas) {
                            clearContainer(container);
                            if (!cancelled) {
                                endLoaderUI();
                                container.append(canvas);
                                disposeRendererWhenCanvasRemoved(canvas);
                                var gap = new Date().getTime() - start;
                                if (options.realRegeneration) {
                                    GoogleAnalyticsEvents_FireEventPercentage(["ThumbnailInBrowserRenderTime", "3D", "Success", gap]);
                                }
                                callBack(canvas, options);
                            }
                        }, onError);
                    }
                    startLoaderUI();
                    getThumbnailJson(jsonUrl, updateContainer, maximumPollsToGet3DThumbnailJson, options);
                };
                loadThreeDee();
            } catch (e) {
                onError(e);
            }
        });
        return {
            cancel: cancelLoading
        };
    };
});

; // extensions/AnimatedThumbnails.js
$(function() {
    var imageRetryDataElement = $("#image-retry-data");
    var maximumPollsToGetAnimatedThumbnailJson = 10;
    var gaLoggingPercent = imageRetryDataElement ? imageRetryDataElement.data("ga-logging-percent") : 0;
    var GoogleAnalyticsEvents_FireEvent = (window.GoogleAnalyticsEvents && GoogleAnalyticsEvents.FireEvent) || function() {};
    var GoogleAnalyticsEvents_FireEventPercentage = function(data) {
        if (Math.random() <= gaLoggingPercent / 100.0) {
            GoogleAnalyticsEvents_FireEvent(data);
        }
    }
    var loadingWaitBeforeShowingSpinner = 500;
    var retryInterval = 1500;
    var animationFrameId = null;

    function clearContainer(container) {
        container.find("canvas").remove();
    }
    var minRenderDistanceDefault = 0.1;
    var maxRenderDistanceDefault = 1000;
    var renderers = [];
    var numOfLoops = 0;

    function getRenderer(container) {
        for (var n in renderers) {
            if (renderers[n].container === container) {
                return renderers[n].renderer;
            }
        }
        var renderObject = {
            container: container,
            renderer: new THREE.WebGLRenderer({
                antialias: true,
                alpha: true
            })
        };
        renderers.push(renderObject);
        return renderObject.renderer;
    }

    function addLightsToScene(scene, camera) {
        Roblox.ThumbnailUtils.addLightsToScene(scene, camera);
    }

    function loadObjAndMtlAnimatedAsset(container, json, callBack, onError) {
        var renderer = getRenderer(container);
        var max = json.aabb.max;
        var calculatedMaxRenderDistance = (new THREE.Vector3(max.x, max.y, max.z)).length() * 4;
        var maxRenderDistance = Math.max(calculatedMaxRenderDistance, maxRenderDistanceDefault);

        function containerWidth() {
            return container.parent().width();
        }

        function containerHeight() {
            return container.parent().height();
        }
        var fieldOfView = typeof json.camera.fov !== "undefined" ? json.camera.fov : 70;
        var camera = new THREE.PerspectiveCamera(fieldOfView, containerWidth() / containerHeight(), minRenderDistanceDefault, maxRenderDistance);
        var scene = new THREE.Scene();
        scene.add(camera);
        var controls;
        var partsMap = {};
        var objMtlLoader = new THREE.OBJMTLLoader();
        var partNames = Object.keys(json.partobjs);
        var totalLoadedCount = 0;
        var itemsToLoadCount = partNames.length;
        for (var index = 0; index < partNames.length; ++index) {
            var partName = partNames[index];
            var partobjHash = json.partobjs[partName]["files"]["scene.obj"]["content"];
            var partmtlData = json.partobjs[partName]["files"]["scene.mtl"]["content"];

            function makeClosure(name) {
                return function(a, b) {
                    return loadPart(name, a, b);
                }
            }
            objMtlLoader.load(partobjHash, partmtlData, makeClosure(partName));
        }

        function loadPart(name, obj, mtl) {
            mtl.preload();
            var mtlLoaderCreator = new THREE.MTLLoader.MaterialCreator();
            mtlLoaderCreator.setMaterials(mtl);
            obj.children[1].geometry.computeBoundingBox();
            var boundingBox = obj.children[1].geometry.boundingBox;
            var position = new THREE.Vector3();
            position.subVectors(boundingBox.max, boundingBox.min);
            position.multiplyScalar(0.5);
            position.add(boundingBox.min);
            position.applyMatrix4(obj.children[0].matrixWorld);
            obj.children[1].geometry.applyMatrix(new THREE.Matrix4().makeTranslation(-(position.x), -(position.y), -(position.z)));
            obj.children[1].geometry.verticesNeedUpdate = true;
            obj.children[1].position.x = position.x;
            obj.children[1].position.y = position.y;
            obj.children[1].position.z = position.z;
            partsMap[name] = obj;
            obj.matrixAutoUpdate = false;
            scene.add(obj);
            totalLoadedCount++;
            checkTotalLoaded();
        };

        function checkTotalLoaded() {
            if (totalLoadedCount === itemsToLoadCount) {
                doneLoadingAll();
            }
        }

        function doneLoadingAll() {
            addLightsToScene(scene, camera);
            scene.add(camera);
            var canvas = createCanvas();
            controls = initializeControls(scene, camera);
            render();
            animate();
            callBack(canvas);
        }
        var frames = json.frames;
        var curFrame = 0;

        function render() {
            renderer.render(scene, camera);
        }

        function animate() {
            update();
            if (controls.enabled) {
                controls.update();
            }
            TWEEN.update();
            render();
            animationFrameId = requestAnimationFrame(animate);
        }

        function update() {
            controls.update();
            if (curFrame === frames.length) {
                curFrame = 0;
                numOfLoops += 1;
            }
            var animJson = frames[curFrame];
            for (var ii = 0; ii < partNames.length; ++ii) {
                var partPosition = animJson[partNames[ii]];
                var partObject = partsMap[partNames[ii]];
                if (typeof(partPosition) != 'undefined' && typeof(partObject) != 'undefined') {
                    partObject.children[1].position.set(partPosition.Position.x, partPosition.Position.y, partPosition.Position.z);
                    partObject.children[1].quaternion.set(partPosition.Rotation.x || partPosition.Rotation.X, partPosition.Rotation.y || partPosition.Rotation.Y, partPosition.Rotation.z || partPosition.Rotation.Z, partPosition.Rotation.w || partPosition.Rotation.W);
                    partObject.updateMatrix();
                }
            }
            curFrame++;
            scene.updateMatrixWorld
        }

        function setRendererSize() {
            camera.aspect = containerWidth() / containerHeight();
            camera.updateProjectionMatrix();
            renderer.setSize(containerWidth(), containerHeight());
        }

        function createCanvas() {
            renderer.setSize(containerWidth(), containerHeight());
            var canvas = renderer.domElement;
            var resizeTimer;
            $(window).resize(function() {
                clearTimeout(resizeTimer);
                resizeTimer = setTimeout(setRendererSize, 100);
            }).on("beforeunload", function() {
                $(canvas).hide();
            });
            return canvas;
        }

        function initializeControls(scene, camera) {
            var animatedOrbitControls = new THREE.OrbitControls(camera, container.get(0), json, 'animated');
            animatedOrbitControls.addEventListener("change", render);
            return animatedOrbitControls;
        }
    }
    $.fn.getNumOfLoops = function() {
        return numOfLoops;
    }
    $.fn.clearCurrentAnimationFrame = function() {
        numOfLoops = 0;
        cancelAnimationFrame(animationFrameId);
    }
    $.fn.loadAnimatedThumbnail = function(callBack, onError, jsonUrl) {
        var cancelled = false;

        function cancelLoading() {
            cancelled = true;
        }

        function getThumbnailJson(url, callBack, retries, options) {
            function retry(options) {
                options.realRegeneration = true;
                if (retries-- > 0) {
                    options.retriesDone++;
                    setTimeout(function() {
                        getThumbnailJson(url, callBack, retries, options);
                    }, retryInterval);
                } else {
                    var gap = new Date().getTime() - options.start;
                    GoogleAnalyticsEvents_FireEventPercentage(["ThumbnailGenTime", "Animated", "Gave Up", gap]);
                    GoogleAnalyticsEvents_FireEventPercentage(["ThumbnailGenRetries", "Animated", "Gave Up", options.retriesDone]);
                }
            }

            function success(data, options) {
                var gap = new Date().getTime() - options.start;
                if (data.Final) {
                    fetch(data.Url).then(function(response) {
                        return response.json();
                    }).then(function(json) {
                        if (options.realRegeneration) {
                            GoogleAnalyticsEvents_FireEventPercentage(["ThumbnailGenTime", "Animated", "Success", gap]);
                            GoogleAnalyticsEvents_FireEventPercentage(["ThumbnailGenRetries", "Animated", "Success", options.retriesDone]);
                        }
                        callBack(json, options);
                    }).catch(function(error) {
                        console.log(error)
                        GoogleAnalyticsEvents_FireEventPercentage(["ThumbnailGenErrors", "Animated", "Failure", data.Url]);
                        GoogleAnalyticsEvents_FireEventPercentage(["ThumbnailGenTime", "Animated", "Failure", gap]);
                        GoogleAnalyticsEvents_FireEventPercentage(["ThumbnailGenRetries", "Animated", "Failure", options.retriesDone]);
                        onError("Animated Thumbnail failed to load");
                    });
                } else {
                    retry(options);
                }
            }
            $.ajax({
                url: url + "&_=" + $.now(),
                method: "GET",
                crossDomain: true,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                xhrFields: {
                    withCredentials: true
                },
                cache: false
            }).success(function(data) {
                success(data, options);
            }).fail(function() {
                retry(options);
            });
        }
        this.each(function() {
            var container = $(this);
            try {
                var loadAnimated = function() {
                    var options = {
                        start: new Date().getTime(),
                        realRegeneration: false,
                        retriesDone: 0
                    };
                    if (jsonUrl === null || jsonUrl === "") {
                        jsonUrl = Roblox.Endpoints.generateAbsoluteUrl(container.data("animated-asset-url"), null, true);
                    }
                    if (!jsonUrl) {
                        return;
                    }
                    clearContainer(container);
                    var loaderTimeout;

                    function cancelLoaderUI() {
                        if (loaderTimeout) {
                            clearTimeout(loaderTimeout);
                            loaderTimeout = undefined;
                        }
                    }

                    function startLoaderUI() {
                        loaderTimeout = setTimeout(function() {
                            if (!cancelled) {
                                Roblox.ThumbnailSpinner.show(container);
                            }
                        }, loadingWaitBeforeShowingSpinner);
                    }

                    function endLoaderUI() {
                        cancelLoaderUI();
                        Roblox.ThumbnailSpinner.hide(container);
                    }

                    function disposeRendererWhenCanvasRemoved(canvas) {
                        var observer = new MutationObserver(function(mutations) {
                            mutations.forEach(function(mutation) {
                                var removedNodes = mutation.removedNodes;
                                if (mutation.type === 'childList') {
                                    for (var i = 0; i < removedNodes.length; ++i) {
                                        if (removedNodes[i] === canvas) {
                                            var renderer = getRenderer(container);
                                            renderer.forceContextLoss();
                                            observer.disconnect();
                                            return;
                                        }
                                    }
                                }
                            });
                        });
                        observer.observe(canvas.parentNode, {
                            childList: true
                        });
                    }

                    function updateContainer(json, options) {
                        numOfLoops = 0;
                        var start = new Date().getTime();
                        loadObjAndMtlAnimatedAsset(container, json, function(canvas) {
                            clearContainer(container);
                            if (!cancelled) {
                                endLoaderUI();
                                container.append(canvas);
                                disposeRendererWhenCanvasRemoved(canvas);
                                var gap = new Date().getTime() - start;
                                if (options.realRegeneration) {
                                    GoogleAnalyticsEvents_FireEventPercentage(["ThumbnailInBrowserRenderTime", "Animated", "Success", gap]);
                                }
                                callBack(canvas, options);
                            }
                        }, onError);
                    }
                    startLoaderUI();
                    getThumbnailJson(jsonUrl, updateContainer, maximumPollsToGetAnimatedThumbnailJson, options);
                };
                loadAnimated();
            } catch (e) {
                onError(e);
            }
        });
        return {
            cancel: cancelLoading
        };
    };
});

; // Thumbnails/ThumbnailView.js
if (typeof Roblox === "undefined") {
    Roblox = {};
}
Roblox.ThumbnailView = (function() {
    var useThreeDeeThumbsKey = "RobloxUse3DThumbnailsV2";
    var thumbnailList = [];
    var toggle3dButtonSelector = ".enable-three-dee";
    var webGlSupported = null;
    var tryItOnButtonSelector = ".try-it-on";

    function clearContainer(container) {
        var cleared = container.find("canvas");
        cleared.remove();
    }

    function reloadThumbnails(thumbnailList) {
        thumbnailList.forEach(function(thumb) {
            thumb.reload();
        });
    }

    function showSpinners(thumbnailList) {
        thumbnailList.forEach(function(thumb) {
            thumb.showSpinner();
        });
    }

    function checkWebglSupport() {
        if (webGlSupported === null) {
            try {
                var canvas = document.createElement("canvas");
                if (!!window.WebGLRenderingContext && (canvas.getContext("webgl") || canvas.getContext("experimental-webgl"))) {
                    webGlSupported = true;
                } else {
                    webGlSupported = false;
                }
            } catch (e) {
                webGlSupported = false;
            }
        }
        return webGlSupported;
    }

    function localStorageSupported() {
        if (Roblox && Roblox.LocalStorage) {
            return Roblox.LocalStorage.isAvailable();
        }
        return window.localStorage && localStorage.setItem && localStorage.getItem;
    }
    var displayThreeDee = false;
    var needsReloadFor2D = false;

    function syncCache() {
        if (localStorageSupported()) {
            if (localStorage.getItem(useThreeDeeThumbsKey) === "true") {
                displayThreeDee = true;
            } else {
                displayThreeDee = false;
                localStorage.setItem(useThreeDeeThumbsKey, "false");
            }
        }
    }

    function getUseThreeDeeThumbs(holder, isBundleAnimation) {
        if (!checkWebglSupport()) {
            return false;
        }
        if (!is3DAvailable(holder)) {
            return false;
        }
        if (isBundleAnimation) {
            return true;
        }
        return displayThreeDee;
    }

    function setUseThreeDeeThumbs(val, holder) {
        if (!checkWebglSupport()) {
            displayThreeDee = false;
        }
        if (!is3DAvailable(holder) && val === true) {
            return;
        }
        displayThreeDee = val;
        if (localStorageSupported()) {
            localStorage.setItem(useThreeDeeThumbsKey, val.toString());
        }
    }

    function is3DAvailable(el) {
        return typeof el.data("3d-thumbs-enabled") === "string" || el.hasClass("3d-thumbs-enabled");
    }

    function setupThumbnailHolder(container) {
        var currentLoader;
        var animatedJsonUrl = "";
        var staticJsonUrl = "";
        var threeDeeType = "static";
        var bundleAnimationContainer = $(".bundle-animation-btn-container");
        var isBundleAnimation = bundleAnimationContainer !== null && bundleAnimationContainer.length > 0;
        var bundleAnimationCtrl = isBundleAnimation ? bundleAnimation() : null;
        var tryItOnMode = false;

        function getSpan() {
            return container.find(".thumbnail-span");
        }

        function thumbnailSpan() {
            return container.find(".thumbnail-span-original");
        }

        function tryItOnSpan() {
            return container.find(".thumbnail-span-try-it-on");
        }

        function img(span) {
            return span.find("img");
        }

        function holder() {
            return container.find(".thumbnail-holder");
        }

        function toggle3dButton() {
            return container.find(toggle3dButtonSelector);
        }

        function tryOnButton() {
            return container.find(tryItOnButtonSelector);
        }
        threeDeeType = holder().data("3dtype") || "static";
        if (thumbnailSpan().length > 0) {
            copyDataIntoSpan(getSpan(), thumbnailSpan());
        }
        var playIcon = "<span class='icon-bigplay-fill'></span>";
        var stopIcon = "<span class='icon-bigstop-fill'></span>";
        var pauseIcon = "<span class='icon-pause-fill'></span>";

        function copyDataIntoSpan(span, spanToCopy) {
            span.html(spanToCopy.html());
            span.data("url", spanToCopy.data("url") ? spanToCopy.data("url") : "");
            span.data("3d-url", spanToCopy.data("3d-url") ? spanToCopy.data("3d-url") : "");
            span.data("orig-retry-url", spanToCopy.data("orig-retry-url") ? spanToCopy.data("orig-retry-url") : "");
            span.data("retry-url", spanToCopy.data("retry-url") ? spanToCopy.data("retry-url") : "");
            span.data("animated-asset-url", spanToCopy.data("animated-asset-url") ? spanToCopy.data("animated-asset-url") : "");
        }

        function threeDeeDescriptor() {
            return threeDeeType === "static" && "2D" || (isBundleAnimation ? pauseIcon : stopIcon);
        }

        function twoDeeDescriptor() {
            return threeDeeType === "static" && "3D" || playIcon;
        }

        function tryOnDescriptor() {
            if (!Roblox.Lang.ItemResources) {
                return tryItOnMode ? "Take Off" : "Try On";
            }
            return tryItOnMode ? Roblox.Lang.ItemResources["Action.TakeOff"] : Roblox.Lang.ItemResources["Action.TryOn"];
        }

        function showSpinner() {
            var span = getSpan();
            clearContainer(container);
            Roblox.ThumbnailSpinner.show(span);
            img(span).hide();
            span.one("thumbnailLoaded", function() {
                img(span).show();
                Roblox.ThumbnailSpinner.hide(span);
            });
        }

        function setupToggleButtons() {
            if (isBundleAnimation) {
                $(toggle3dButtonSelector).addClass("bundle-animation-play");
                toggle3dButton().html(isBundleAnimation && bundleAnimationCtrl.getIsLoopingThroughAnimations() ? threeDeeDescriptor() : twoDeeDescriptor());
            } else {
                toggle3dButton().html(getUseThreeDeeThumbs(holder(), isBundleAnimation) ? threeDeeDescriptor() : twoDeeDescriptor());
            }
            if (!getUseThreeDeeThumbs(holder(), isBundleAnimation)) {
                if (!is3DAvailable(holder())) {
                    toggle3dButton().css("visibility", "hidden");
                } else if (!webGlSupported) {
                    toggle3dButton().addClass("disabled");
                } else {
                    toggle3dButton().css("visibility", "visible");
                }
            }
            tryOnButton().html(tryOnDescriptor());
        }

        function loadSuccess(canvas) {
            currentLoader = undefined;
            container.find("canvas").not(canvas).remove();
        }

        function loadFailure() {
            currentLoader = undefined;
            toggle3dButton().addClass("disabled");
        }

        function clickToggleButton() {
            if (currentLoader) {
                currentLoader.cancel();
            }
            toggleTryOnMode();
            var original = getUseThreeDeeThumbs(holder(), isBundleAnimation);
            setUseThreeDeeThumbs(!original, holder());
            if (original !== getUseThreeDeeThumbs(holder(), isBundleAnimation)) {
                if (staticJsonUrl !== "") {
                    container.load(staticJsonUrl + "&_=" + $.now(), function() {
                        innerLoad();
                    });
                } else {
                    innerLoad();
                }
            }
        }

        function toggleTryOnMode() {
            if (thumbnailSpan().length > 0) {
                tryOnButton().html(tryOnDescriptor());
                if (tryItOnMode) {
                    copyDataIntoSpan(getSpan(), tryItOnSpan());
                } else {
                    copyDataIntoSpan(getSpan(), thumbnailSpan());
                }
            }
        }

        function outerLoad() {
            if (isBundleAnimation) {
                bundleAnimationCtrl.startAnimationLoop();
            } else {
                innerLoad();
            }
        }

        function onSuccess(thumbnailType) {
            return function(canvas, options) {
                loadSuccess(canvas);
                var endTime = new Date().getTime();
                Roblox.ThumbnailMetrics.logFinalThumbnailTime(endTime - options.start, thumbnailType);
            }
        }

        function onFailure(thumbnailType) {
            return function() {
                loadFailure();
                Roblox.ThumbnailMetrics.logThumbnailTimeout(thumbnailType);
            }
        }

        function innerLoad(span) {
            var is3D = getUseThreeDeeThumbs(holder(), isBundleAnimation);
            if (!span) {
                span = getSpan();
            }
            if (is3D) {
                clearContainer(container);
                img(span).hide();
                if (threeDeeType === "static") {
                    currentLoader = span.load3DThumbnail(onSuccess("3dThumbnail"), onFailure("3dThumbnail"));
                } else {
                    currentLoader = span.clearCurrentAnimationFrame();
                    currentLoader = span.loadAnimatedThumbnail(onSuccess("AnimationThumbnail"), onFailure("AnimationThumbnail"), animatedJsonUrl);
                }
                img(span).hide();
            } else {
                if (needsReloadFor2D) {
                    needsReloadFor2D = false;
                    var origRetryUrl = span.data("orig-retry-url");
                    span.data("retry-url", origRetryUrl);
                }
                var retryUrl = span.data("retry-url");
                if (retryUrl) {
                    showSpinner(span);
                    span.loadRobloxThumbnails();
                } else {
                    clearContainer(container);
                    Roblox.ThumbnailSpinner.hide(holder());
                    img(span).show();
                }
            }
            setupToggleButtons();
        }

        function reload() {
            var span = getSpan();
            needsReloadFor2D = true;
            var is3D = getUseThreeDeeThumbs(holder(), isBundleAnimation);
            if (is3D) {
                innerLoad(span);
                return;
            }
            var origRetryUrl = span.data("orig-retry-url");
            if (typeof origRetryUrl !== 'undefined') {
                span.data("retry-url", origRetryUrl);
                innerLoad(span);
            } else {
                if (staticJsonUrl !== "") {
                    holder().data("url", staticJsonUrl);
                }
                var url = holder().data("url");
                if (url) {
                    container.load(url + "&_=" + $.now(), function() {
                        innerLoad(span);
                    });
                }
            }
        }

        function bundleAnimation() {
            var animationsList = $(".bundle-animation-btn");
            var isLoopingThroughAnimations = false;
            var currAnimationLoopIndex = 0;
            var animationLoopIntervalId;
            var animationLoopFadeTimeout;
            var currAnimationLoopTime = 0;
            var animationLoopInterval = 200;
            var currNumOfAnimationLoops = 0;
            var maxNumOfAnimationLoops = -1;
            var maxIndividualLoops = 3;
            var maxIndividualLoopTime = 10000;

            function getIsLoopingThroughAnimations() {
                return isLoopingThroughAnimations;
            }

            function currentAnimationName() {
                return container.find("#current-animation-name");
            }

            function startAnimationLoop() {
                bundleAnimationContainer.removeClass("hidden");
                currentAnimationName().removeClass("hidden");
                isLoopingThroughAnimations = true;
                showSpinner();
                playAnimationLoop(true);
                clearInterval(animationLoopIntervalId);
                animationLoopIntervalId = setInterval(playAnimationLoop, animationLoopInterval);
            }

            function pauseAnimationLoop() {
                clearTimeout(animationLoopFadeTimeout);
                clearInterval(animationLoopIntervalId);
                currAnimationLoopTime = 0;
                currNumOfAnimationLoops = 0;
            }

            function playAnimationLoop(isForcePlay) {
                if (!isLoopingThroughAnimations) {
                    pauseAnimationLoop();
                } else {
                    var span = getSpan();
                    currAnimationLoopTime += animationLoopInterval;
                    if (span.getNumOfLoops() >= maxIndividualLoops || isForcePlay || currAnimationLoopTime > maxIndividualLoopTime) {
                        if (animationsList !== null && currAnimationLoopIndex >= animationsList.length) {
                            currNumOfAnimationLoops++;
                            currAnimationLoopIndex = 0;
                        }
                        var fadeOutTime = animationLoopInterval - 100;
                        fadeOutTime = fadeOutTime > 0 ? fadeOutTime : 0;
                        span.fadeOut(fadeOutTime);
                        animationLoopFadeTimeout = setTimeout(function() {
                            changeThumbnailFromBundleItem($(animationsList[currAnimationLoopIndex]), true);
                            currAnimationLoopIndex += 1;
                            currAnimationLoopTime = 0;
                            span.fadeIn(500);
                            if (maxNumOfAnimationLoops !== -1 && currNumOfAnimationLoops >= maxNumOfAnimationLoops) {
                                pauseAnimationLoop();
                                bundleAnimationContainer.addClass("hidden");
                                currentAnimationName().addClass("hidden");
                                isLoopingThroughAnimations = false;
                                toggle3dButton().html(twoDeeDescriptor());
                            }
                        }, fadeOutTime);
                    }
                }
            }

            function changeThumbnailFromBundleItem(target, myIsLoopingThroughAnimations) {
                var animatedUrl = target.attr("data-animated-asset-url");
                var staticImgUrl = target.attr("data-static-url");
                var threeDeeType = target.attr("data-three-dee-type");
                currAnimationLoopIndex = parseInt(target.attr("data-index"));
                var animationName = target.attr("data-name");
                currentAnimationName().html(animationName);
                changeThumbnail(staticImgUrl, animatedUrl, threeDeeType, myIsLoopingThroughAnimations);
                $(".bundle-animation-btn.selected").removeClass("selected");
                target.addClass("selected");
            }

            function changeThumbnail(myStaticImgUrl, myAnimatedUrl, myThreeDeeType, myIsLoopingThroughAnimations) {
                animatedJsonUrl = myAnimatedUrl;
                staticJsonUrl = myStaticImgUrl;
                threeDeeType = myThreeDeeType;
                isLoopingThroughAnimations = myIsLoopingThroughAnimations;
                reload();
            }

            function clickToggleAnimationLoopButton() {
                if (isLoopingThroughAnimations) {
                    isLoopingThroughAnimations = false;
                    toggle3dButton().html(isLoopingThroughAnimations ? threeDeeDescriptor() : twoDeeDescriptor());
                } else {
                    startAnimationLoop();
                }
            }
            container.on("click", ".bundle-animation-play", function() {
                if (!$(this).hasClass("disabled") && isBundleAnimation) {
                    bundleAnimationCtrl.clickToggleAnimationLoopButton();
                }
            });
            return {
                startAnimationLoop: startAnimationLoop,
                getIsLoopingThroughAnimations: getIsLoopingThroughAnimations,
                clickToggleAnimationLoopButton: clickToggleAnimationLoopButton,
                changeThumbnailFromBundleItem: changeThumbnailFromBundleItem,
                changeThumbnail: changeThumbnail
            };
        }
        var thumbObject = {
            container: container,
            holder: holder,
            span: getSpan,
            button: toggle3dButton,
            showSpinner: showSpinner,
            outerLoad: outerLoad,
            reload: reload,
            bundleAnimationCtrl: bundleAnimationCtrl
        };
        container.on("click", toggle3dButtonSelector, function() {
            if (!$(this).hasClass("disabled") && !isBundleAnimation) {
                clickToggleButton();
            }
        }).on("click", tryItOnButtonSelector, function() {
            tryItOnMode = !tryItOnMode;
            toggleTryOnMode();
            reload();
        });
        outerLoad();
        thumbnailList.push(thumbObject);
        return thumbObject;
    }
    $(".bundle-animation-btn").click(function(e) {
        var target = $(e.currentTarget);
        thumbnailList[0].bundleAnimationCtrl.changeThumbnailFromBundleItem(target, false);
    });
    syncCache();

    function init(thumbnailHolderSelector) {
        $(thumbnailHolderSelector).each(function() {
            var el = $(this).parent();
            setupThumbnailHolder(el);
        });
    }
    $(function() {
        init(".thumbnail-holder");
    });
    return {
        showSpinner: function() {
            return showSpinners(thumbnailList);
        },
        reloadThumbnail: function() {
            return reloadThumbnails(thumbnailList);
        },
        setupDelayedThumbnailHolders: function() {
            init(".delayed-thumbnail-holder")
        }
    };
})();

; // Thumbnails/ThumbnailSpinner.js
Roblox = Roblox || {};
Roblox.ThumbnailSpinner = (function() {
    var spinnerHtml = '<div class="thumbnail-loader"><span class="spinner spinner-default"></span></div>';
    var selector = ".thumbnail-loader";
    return {
        show: function(div) {
            if (div.find(selector).length > 0) {
                return;
            }
            var spinner = $(spinnerHtml);
            div.append(spinner);
        },
        hide: function(div) {
            div.find(selector).remove();
        }
    };
})();

; // ~/Generated/js/Roblox_TranslationResources_Feature_ProfileResources_en_us_standard.js
var Roblox = Roblox || {};
Roblox.Lang = Roblox.Lang || {};
Roblox.Lang['Feature.Profile'] = {
    "Action.Accept": "Accept",
    "Action.AddFriend": "Add friend",
    "Action.BlockUser": "Block user",
    "Action.CancelBlockUser": "Cancel",
    "Action.Chat": "Chat",
    "Action.Close": "Close",
    "Action.ConfirmBlockUser": "Block",
    "Action.ConfirmUnblockUser": "Unblock",
    "Action.Favorites": "Favorites",
    "Action.Follow": "Follow",
    "Action.GridView": "Grid View",
    "Action.ImpersonateUser": "Impersonate user",
    "Action.Inventory": "Inventory",
    "Action.JoinGame": "Join",
    "Action.Message": "Message",
    "Action.Pending": "Pending",
    "Action.Save": "Save",
    "Action.SeeAll": "See All",
    "Action.SeeLess": "See Less",
    "Action.SeeMore": "See More",
    "Action.SlideshowView": "Slideshow View",
    "Action.Trade": "Trade",
    "Action.TradeItems": "Trade items",
    "Action.UnblockUser": "Unblock User",
    "Action.Unfollow": "Unfollow",
    "Action.Unfriend": "Unfriend",
    "Action.UpdateStatus": "Update Status",
    "Description.AboutSuccess": "Successfully updated description.",
    "Description.AboutWarning": "Keep yourself safe, do not share personal details online.",
    "Description.BlockUserFooter": "When you've blocked a user, neither of you can directly contact the other.",
    "Description.BlockUserPrompt": "Are you sure you want to block this user?",
    "Description.ChangeAlias": "Only you can see this information",
    "Description.Error": "Unable to update description, please try again later.",
    "Description.PlaceholderStatus": "Tell the Roblox community about what you like to make, build, and explore...",
    "Description.RecognizeFriendsByCustomName": "Recognize friends more easily by setting a custom name. Names imported from contacts and custom names are only visible to you.",
    "Description.SetCustomName": "Set a custom name for <font weight=\"medium\">{displayName}</font>.",
    "Description.SetCustomName2": "Set a custom name for",
    "Description.SetCustomNameNoDisplayName": "Set a custom name.",
    "Description.UnblockUserPrompt": "Are you sure you want to unblock this user?",
    "Heading.AboutTab": "About",
    "Heading.BlockUserTitle": "Warning",
    "Heading.Collections": "Collections",
    "Heading.CurrentlyWearing": "Currently Wearing",
    "Heading.FavoriteGames": "Favorites",
    "Heading.Friends": "Friends",
    "Heading.FriendsNum": "Friends ({friendsCount})",
    "Heading.Games": "Experiences",
    "Heading.GameTitle": "Experiences",
    "Heading.Groups": "Communities",
    "Heading.PlayerAssetsBadges": "Badges",
    "Heading.PlayerAssetsClothing": "Clothing",
    "Heading.PlayerAssetsModels": "Models",
    "Heading.PlayerAssetsModelsAndPackages": "Models & Packages",
    "Heading.PlayerBadge": "Badges",
    "Heading.Profile": "Profile",
    "Heading.ProfileGroups": "Communities",
    "Heading.RobloxBadge": "Roblox Badges",
    "Heading.Statistics": "Statistics",
    "Label.About": "About",
    "Label.Alias": "Alias",
    "Label.BlockWarningBody": "Are you sure you want to block this user?",
    "Label.BlockWarningConfirm": "Block",
    "Label.BlockWarningFooter": "When you've blocked a user, neither of you can directly contact the other.",
    "Label.Cancel": "Cancel",
    "Label.ChangeAlias": "Set Alias",
    "Label.Creations": "Creations",
    "Label.CustomizeName": "Customize name",
    "Label.CustomizeNamePlaceholder": "Custom Name",
    "Label.CustomName": "Custom Name",
    "Label.Followers": "Followers",
    "Label.Following": "Following",
    "Label.ForumPosts": "Forum Posts",
    "Label.Friends": "Friends",
    "Label.GridView": "Grid View",
    "Label.JoinDate": "Join Date",
    "Label.LoadMore": "Load More",
    "Label.Members": "Members",
    "Label.PastUsername": "Past Usernames",
    "Label.PastUsernames": "Previous usernames",
    "Label.PlaceVisits": "Place Visits",
    "Label.Playing": "Active",
    "Label.QRCodeFriendRequest": "Sent from your QR code",
    "Label.Quotation": "\"{userStatus}\"",
    "Label.Rank": "Rank",
    "Label.ReadMore": "Read More",
    "Label.ReportAbuse": "Report abuse",
    "Label.ShowLess": "Show Less",
    "Label.SlideshowView": "Slideshow View",
    "Label.UnblockWarningBody": "Are you sure you want to unblock this user?",
    "Label.UnblockWarningConfirm": "Unblock",
    "Label.Visits": "Visits",
    "Label.WarningTitle": "Warning",
    "Message.AcceptFriendRequestError": "Unable to accept friend request.",
    "Message.AliasHasError": "An error has occurred. Please try again later",
    "Message.AliasIsModerated": "Please avoid using full names or offensive language.",
    "Message.BlockError": "Unable to block user. You may have blocked too many people.",
    "Message.BlockRequestError": "Unable to block user.",
    "Message.ChangeStatus": "What are you up to?",
    "Message.ErrorBlockLimit": "Operation failed! You may have blocked too many people.",
    "Message.ErrorGeneral": "Something went wrong. Please check back in a few minutes.",
    "Message.FollowError": "Unable to follow user.",
    "Message.ImpersonateUserError": "Unable to impersonate user.",
    "Message.InvalidAliasError": "Name cannot be saved. Try another name.",
    "Message.NoCreation": "{username} has no creations.",
    "Message.RemoveFriendError": "Unable to unfriend user.",
    "Message.SendFriendRequestError": "Unable to send friend request.",
    "Message.Sharing": "Sharing...",
    "Message.UnfollowError": "Unable to unfollow user.",
    "Message.UpdateStatusError": "Unable to update status.",
    "Response.TooManyAttempts": "Too many attempts. Please try again later.",
    "SetCustomName2": "Set a custom name for",
    "Tooltip.CustomNameProfile": "Recognize friends more easily by setting a custom name."
};
Roblox.Lang['ProfileResources'] = Roblox.Lang['Feature.Profile'];

; // ~/viewapp/pages/profile/profile.js
"use strict";
var profile = angular.module("profile", ["modal", "socialLinksJumbotron", "thumbnails", "captchaV2", "presence"]).config(["languageResourceProvider", function(languageResourceProvider) {
    var translationProvider = new Roblox.TranslationResourceProvider();
    var itemResources = translationProvider.getTranslationResource('Feature.Item');
    var profileResources = translationProvider.getTranslationResource('Feature.Profile');
    languageResourceProvider.setTranslationResources([itemResources, profileResources]);
}]);

; // utilities/datetime/formatDateTimesI18n.js
"use strict";
Roblox = Roblox || {};
Roblox.FormatDateTimesI18n = (function() {
    document.addEventListener('DOMContentLoaded', function() {
        var f = new Roblox.Intl().getDateTimeFormatter();
        var elementsToFormatDateTime = document.getElementsByClassName("date-time-i18n");
        for (var i = 0; i < elementsToFormatDateTime.length; i++) {
            var data = elementsToFormatDateTime[i].getAttribute("data-date-time-i18n-value");
            var format = elementsToFormatDateTime[i].getAttribute("data-date-time-i18n-format");
            var displayValue;
            if (format === "custom") {
                try {
                    var validJsonOptions = elementsToFormatDateTime[i].getAttribute("data-date-time-i18n-options").replace(/'/g, '"');
                    var options = JSON.parse(validJsonOptions);
                    displayValue = f.getCustomDateTime(data, options);
                } catch (error) {
                    displayValue = f.getShortDate(data);
                }
            } else if (format === "full") {
                displayValue = f.getFullDate(data);
            } else {
                displayValue = f.getShortDate(data);
            }
            elementsToFormatDateTime[i].innerHTML = displayValue;
        }
        var elementsToShowOnDateLoad = document.querySelectorAll(".wait-for-i18n-format-render");
        for (var j = 0; j < elementsToShowOnDateLoad.length; j++) {
            elementsToShowOnDateLoad[j].classList.remove("invisible");
        }
    });
})();

; // ~/viewapp/pages/profile/services/profileUtilitiesConstantsServices.js
'use strict';
profile.factory('profileUtilitiesConstantsServices', ['languageResource', function(lang) {
    return {
        layout: {
            linkName: lang.get("Action.SeeMore"),
            nameOfOpen: lang.get("Action.SeeMore"),
            nameOfClose: lang.get("Action.SeeLess")
        },
        userModal: {
            block: {
                titleText: lang.get("Heading.BlockUserTitle"),
                bodyText: lang.get("Description.BlockUserPrompt"),
                actionButtonText: lang.get("Action.ConfirmBlockUser"),
                neutralButtonText: lang.get("Action.CancelBlockUser"),
                footerText: lang.get("Description.BlockUserFooter")
            },
            unblock: {
                titleText: lang.get("Heading.BlockUserTitle"),
                bodyText: lang.get("Description.UnblockUserPrompt"),
                actionButtonText: lang.get("Action.ConfirmUnblockUser"),
                neutralButtonText: lang.get("Action.CancelBlockUser")
            },
            error: {
                blockLimitError: lang.get("Message.ErrorBlockLimit"),
                generalError: lang.get("Message.ErrorGeneral")
            },
            menu: {
                blockUserText: lang.get("Action.BlockUser"),
                unblockUserText: lang.get("Action.UnblockUser")
            },
            pastUsername: {
                titleText: lang.get("Label.PastUsername"),
                neutralButtonShow: false
            }
        },
        message: {
            acceptFriendRequestFailed: lang.get("Message.AcceptFriendRequestError"),
            sendFriendRequestFailed: lang.get("Message.SendFriendRequestError"),
            removeFriendFailed: lang.get("Message.RemoveFriendError"),
            followFailed: lang.get("Message.FollowError"),
            unfollowFailed: lang.get("Message.UnfollowError"),
            blockFailed: lang.get("Message.BlockError"),
            blockRequestFailed: lang.get("Message.BlockRequestError"),
            impersonateUserFailed: lang.get("Message.ImpersonateUserError"),
            updateStatusFailed: lang.get("Message.UpdateStatusError"),
            tooManyAttempts: lang.get("Response.TooManyAttempts")
        },
        errorCodes: {
            captchaNeeded: 14
        }
    };
}]);

; // ~/viewapp/pages/profile/services/profileService.js
"use strict";
profile.factory("profileService", ['httpService', '$rootScope', '$timeout', '$window', '$filter', 'localStorageService', function(httpService, $rootScope, $timeout, $window, $filter, localStorageService) {
    var profileData = {};
    var clearUserDataStoreCache = function() {
        if (localStorageService.storage()) {
            var userDataStoreUrls = [Roblox.EnvironmentUrls.friendsApi, Roblox.EnvironmentUrls.presenceApi];
            var keysToRemove = [];
            for (var i = 0; i < localStorageService.getLength(); i++) {
                var localStorageKey = localStorageService.getKey(i);
                for (var j = 0; j < userDataStoreUrls.length; j++) {
                    var userStoreUrl = userDataStoreUrls[j];
                    if (localStorageKey.indexOf(userStoreUrl) > -1) {
                        keysToRemove.push(localStorageKey);
                    }
                }
            }
            for (var k = 0; k < keysToRemove.length; k++) {
                localStorageService.removeLocalStorage(keysToRemove[k]);
            }
        }
    };
    var postToFriendsApi = function(path, data) {
        var urlConfig = {
            url: Roblox.EnvironmentUrls.friendsApi + path
        };
        clearUserDataStoreCache();
        return httpService.httpPost(urlConfig, data);
    };
    var formServiceUrls = {
        accountDescription: Roblox.EnvironmentUrls.accountInformationApi + "/v1/description"
    };
    var sendData = function(url, params, method, excludeCacheHeaders) {
        var urlConfig = {
            url: url,
            withCredentials: true
        }
        var data;
        switch (method) {
            case httpService.methods.get:
                urlConfig.noCache = !excludeCacheHeaders;
                return httpService.httpGet(urlConfig, params);
            case httpService.methods.post:
                urlConfig.headers = {
                    'Content-Type': 'application/x-www-form-urlencoded'
                };
                if (params != null) {
                    data = $.param(params);
                }
                return httpService.httpPost(urlConfig, data);
            case httpService.methods.patch:
                urlConfig.headers = {
                    'Content-Type': 'application/x-www-form-urlencoded'
                };
                if (params != null) {
                    data = $.param(params);
                }
                return httpService.httpPatch(urlConfig, data);
            case httpService.methods.delete:
                return httpService.httpDelete(urlConfig, params);
        }
    };
    return {
        acceptFriendRequestV2: function(targetUserId) {
            return postToFriendsApi("/v1/users/" + targetUserId + "/accept-friend-request");
        },
        sendFriendRequestV2: function(targetUserId, friendshipOriginSourceType) {
            var sourceTypeData = null;
            if (friendshipOriginSourceType) {
                sourceTypeData = {
                    friendshipOriginSourceType: friendshipOriginSourceType
                };
            }
            return postToFriendsApi("/v1/users/" + targetUserId + "/request-friendship", sourceTypeData);
        },
        removeFriendV2: function(targetUserId) {
            return postToFriendsApi("/v1/users/" + targetUserId + "/unfriend");
        },
        followV2: function(targetUserId, captchaData) {
            return postToFriendsApi("/v1/users/" + targetUserId + "/follow", captchaData);
        },
        unfollowV2: function(targetUserId) {
            return postToFriendsApi("/v1/users/" + targetUserId + "/unfollow");
        },
        toggleBlockUser: function(toUnblock, blockeeId) {
            var urlConfig;
            if (toUnblock) {
                urlConfig = {
                    url: Roblox.EnvironmentUrls.accountSettingsApi + "/v1/users/" + blockeeId + "/unblock"
                };
            } else {
                urlConfig = {
                    url: Roblox.EnvironmentUrls.accountSettingsApi + "/v1/users/" + blockeeId + "/block"
                };
            }
            return httpService.httpPost(urlConfig);
        },
        impersonateUser: function(userId) {
            var urlConfig = {
                url: Roblox.EnvironmentUrls.authApi + "/v2/users/" + userId + "/impersonate"
            };
            return httpService.httpPost(urlConfig, {});
        },
        updateStatus: function(url, msg) {
            var urlConfig = {
                url: url,
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8'
                }
            }
            var data = {
                status: msg,
                sendToFacebook: false
            };
            data = $.param(data);
            return httpService.httpPost(urlConfig, data);
        },
        setAccountInformationUrl: function(accountInformationApiDomain) {
            formServiceUrls["accountDescription"] = accountInformationApiDomain + "/v1/description";
        },
        getFriendshipCountV2: function(userId) {
            var urlConfig = {
                url: Roblox.EnvironmentUrls.friendsApi + "/v1/users/" + userId + "/friends/count",
                withCredentials: true,
                retryable: true
            };
            return httpService.httpGet(urlConfig);
        },
        getCollections: function(url, userId) {
            var urlConfig = {
                url: url
            };
            var params = {
                userId: userId
            };
            return httpService.httpGet(urlConfig, params);
        },
        getPlayerAssets: function(url, userId, assetTypeId) {
            var urlConfig = {
                url: url
            };
            var params = {
                assetTypeId: assetTypeId,
                userId: userId
            };
            return httpService.httpGet(urlConfig, params);
        },
        getPresence: function(userId) {
            var urlConfig = {
                url: Roblox.EnvironmentUrls.presenceApi + "/v1/presence/users",
                withCredentials: true,
                retryable: true
            };
            var params = {
                userIds: [userId]
            };
            return httpService.httpPost(urlConfig, params);
        },
        getPlayabilityStatus: function(universeId) {
            var urlConfig = {
                url: Roblox.EnvironmentUrls.gamesApi + "/v1/games/multiget-playability-status?universeIds=" + universeId,
                withCredentials: true,
                retryable: true
            };
            return httpService.httpGet(urlConfig);
        },
        setProfileData: function(data) {
            profileData = data;
            if (this._onLoad) {
                this._onLoad(profileData);
            }
        },
        onLoad: function(f) {
            this._onLoad = f;
        },
        getProfileData: function() {
            return profileData;
        },
        refreshLazyLoadImage: function() {
            $timeout(function() {
                $rootScope.$emit('lazyImg:refresh');
            });
        },
        getUpdatedHeaderData: function(url, userId) {
            var urlConfig = {
                url: url
            };
            var params = {
                userId: userId
            };
            return httpService.httpGet(urlConfig, params);
        }
    }
}]);

; // ~/viewapp/pages/profile/constants/profileJsonEndPoints.js
profile.constant("profileJsonEndPoints", {
    collections: Roblox.EnvironmentUrls.showcasesApi + "/v1/users/profile/robloxcollections-json",
    playerAssets: Roblox.EnvironmentUrls.showcasesApi + "/v1/users/profile/playerassets-json",
    profileHeaderData: "/users/profile/profileheader-json"
});

; // ~/viewapp/pages/profile/constants/profileFriendEvents.js
profile.constant("profileFriendEvents", {
    playerFriendAdd: "playerFriendAdd",
    playerFriendAccept: "playerFriendAccept",
    eventCtx: "userProfile",
});

; // ~/viewapp/pages/profile/controllers/profileBaseController.js
"use strict";
profile.controller('profileBaseController', ['$log', '$scope', function($log, $scope) {
    $scope.appMeta = {
        isI18nEnabled: Roblox.I18nData && Roblox.I18nData.isI18nEnabledForGroups
    };
}]);

; // ~/viewapp/pages/profile/controllers/profileUtilitiesController.js
"use strict";
profile.controller('profileUtilitiesController', ['$log', '$scope', 'modalService', 'profileService', 'profileJsonEndPoints', 'profileUtilitiesConstantsServices', function($log, $scope, modalService, profileService, profileJsonEndPoints, profileUtilitiesConstantsServices) {
    $scope.layoutContent = {
        showMore: true,
        linkName: profileUtilitiesConstantsServices.layout.linkName,
        nameOfOpen: profileUtilitiesConstantsServices.layout.nameOfOpen,
        nameOfClose: profileUtilitiesConstantsServices.layout.nameOfClose
    }
    $scope.toggleContent = function(showMore) {
        $scope.layoutContent.showMore = !showMore;
        $scope.layoutContent.linkName = showMore ? $scope.layoutContent.nameOfClose : $scope.layoutContent.nameOfOpen;
    };
    $scope.loadMore = function() {
        $scope.layoutContent.showMore = false;
    }
    $scope.showPastUsernames = function() {
        var modalConstants = profileUtilitiesConstantsServices.userModal;
        var options = modalConstants.pastUsername;
        options.bodyText = $scope.pageData.previousUsernames;
        modalService.open(options);
    }
    $scope.initializeDescription = function() {
        profileService.getDescription().then(function(result) {
            $scope.data.description = result.description;
            $scope.layout.showEditBox = $scope.isDescriptionEmpty() ? true : false;
            $scope.layout.showEditButton = $scope.isDescriptionEmpty() ? false : true;
        }, function(error) {
            $log.debug("Error getting personal description");
        });
    }
    $scope.updateDescription = function() {
        profileService.updateDescription($scope.data.description).then(function(result) {
            $scope.data.description = result.description;
            $scope.layout.showEditButton = true;
            $scope.layout.showEditBox = false;
        }, function(error) {
            $log.debug("Error updating personal description");
            $scope.layout.descriptionError = error.message;
        });
    }
    $scope.openEditBox = function() {
        $scope.layout.showEditButton = false;
        $scope.layout.showEditBox = true;
    }
    $scope.isDescriptionEmpty = function() {
        return ($scope.data.description == null || $scope.data.description.length === 0);
    }
    $scope.getPlayerAssets = function(assetTypeId) {
        var url = profileJsonEndPoints.playerAssets;
        return profileService.getPlayerAssets(url, $scope.pageData.profileUserId, assetTypeId).then(function(data) {
            $log.debug("my player assets: ", data);
            $scope.assets = data.assets;
            $scope.data.title = data.title;
            $scope.data.assetUrl = data.assetTypeInventoryUrl;
            $scope.layout.showSeeAllButton = data.isSeeAllHeaderButtonVisible;
            $scope.isProfileAssetAttributionEnabled = !!data.isProfileAssetAttributionEnabled;
            profileService.refreshLazyLoadImage();
        });
    };
    $scope.init = function() {
        if ($scope.layout) {
            return;
        }
        $scope.layout = {
            showSeeAllButton: false
        };
        $scope.data = {
            title: "",
            assetUrl: "",
            description: "",
        };
        $scope.pageData = profileService.getProfileData();
        $scope.assets = [];
    }
    $scope.init();
}]);

; // ~/viewapp/pages/profile/controllers/profileCollectionsController.js
"use strict";
profile.controller('profileCollectionsController', ['$scope', '$log', 'profileService', "profileJsonEndPoints", function($scope, $log, profileService, profileJsonEndPoints) {
    $scope.onClickTradeLink = function(event) {
        Roblox.EventStream.SendEvent("tradeEntryPoint", "profileInventory", {
            partnerId: $scope.pageData.profileUserId
        });
    }
    $scope.collections = [];
    $scope.pageData = profileService.getProfileData();
    $scope.getCollectionsData = function() {
        var url = profileJsonEndPoints.collections;
        return profileService.getCollections(url, $scope.pageData.profileUserId).then(function(data) {
            $log.debug("my collections: ", data);
            $scope.collections = data;
            profileService.refreshLazyLoadImage();
        });
    }
}]);

; // ~/viewapp/pages/profile/controllers/profileGridController.js
"use strict";
profile.controller('profileGridController', ['$scope', function($scope) {
    $scope.NumberOfVisibleRows = 0;
    $scope.isGridOn = false;
    $scope.visibleItems = 0;
    $scope.containerHeight = $scope.NumberOfVisibleRows * 232 + (8 * ($scope.NumberOfVisibleRows - 1));
    $scope.elementClassName = "";
    $scope.containerClassName = "";
    $scope.elementWidthWithPadding = 160;
    $scope.init = function(elementClassName, containerClassName) {
        $scope.elementClassName = elementClassName;
        $scope.containerClassName = containerClassName;
        $scope.loadMore();
        $scope.loadMore();
    }
    $scope.loadMore = function() {
        var start = $scope.visibleItems;
        var end = 6 * ($scope.NumberOfVisibleRows + 1);
        var sectionElements = angular.element.find("." + $scope.elementClassName);
        $scope.showImages(start, end, sectionElements);
        $scope.NumberOfVisibleRows++;
        $scope.visibleItems = end;
    }
    $scope.showImages = function(start, end, sectionElements) {
        for (var i = start; i < end; i++) {
            var selectedElement = angular.element(sectionElements).find("." + $scope.containerClassName + "[data-index=" + i + "] img");
            if (!angular.element(selectedElement).attr('src')) {
                angular.element(selectedElement).attr('src', angular.element(selectedElement).attr('data-src'));
            }
        }
    }
    $scope.updateDisplay = function(showGrid) {
        $scope.isGridOn = showGrid;
    }
}]);

; // ~/viewapp/pages/profile/directives/profileUtilitiesDirective.js
profile.directive("truncate", function() {
    return {
        scope: {
            layoutContent: "="
        },
        link: function(scope, element, attrs) {
            if (!scope.layoutContent) {
                scope.layoutContent = {};
            }
            scope.layoutContent.hasMoreContent = false;
            if (element.find("li") && element.find("li").length > 0) {
                var numberOfItem = element.find("li").length;
                var widthOfItem = element.find("li").width();
                var cols = Math.floor(element.width() / widthOfItem);
                if (cols + 1 < numberOfItem) {
                    scope.layoutContent.hasMoreContent = true;
                }
            }
        }
    }
});

; // ~/viewapp/pages/profile/directives/profileEmptyTabDirective.js
"use strict";
profile.directive("profileEmptyTab", function() {
    return {
        restrict: 'AC',
        link: function(scope, element) {
            scope.profileLayout = scope.profileLayout || {};
            if (element.children().length === 0) {
                scope.profileLayout.userHasNoCreations = true;
            }
        }
    }
});

; // ~/viewapp/pages/profile/directives/profileStatusInputElementDirective.js
"use strict";
profile.directive('statusInputElement', ['$timeout', function($timeout) {
    return {
        link: function(scope, element, attrs) {
            scope.$watch(function() {
                return scope.profileHeaderLayout.statusInputFocused;
            }, function(newVal, oldVal) {
                if (newVal === true) {
                    $timeout(function() {
                        element[0].focus();
                    });
                }
            });
            element.on('focus', function() {
                var self = this;
                if (scope.profileHeaderLayout.focusedElement != self) {
                    scope.profileHeaderLayout.focusedElement = self;
                    $timeout(function() {
                        self.select();
                    }, 10);
                }
            });
            element.on('blur', function() {
                scope.profileHeaderLayout.focusedElement = null;
                scope.profileHeaderLayout.statusInputFocused = false;
            });
        }
    };
}]);

; // ~/viewapp/pages/profile/directives/profileTabClickDirective.js
"use strict";
profile.directive('profileTabClick', ['profileService', function(profileService) {
    return {
        restrict: 'A',
        link: function(scope, element, attrs) {
            var tabs = element.find('.rbx-tab');
            tabs.click(function() {
                profileService.refreshLazyLoadImage();
            });
        }
    };
}]);

; // ~/viewapp/pages/profile/directives/scrollHorizontally.js
"use strict";
profile.directive('horizontalScrollBar', function() {
    return {
        restrict: 'A',
        link: function(scope, element, attrs) {
            var raw = element[0];
            element.bind('scroll', function() {
                if (raw.scrollLeft + raw.offsetWidth > raw.scrollWidth - 100) {
                    scope.$apply(attrs.horizontalScrollBar);
                }
            });
        }
    };
});

; // jquery/jquery.history.js
if (typeof window.console === 'undefined') {
    window.console = {};
}
if (typeof window.console.emulated === 'undefined') {
    if (typeof window.console.log === 'function') {
        window.console.hasLog = true;
    } else {
        if (typeof window.console.log === 'undefined') {
            window.console.log = function() {};
        }
        window.console.hasLog = false;
    }
    if (typeof window.console.debug === 'function') {
        window.console.hasDebug = true;
    } else {
        if (typeof window.console.debug === 'undefined') {
            window.console.debug = !window.console.hasLog ? function() {} : function() {
                var arr = ['console.debug:'];
                for (var i = 0; i < arguments.length; i++) {
                    arr.push(arguments[i]);
                };
                window.console.log.apply(window.console, arr);
            };
        }
        window.console.hasDebug = false;
    }
    if (typeof window.console.warn === 'function') {
        window.console.hasWarn = true;
    } else {
        if (typeof window.console.warn === 'undefined') {
            window.console.warn = !window.console.hasLog ? function() {} : function() {
                var arr = ['console.warn:'];
                for (var i = 0; i < arguments.length; i++) {
                    arr.push(arguments[i]);
                };
                window.console.log.apply(window.console, arr);
            };
        }
        window.console.hasWarn = false;
    }
    if (typeof window.console.error === 'function') {
        window.console.hasError = true;
    } else {
        if (typeof window.console.error === 'undefined') {
            window.console.error = function() {
                var msg = "An error has occured.";
                if (window.console.hasLog) {
                    var arr = ['console.error:'];
                    for (var i = 0; i < arguments.length; i++) {
                        arr.push(arguments[i]);
                    };
                    window.console.log.apply(window.console, arr);
                    msg = 'An error has occured. More information is available in your browser\'s javascript console.'
                }
                for (var i = 0; i < arguments.length; ++i) {
                    if (typeof arguments[i] !== 'string') {
                        break;
                    }
                    msg += "\n" + arguments[i];
                }
                if (typeof Error !== 'undefined') {
                    throw new Error(msg);
                } else {
                    throw (msg);
                }
            };
        }
        window.console.hasError = false;
    }
    if (typeof window.console.trace === 'function') {
        window.console.hasTrace = true;
    } else {
        if (typeof window.console.trace === 'undefined') {
            window.console.trace = function() {
                window.console.error('console.trace does not exist');
            };
        }
        window.console.hasTrace = false;
    }
    window.console.emulated = true;
}
(function($) {
    if (!($.History || false)) {
        $.History = {
            options: {
                debug: false
            },
            state: '',
            $window: null,
            $iframe: null,
            handlers: {
                generic: [],
                specific: {}
            },
            extractHash: function(url) {
                var hash = url.replace(/^[^#]*#/, '').replace(/^#+|#+$/, '');
                return hash;
            },
            getState: function() {
                var History = $.History;
                return History.state;
            },
            setState: function(state) {
                var History = $.History;
                state = History.extractHash(state)
                History.state = state;
                return History.state;
            },
            getHash: function() {
                var History = $.History;
                var hash = History.extractHash(window.location.hash || location.hash);
                return hash;
            },
            setHash: function(hash) {
                var History = $.History;
                hash = History.extractHash(hash);
                if (typeof window.location.hash !== 'undefined') {
                    if (window.location.hash !== hash) {
                        window.location.hash = hash;
                    }
                } else if (location.hash !== hash) {
                    location.hash = hash;
                }
                return hash;
            },
            go: function(to) {
                var History = $.History;
                to = History.extractHash(to);
                var hash = History.getHash(),
                    state = History.getState();
                if (to !== hash) {
                    History.setHash(to);
                } else {
                    if (to !== state) {
                        History.setState(to);
                    }
                    History.trigger();
                }
                return true;
            },
            hashchange: function(e) {
                var History = $.History;
                var hash = History.getHash();
                History.go(hash);
                return true;
            },
            bind: function(state, handler) {
                var History = $.History;
                if (handler) {
                    if (typeof History.handlers.specific[state] === 'undefined') {
                        History.handlers.specific[state] = [];
                    }
                    History.handlers.specific[state].push(handler);
                } else {
                    handler = state;
                    History.handlers.generic.push(handler);
                }
                return true;
            },
            trigger: function(state) {
                var History = $.History;
                if (typeof state === 'undefined') {
                    state = History.getState();
                }
                var i, n, handler, list;
                if (typeof History.handlers.specific[state] !== 'undefined') {
                    list = History.handlers.specific[state];
                    for (i = 0, n = list.length; i < n; ++i) {
                        handler = list[i];
                        handler(state);
                    }
                }
                list = History.handlers.generic;
                for (i = 0, n = list.length; i < n; ++i) {
                    handler = list[i];
                    handler(state);
                }
                return true;
            },
            construct: function() {
                var History = $.History;
                $(document).ready(function() {
                    History.domReady();
                });
                return true;
            },
            configure: function(options) {
                var History = $.History;
                History.options = $.extend(History.options, options);
                return true;
            },
            domReadied: false,
            domReady: function() {
                var History = $.History;
                if (History.domRedied) {
                    return;
                }
                History.domRedied = true;
                History.$window = $(window);
                History.$window.bind('hashchange', this.hashchange);
                setTimeout(History.hashchangeLoader, 200);
                return true;
            },
            nativeSupport: function(browser) {
                browser = browser || $.browser;
                var browserVersion = browser.version,
                    browserVersionInt = parseInt(browserVersion, 10),
                    browserVersionParts = browserVersion.split(/[^0-9]/g),
                    browserVersionPartsOne = parseInt(browserVersionParts[0], 10),
                    browserVersionPartsTwo = parseInt(browserVersionParts[1], 10),
                    browserVersionPartsThree = parseInt(browserVersionParts[2], 10),
                    nativeSupport = false;
                if ((browser.msie || false) && browserVersionInt >= 8) {
                    nativeSupport = true;
                } else if ((browser.webkit || false) && browserVersionInt >= 528) {
                    nativeSupport = true;
                } else if ((browser.mozilla || false)) {
                    if (browserVersionPartsOne > 1) {
                        nativeSupport = true;
                    } else if (browserVersionPartsOne === 1) {
                        if (browserVersionPartsTwo > 9) {
                            nativeSupport = true;
                        } else if (browserVersionPartsTwo === 9) {
                            if (browserVersionPartsThree >= 2) {
                                nativeSupport = true;
                            }
                        }
                    }
                } else if ((browser.opera || false)) {
                    if (browserVersionPartsOne > 10) {
                        nativeSupport = true;
                    } else if (browserVersionPartsOne === 10) {
                        if (browserVersionPartsTwo >= 60) {
                            nativeSupport = true;
                        }
                    }
                }
                return nativeSupport;
            },
            hashchangeLoader: function() {
                var History = $.History;
                var nativeSupport = History.nativeSupport();
                if (!nativeSupport) {
                    var checker;
                    if ($.browser.msie) {
                        History.$iframe = $('<iframe id="jquery-history-iframe" style="display: none;"></$iframe>').prependTo(document.body)[0];
                        History.$iframe.contentWindow.document.open();
                        History.$iframe.contentWindow.document.close();
                        var iframeHit = false;
                        checker = function() {
                            var hash = History.getHash();
                            var state = History.getState();
                            var iframeHash = History.extractHash(History.$iframe.contentWindow.document.location.hash);
                            if (state !== hash) {
                                if (!iframeHit) {
                                    History.$iframe.contentWindow.document.open();
                                    History.$iframe.contentWindow.document.close();
                                    History.$iframe.contentWindow.document.location.hash = hash;
                                }
                                iframeHit = false;
                                History.$window.trigger('hashchange');
                            } else {
                                if (state !== iframeHash) {
                                    iframeHit = true;
                                    History.setHash(iframeHash);
                                }
                            }
                        };
                    } else {
                        checker = function() {
                            var hash = History.getHash();
                            var state = History.getState();
                            if (state !== hash) {
                                History.$window.trigger('hashchange');
                            }
                        };
                    }
                    setInterval(checker, 200);
                } else {
                    var hash = History.getHash();
                    if (hash) {
                        History.$window.trigger('hashchange');
                    }
                }
                return true;
            }
        };
        $.History.construct();
    } else {
        window.console.warn('$.History has already been defined...');
    }
})(jQuery);

; // utilities/jquery.history.override.js
$.History.extractHash = (function() {
    return function(url) {
        var hash = url.replace(/^[^#!\/]*#/, '').replace(/^#+|#+$/, '');
        return hash;
    };
})();

; // utilities/robloxTabs.js
$(function() {
    $.History.bind(function(state) {
        var loc = '#' + state.substring(2);
        $('.rbx-tab a').each(function() {
            if ($(this).attr('href') == loc) {
                $(this).click();
            }
        });
    });
    var prefix = '.rbx-tab';
    $(prefix).click(function() {
        var href = $(this).find('a').attr('href');
        if (href && href.charAt(0) === '#') {
            $.History.go('!/' + href.substring(1));
        }
    });
});

; // StringTruncator.js
var isInitialized = false;
var fitStringSpan = null;

function InitStringTruncator() {
    if (isInitialized)
        return;
    fitStringSpan = document.createElement("span");
    fitStringSpan.style.display = 'inline-block';
    fitStringSpan.style.visibility = 'hidden';
    fitStringSpan.style.height = '0px';
    fitStringSpan.style.padding = '0px';
    document.body.appendChild(fitStringSpan);
    isInitialized = true;
}

function fitStringToWidth(str, width, className) {
    if (!isInitialized)
        InitStringTruncator();

    function _escTag(s) {
        return s.replace("<", "&lt;").replace(">", "&gt;");
    }
    if (className)
        fitStringSpan.className = className;
    var result = _escTag(str);
    fitStringSpan.innerHTML = result;
    if (fitStringSpan.offsetWidth > width) {
        var posStart = 0,
            posMid, posEnd = str.length,
            posLength;
        while (posLength = (posEnd - posStart) >> 1) {
            posMid = posStart + posLength;
            fitStringSpan.innerHTML = _escTag(str.substring(0, posMid)) + '&hellip;';
            if (fitStringSpan.offsetWidth > width) posEnd = posMid;
            else posStart = posMid;
        }
        result = str.substring(0, posStart) + '&hellip;';
    }
    return result;
}

function fitStringToWidthSafe(str, width, className) {
    var safeName = fitStringToWidth(str, width, className);
    if (safeName.indexOf("&hellip;") != -1) {
        var posEnd = safeName.lastIndexOf(" ");
        if (posEnd != -1 && posEnd + 10 <= safeName.length) {
            safeName = safeName.substring(0, posEnd + 2) + "&hellip;";
        }
    }
    return safeName;
}

function fitStringToWidthSafeText(str, width, className) {
    var safeName = fitStringToWidthSafe(str, width, className).replace("&hellip;", "...");
    return safeName;
}

; // VotingPanel.js
var Roblox = Roblox || {};
Roblox.Voting = function() {
    var initialize = function() {
        var votingPanel = $('.voting-panel');
        if (votingPanel.length === 0) {
            return;
        }
        $('.users-vote .upvote').unbind().click(function() {
            onVoteButtonClick($(this), true);
        });
        $('.users-vote .downvote').unbind().click(function() {
            onVoteButtonClick($(this), false);
        });
        var totalUpVotes = parseInt(votingPanel.data('total-up-votes'));
        var totalDownVotes = parseInt(votingPanel.data('total-down-votes'));
        updateVoteBar(totalUpVotes, totalDownVotes);
    };
    var loadVotingService = function(rootNode, placeId) {
        var url = "/games/votingservice/" + placeId;
        $.ajax({
            url: url,
            success: function(data) {
                rootNode.replaceWith(data);
                $(function() {
                    initialize();
                });
            }
        });
    }
    var onVoteButtonClick = function(element, voteType) {
        var userIsAuthenticated = $('.voting-panel').data('user-authenticated');
        if (!userIsAuthenticated) {
            displayModal("GuestUser");
            return;
        }
        var targetId = $('.voting-panel').data('target-id');
        var voteUrl = "/voting/vote?assetId=" + targetId + "&vote=";
        var altVoteUrl = $('.voting-panel').data('vote-url');
        if (altVoteUrl) {
            voteUrl = altVoteUrl;
        }
        if (element.hasClass('selected') || element.find("i").hasClass("selected") || element.find(".icon-like, .icon-dislike").hasClass("selected")) {
            vote(voteUrl, null);
        } else {
            vote(voteUrl, voteType);
        }
    };
    var vote = function(voteUrl, voteType) {
        $('.voting-panel .loading').show();
        $.ajax({
            type: "POST",
            url: voteUrl + voteType,
            success: onVoteSuccess,
            error: onVoteError
        });
    };

    function normalizeKeys(obj) {
        var normalized = new Object();
        for (var key in obj) {
            if (obj.hasOwnProperty(key)) {
                var normalizedKey = key.charAt(0).toLowerCase() + key.slice(1);
                var value = obj[key];
                if (value !== null && typeof value === 'object') {
                    value = normalizeKeys(value);
                }
                normalized[normalizedKey] = value;
            }
        }
        return normalized;
    }
    var onVoteSuccess = function(result) {
        var hasRBXIcon = $(".icon-like").length;
        $('.voting-panel .loading').hide();
        result = normalizeKeys(result);
        if (result.success) {
            setVotes(result.model.upVotes, result.model.downVotes);
            var upvoteButton = $('.voting-panel .upvote');
            var downvoteButton = $('.voting-panel .downvote');
            var usersVote = $('.users-vote');
            if (hasRBXIcon) {
                upvoteButton = $('.voting-panel .upvote .icon-like');
                downvoteButton = $('.voting-panel .downvote .icon-dislike');
            }
            if (result.model.userVote !== null) {
                if (!usersVote.hasClass('has-voted')) {
                    usersVote.addClass('has-voted');
                }
            } else {
                usersVote.removeClass('has-voted');
            }
            if (upvoteButton.hasClass('selected')) {
                upvoteButton.removeClass('selected');
            }
            if (downvoteButton.hasClass('selected')) {
                downvoteButton.removeClass('selected');
            }
            if (result.model.userVote !== null) {
                if (result.model.userVote) {
                    upvoteButton.addClass('selected');
                } else {
                    downvoteButton.addClass('selected');
                }
            }
            updateVoteBar(result.model.upVotes, result.model.downVotes);
        } else {
            displayModal(result.modalType);
        }
    };
    var onVoteError = function(result) {
        $('.voting-panel .loading').hide();
    };
    var updateVoteBar = function(upvotes, downvotes, target) {
        var elem = target || $("#voting-section"),
            percentUp;
        if (!isNaN(upvotes) && !isNaN(downvotes)) {
            if (upvotes === 0) {
                percentUp = 0;
            } else if (downvotes === 0) {
                percentUp = 100;
            } else {
                percentUp = Math.floor((upvotes / (upvotes + downvotes)) * 100);
            }
            if (percentUp > 100) {
                percentUp = 100;
            }
            var voteElem = elem.find(".vote-container");
            var voteBg = voteElem.find(".vote-background");
            voteElem.find(".vote-percentage").css("width", percentUp + "%");
            if (downvotes > 0) {
                voteBg.addClass("has-votes");
            } else {
                voteBg.removeClass("has-votes");
            }
        }
    };
    var setVotes = function(upVotes, downVotes) {
        upVotes = Roblox.NumberFormatting.abbreviatedFormat(upVotes);
        downVotes = Roblox.NumberFormatting.abbreviatedFormat(downVotes);
        $('.voting-panel .total-upvotes-text').text(upVotes);
        $('.voting-panel .total-downvotes-text').text(downVotes);
        $('.voting-panel #vote-up-text').text(upVotes);
        $('.voting-panel #vote-down-text').text(downVotes);
        updateVoteBar(upVotes, downVotes);
    }
    var getModalProperties = function(modalType) {
        var langMap = Roblox.Lang.VotingPanelResources;
        var intl = Roblox.Intl && langMap && new Roblox.Intl();
        var votingSection = $("#voting-section");
        var accountPageUrl = votingSection.data("accountPageUrl");
        var registerPageUrl = votingSection.data("registerUrl");
        var accountsPageLink = "<a href='" + accountPageUrl + "'>" + langMap["Label.AccountPageTitle"] + "</a>";
        var registerPageLink = "<a href='" + registerPageUrl + "'>" + langMap["Label.LoginOrRegisterPageTitle"] + "</a>";
        var modalProperties = {
            "EmailIsVerified": {
                titleText: langMap["Label.EmailVerifiedTitle"],
                bodyContent: intl.f(langMap["Label.EmailVerifiedMessage"], {
                    accountPageLink: accountsPageLink
                }),
                onAccept: function() {
                    window.location.href = accountPageUrl;
                },
                acceptColor: Roblox.Dialog.green,
                acceptText: langMap["Label.Accept"],
                declineText: langMap["Label.Decline"],
                allowHtmlContentInBody: true
            },
            "PlayGame": {
                titleText: langMap["Label.PlayGameTitle"],
                bodyContent: langMap["Label.PlayGameMessage"],
                showAccept: false,
                declineText: langMap["Label.Ok"]
            },
            "UseModel": {
                titleText: langMap["Label.UseModelTitle"],
                bodyContent: langMap["Label.UseModelMessage"],
                showAccept: false,
                declineText: langMap["Label.Ok"]
            },
            "InstallPlugin": {
                titleText: langMap["Label.InstallPluginTitle"],
                bodyContent: langMap["Label.InstallPluginMessage"],
                showAccept: false,
                declineText: langMap["Label.Ok"]
            },
            "BuyGamePass": {
                titleText: langMap["Label.BuyGamePassTitle"],
                bodyContent: langMap["Label.BuyGamePassMessage"],
                showAccept: false,
                declineText: langMap["Label.Ok"]
            },
            "FloodCheckThresholdMet": {
                titleText: langMap["Label.FloodCheckTitle"],
                bodyContent: langMap["Label.FloodCheckMessage"],
                showAccept: false,
                declineText: langMap["Label.Ok"]
            },
            "GuestUser": {
                titleText: langMap["Label.GuestUserTitle"],
                bodyContent: "<div>" + langMap["Label.YouMustLoginToVote"] + "</div><div>" + intl.f(langMap["Label.GuestUserMessage"], {
                    loginOrRegisterPageLink: registerPageLink
                }) + "</div>",
                onAccept: function() {
                    window.location.href = registerPageUrl
                },
                acceptColor: Roblox.Dialog.green,
                acceptText: langMap["Label.Login"],
                declineText: langMap["Label.Decline"],
                allowHtmlContentInBody: true
            },
            "Error": {
                titleText: langMap["Label.UnknownProblemTitle"],
                bodyContent: langMap["Label.UnknownProblemMessage"],
                showAccept: false,
                declineText: langMap["Label.Ok"]
            },
            "AssetNotVoteable": {
                titleText: langMap["Label.AssetNotVoteableTitle"],
                bodyContent: langMap["Label.AssetNotVoteableMessage"],
                showAccept: false,
                declineText: langMap["Label.Ok"]
            }
        };
        return modalProperties[modalType] || modalProperties.Error;
    }
    var displayModal = function(modalType) {
        if (!modalType) {
            return;
        }
        Roblox.Dialog.open(getModalProperties(modalType));
    };
    return {
        Vote: vote,
        Initialize: initialize,
        SetVotes: setVotes,
        UpdateVoteBar: updateVoteBar,
        LoadVotingService: loadVotingService
    };
}();
$(function() {
    Roblox.Voting.Initialize();
});

; // GameItemCard.js
var Roblox = Roblox || {};
$(function() {
    var elementsToCheck = $("[data-voting-processed=false]");
    elementsToCheck.each(function(idx, val) {
        var targetElement = $(val),
            voteContainer = targetElement.find(".vote-container"),
            upVotes = parseInt(voteContainer.attr('data-upvotes')),
            downVotes = parseInt(voteContainer.attr('data-downvotes'));
        Roblox.Voting.UpdateVoteBar(upVotes, downVotes, targetElement);
        targetElement.attr("data-voting-processed", true);
    });
});

; // utilities/dialog.js
if (typeof Roblox === "undefined") {
    Roblox = {};
}
if (typeof Roblox.Dialog === "undefined") {
    Roblox.Dialog = function() {
        var CONTAINER_SELECTOR = ".simplemodal-container";
        var BUTTON_CLASS_GREEN = "btn-primary-md";
        var BUTTON_CLASS_BLUE = "btn-secondary-md";
        var BUTTON_CLASS_WHITE = "btn-control-md";
        var BUTTON_CLASS_GREEN_DISABLED = "btn-primary-md disabled";
        var BUTTON_CLASS_BLUE_DISABLED = "btn-secondary-md disabled";
        var BUTTON_CLASS_WHITE_DISABLED = "btn-control-md disabled";
        var BUTTON_CLASS_NONE = "btn-none";
        var BUTTON_SELECTOR_YES = ".modal-btns #confirm-btn";
        var BUTTON_SELECTOR_NO = ".modal-btns #decline-btn";
        var MODAL_CHECKBOX_SELECTOR = "#modal-checkbox-input";
        var status = {
            isOpen: false
        };
        var modalProperties = {
            overlayClose: true,
            escClose: true,
            opacity: 80,
            zIndex: 1040,
            overlayCss: {
                backgroundColor: "#000"
            },
            onClose: close,
            focus: false
        };
        var dialogDefaults = {
            Yes: "Yes",
            No: "No",
            Agree: "Agree"
        };

        function open(properties) {
            status.isOpen = true;
            var defaults = {
                titleText: "",
                bodyContent: "",
                footerText: "",
                footerMiddleAligned: false,
                acceptText: Roblox.Lang.ControlsResources["Action.Yes"] || dialogDefaults.Yes,
                declineText: Roblox.Lang.ControlsResources["Action.No"] || dialogDefaults.No,
                acceptColor: BUTTON_CLASS_BLUE,
                declineColor: BUTTON_CLASS_WHITE,
                xToCancel: false,
                onAccept: function() {
                    return false;
                },
                onDecline: function() {
                    return false;
                },
                onCancel: function() {
                    return false;
                },
                imageUrl: null,
                showAccept: true,
                showDecline: true,
                allowHtmlContentInBody: false,
                allowHtmlContentInFooter: false,
                dismissable: true,
                fieldValidationRequired: false,
                onOpenCallback: function() {},
                onCloseCallback: close,
                cssClass: null,
                checkboxAgreementText: Roblox.Lang.ControlsResources["Action.Agree"] || dialogDefaults.Agree,
                checkboxAgreementRequired: false
            };
            properties = $.extend({}, defaults, properties);
            modalProperties.overlayClose = properties.dismissable;
            modalProperties.escClose = properties.dismissable;
            if (properties.onCloseCallback) {
                modalProperties.onClose = function() {
                    properties.onCloseCallback();
                    close();
                }
            }
            var yesBtn = $(BUTTON_SELECTOR_YES);
            yesBtn.html(properties.acceptText);
            yesBtn.attr("class", properties.acceptColor);
            yesBtn.unbind();
            yesBtn.bind('click', function() {
                if (_buttonIsDisabled(yesBtn)) {
                    return false;
                }
                if (properties.fieldValidationRequired) {
                    btnClickCallbackFirst(properties.onAccept);
                } else {
                    btnClick(properties.onAccept);
                }
                return false;
            });
            var noBtn = $(BUTTON_SELECTOR_NO);
            noBtn.html(properties.declineText);
            noBtn.attr("class", properties.declineColor);
            noBtn.unbind();
            noBtn.bind('click', function() {
                if (_buttonIsDisabled(noBtn)) {
                    return false;
                }
                btnClick(properties.onDecline);
                return false;
            });
            var checkbox = $(MODAL_CHECKBOX_SELECTOR);
            checkbox.unbind();
            checkbox.bind("change", function() {
                if (checkbox.is(":checked")) {
                    _enableButton(yesBtn);
                } else {
                    _disableButton(yesBtn);
                }
            });
            var modal = $('[data-modal-type="confirmation"]');
            modal.find(".modal-title").text(properties.titleText);
            if (properties.imageUrl == null) {
                modal.addClass('noImage');
            } else {
                modal.find('img.modal-thumb').attr('src', properties.imageUrl);
                modal.removeClass('noImage');
            }
            if (status.extraClass) {
                modal.removeClass(status.extraClass);
                status.extraClass = false;
            }
            if (properties.cssClass != null) {
                modal.addClass(properties.cssClass);
                status.extraClass = properties.cssClass;
            }
            if (properties.allowHtmlContentInBody) {
                modal.find(".modal-message").html(properties.bodyContent);
            } else {
                modal.find(".modal-message").text(properties.bodyContent);
            }
            if (properties.checkboxAgreementRequired) {
                _disableButton(yesBtn);
                modal.find(".modal-checkbox.checkbox > input").prop("checked", false);
                modal.find(".modal-checkbox.checkbox > label").text(properties.checkboxAgreementText);
                modal.find(".modal-checkbox.checkbox").show();
            } else {
                modal.find(".modal-checkbox.checkbox > input").prop("checked", true);
                modal.find(".modal-checkbox.checkbox").hide();
            }
            if ($.trim(properties.footerText) == "") {
                modal.find(".modal-footer").hide();
            } else {
                modal.find(".modal-footer").show();
            }
            if (properties.allowHtmlContentInFooter) {
                modal.find(".modal-footer").html(properties.footerText);
            } else {
                modal.find(".modal-footer").text(properties.footerText);
            }
            if (properties.footerMiddleAligned) {
                modal.find(".modal-footer").addClass("modal-footer-center");
            }
            modal.modal(modalProperties);
            var cancelBtn = $(CONTAINER_SELECTOR + " .modal-header .close");
            cancelBtn.unbind();
            cancelBtn.bind('click', function() {
                btnClick(properties.onCancel);
                return false;
            });
            if (!properties.xToCancel) {
                cancelBtn.hide();
            }
            if (!properties.showAccept) {
                yesBtn.hide();
            }
            if (!properties.showDecline) {
                noBtn.hide();
            }
            $("#rbx-body").addClass("modal-mask");
            properties.onOpenCallback();
        }

        function _disableButton(btn) {
            if (btn.hasClass(BUTTON_CLASS_WHITE)) {
                btn.addClass(BUTTON_CLASS_WHITE_DISABLED);
            } else if (btn.hasClass(BUTTON_CLASS_GREEN)) {
                btn.addClass(BUTTON_CLASS_GREEN_DISABLED);
            } else if (btn.hasClass(BUTTON_CLASS_BLUE)) {
                btn.addClass(BUTTON_CLASS_BLUE_DISABLED);
            }
        }

        function _buttonIsDisabled(btn) {
            if (btn.hasClass(BUTTON_CLASS_BLUE_DISABLED) || btn.hasClass(BUTTON_CLASS_WHITE_DISABLED) || btn.hasClass(BUTTON_CLASS_GREEN_DISABLED)) {
                return true;
            }
            return false;
        }

        function disableButtons() {
            var yesBtn = $(BUTTON_SELECTOR_YES);
            var noBtn = $(BUTTON_SELECTOR_NO);
            _disableButton(yesBtn);
            _disableButton(noBtn);
        }

        function _enableButton(btn) {
            if (btn.hasClass(BUTTON_CLASS_WHITE_DISABLED)) {
                btn.removeClass(BUTTON_CLASS_WHITE_DISABLED);
                btn.addClass(BUTTON_CLASS_WHITE);
            } else if (btn.hasClass(BUTTON_CLASS_GREEN_DISABLED)) {
                btn.removeClass(BUTTON_CLASS_GREEN_DISABLED);
                btn.addClass(BUTTON_CLASS_GREEN);
            } else if (btn.hasClass(BUTTON_CLASS_BLUE_DISABLED)) {
                btn.removeClass(BUTTON_CLASS_BLUE_DISABLED);
                btn.addClass(BUTTON_CLASS_BLUE);
            }
        }

        function enableButtons() {
            var yesBtn = $(BUTTON_SELECTOR_YES);
            var noBtn = $(BUTTON_SELECTOR_NO);
            _enableButton(yesBtn);
            _enableButton(noBtn);
        }

        function clickYes() {
            if (status.isOpen) {
                var yesBtn = $(BUTTON_SELECTOR_YES);
                yesBtn.click();
            }
        }

        function clickNo() {
            var noBtn = $(BUTTON_SELECTOR_NO);
            noBtn.click();
        }

        function close(id) {
            status.isOpen = false;
            if (typeof id !== 'undefined') {
                $.modal.close(id);
            } else {
                $.modal.close();
            }
            $("#rbx-body").removeClass("modal-mask");
        }

        function btnClick(callBack) {
            close();
            if (typeof callBack === 'function') {
                callBack();
            }
        }

        function btnClickCallbackFirst(callBack) {
            if (typeof callBack === 'function') {
                var returnVal = callBack();
                if (returnVal !== 'undefined') {
                    if (returnVal == false) {
                        return false;
                    }
                }
            }
            close();
        }

        function toggleProcessing(isShown, closeClass) {
            var modal = $(".modal-body");
            if (isShown) {
                modal.find(".modal-btns").hide();
                modal.find(".modal-processing").show();
            } else {
                modal.find(".modal-btns").show();
                modal.find(".modal-processing").hide();
            }
            if (typeof closeClass !== "undefined" && closeClass !== "") {
                $.modal.close("." + closeClass);
            }
        }
        return {
            open: open,
            close: close,
            disableButtons: disableButtons,
            enableButtons: enableButtons,
            clickYes: clickYes,
            clickNo: clickNo,
            status: status,
            toggleProcessing: toggleProcessing,
            green: BUTTON_CLASS_GREEN,
            blue: BUTTON_CLASS_BLUE,
            white: BUTTON_CLASS_WHITE,
            none: BUTTON_CLASS_NONE
        };
    }();
}
$(document).keypress(function(e) {
    if (Roblox.Dialog.isOpen && e.which === 13) {
        Roblox.Dialog.clickYes();
    }
});

; // common/deviceMeta.js
var Roblox = Roblox || {};
Roblox.DeviceMeta = (function() {
    var metaTag = document.querySelector('meta[name="device-meta"]');
    if (metaTag === null) {
        console.debug("Error loading device information from meta tag - please check if meta tag is present");
        return;
    }
    var keyMap = metaTag.dataset || {};
    var appTypes = {
        android: "android",
        ios: "ios",
        xbox: "xbox",
        uwp: "uwp",
        amazon: "amazon",
        win32: "win32",
        universalapp: "universalApp",
        unknown: "unknown"
    };
    var deviceTypes = {
        computer: "computer",
        tablet: "tablet",
        phone: "phone",
        console: "console"
    };
    return function() {
        return {
            deviceType: deviceTypes[keyMap.deviceType] || '',
            appType: appTypes[keyMap.appType] || '',
            isInApp: keyMap.isInApp === 'true',
            isDesktop: keyMap.isDesktop === 'true',
            isPhone: keyMap.isPhone === 'true',
            isTablet: keyMap.isTablet === 'true',
            isConsole: keyMap.isConsole === 'true',
            isAndroidApp: keyMap.isAndroidApp === 'true',
            isIosApp: keyMap.isIosApp === 'true',
            isUWPApp: keyMap.isUwpApp === 'true',
            isXboxApp: keyMap.isXboxApp === 'true',
            isAmazonApp: keyMap.isAmazonApp === 'true',
            isWin32App: keyMap.isWin32App === 'true',
            isStudio: keyMap.isStudio === 'true',
            isIosDevice: keyMap.isIosDevice === 'true',
            isAndroidDevice: keyMap.isAndroidDevice === 'true',
            isUniversalApp: keyMap.isUniversalApp === 'true',
            isChromeOs: keyMap.isChromeOs === 'true',
            isPcGdkApp: keyMap.isPcGdkApp === 'true',
            isSamsungGalaxyStoreApp: keyMap.isSamsungGalaxyStoreApp === 'true',
        }
    };
})();

; // AbuseReport/AbuseReportDispatcher.js
var Roblox = Roblox || {};
Roblox.AbuseReportDispatcher = (function() {
    var isInitialized = false;
    var getParamFromQueryString = function(param, url) {
        param = param.replace(/[\[\]]/g, "\\$&");
        var regex = new RegExp("[?&]" + param + "(=([^&#]*)|&|#|$)"),
            results = regex.exec(url);
        if (!results) {
            return null;
        }
        if (!results[2]) {
            return "";
        }
        return decodeURIComponent(results[2].replace(/\+/g, " "));
    }
    var triggerUrlAction = function(url) {
        if (typeof(url) !== "string") {
            return false;
        }
        url = url.toLowerCase();
        var parts = url.split("?");
        var link = parts[0];
        var action;
        var pvMeta = Roblox.AbuseReportPVMeta;
        var deviceMeta = Roblox.DeviceMeta();
        pvMeta.inApp = deviceMeta.isInApp;
        if (link && typeof(link) === "string") {
            action = link.split("abusereport/")[1];
        }
        if (action) {
            var payload = {
                actionName: action,
                id: getParamFromQueryString("id", url),
                redirectUrl: getParamFromQueryString("redirecturl", url)
            };
            if (getParamFromQueryString("conversationid", url)) {
                payload["conversationId"] = getParamFromQueryString("conversationid", url);
            }
            if (getParamFromQueryString("stringid", url)) {
                payload["stringId"] = getParamFromQueryString("stringid", url);
            }
            if (getParamFromQueryString("forumPostId", url)) {
                payload["forumPostId"] = getParamFromQueryString("forumPostId", url);
            }
            if (getParamFromQueryString("partyguid", url)) {
                payload["partyGuid"] = getParamFromQueryString("partyguid", url);
            }
            if (payload.id && payload.redirectUrl) {
                var newQuerystring = $.param(payload);
                var embedUrlPath = "abusereport/embedded/" + action + "?" + newQuerystring;
                var embeddedUrl = Roblox.Endpoints.getAbsoluteUrl("/" + embedUrlPath);
                if (pvMeta.inApp) {
                    if (pvMeta.inAppEnabled) {
                        var params = {
                            urlPath: embedUrlPath,
                            feature: "Abuse Report"
                        };
                        console.debug("Calling navigateToFeature for Hybrid Overlay");
                        Roblox.Hybrid.Navigation.navigateToFeature(params, function(status) {
                            console.debug("navigateToFeature ---- status:" + status);
                        });
                    } else {
                        window.location.href = url;
                    }
                } else if (pvMeta.phoneEnabled) {
                    window.location.href = embeddedUrl;
                } else {
                    window.location.href = url;
                }
            }
        }
    }
    var listener = function(e) {
        e.preventDefault();
        var url = $(this).attr("href");
        if (url) {
            triggerUrlAction(url);
        }
    }
    var initialize = function() {
        if (!isInitialized) {
            $(".abuse-report-modal").click(listener);
            $(".messages-container").on("click", ".abuse-report-modal", listener);
            $("#AjaxCommentsContainer").on("click", ".abuse-report-modal", listener);
            $("#item-context-menu").on("click", ".abuse-report-modal", listener);
            $(".GroupWallPane").on("click", ".abuse-report-modal", listener);
            $(".group-details-container").on("click", ".abuse-report-modal", listener);
            isInitialized = true;
        }
    }
    return {
        triggerUrlAction: triggerUrlAction,
        initialize: initialize
    };
})();
$(document).ready(function() {
    Roblox.AbuseReportDispatcher.initialize();
});

; //Bundle detector
Roblox && Roblox.BundleDetector && Roblox.BundleDetector.bundleDetected('page');