! function() {
    "use strict";
    var a = Roblox,
        n = CoreUtilities,
        l = "experimentation",
        d = function() {
            return (d = Object.assign || function(e) {
                for (var t, r = 1, i = arguments.length; r < i; r++)
                    for (var o in t = arguments[r]) Object.prototype.hasOwnProperty.call(t, o) && (e[o] = t[o]);
                return e
            }).apply(this, arguments)
        };

    function e() {
        this.projectLayerMetadataMaps = []
    }
    var t = (e.prototype.getAllValuesForLayer = function(r, i) {
        var o = this;
        void 0 === i && (i = 1);
        var e = {
                url: a.EnvironmentUrls.apiGatewayUrl + "/product-experimentation-platform/v1/projects/" + i + "/values",
                withCredentials: !0
            },
            t = {
                layers: ((t = {})[r] = {}, t)
            };
        return n.httpService.post(e, t).then(function(e) {
            if (null != e && e.data) {
                var t = null == e ? void 0 : e.data,
                    e = null !== (e = o.projectLayerMetadataMaps[i]) && void 0 !== e ? e : new Map;
                return o.projectLayerMetadataMaps[i] = e, t.layers[r].experimentName && e.set(r, t), t.layers[r].parameters
            }
            return Promise.reject()
        })
    }, e.prototype.logLayerExposure = function(e, t) {
        void 0 === t && (t = 1);
        var r, i, o, n = null === (i = this.projectLayerMetadataMaps[t]) || void 0 === i ? void 0 : i.get(e);
        n && (r = n.layers[e], t = a.CurrentUser.isAuthenticated ? a.CurrentUser.userId : 0, i = "number" == typeof(i = a.Cookies.getBrowserTrackerId()) ? i : 0, t = {
            uid: null == t ? void 0 : t.toString(),
            btid: null == i ? void 0 : i.toString(),
            project: null === (t = n.projectId) || void 0 === t ? void 0 : t.toString(),
            version: null === (i = n.version) || void 0 === i ? void 0 : i.toString(),
            ts: Date.now().toString(),
            lt: (new Date).toISOString(),
            target: l
        }, (i = {}).layer = e, i.experiment = r.experimentName, i.isAudienceSpecified = null === (e = r.isAudienceSpecified) || void 0 === e ? void 0 : e.toString(), i.isAudienceMember = null === (e = r.isAudienceMember) || void 0 === e ? void 0 : e.toString(), i.userAgent = n.userAgent, i.platformType = n.platformType, i.ptid = null === (n = n.platformTypeId) || void 0 === n ? void 0 : n.toString(), i.segment = null === (n = r.segment) || void 0 === n ? void 0 : n.toString(), i.experiment_variant = r.experimentVariant, i.hashUnit = r.primaryUnit, i.hashValue = null === (n = r.primaryUnitValue) || void 0 === n ? void 0 : n.toString(), i.allocKey = r.primaryUnit, i.allocValue = null === (n = r.primaryUnitValue) || void 0 === n ? void 0 : n.toString(), i.holdout = r.holdoutGroupExperimentName, i = i, o = d(d({}, t), i), Object.keys(o).forEach(function(e) {
            o[e] = null !== (e = o[e]) && void 0 !== e ? e : ""
        }), a.EventStream.SendEventWithTarget("expExposed", l, o, a.EventStream.TargetTypes.WWW))
    }, e);
    void 0 === window.Roblox && (window.Roblox = {}), void 0 === window.Roblox.ExperimentationService && (window.Roblox.ExperimentationService = new t)
}();
//# sourceMappingURL=https://js.rbxcdn.com/c9cf05367a7b10996a48-experimentation.js.map

/* Bundle detector */
window.Roblox && window.Roblox.BundleDetector && window.Roblox.BundleDetector.bundleDetected("Experimentation");