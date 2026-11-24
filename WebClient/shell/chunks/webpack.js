(() => {
    "use strict";
    var e = {},
        r = {};

    function t(o) {
        var n = r[o];
        if (void 0 !== n) return n.exports;
        var i = r[o] = {
                exports: {}
            },
            f = !0;
        try {
            e[o](i, i.exports, t), f = !1
        } finally {
            f && delete r[o]
        }
        return i.exports
    }
    t.m = e, (() => {
        var e = [];
        t.O = (r, o, n, i) => {
            if (o) {
                i = i || 0;
                for (var f = e.length; f > 0 && e[f - 1][2] > i; f--) e[f] = e[f - 1];
                e[f] = [o, n, i];
                return
            }
            for (var a = 1 / 0, f = 0; f < e.length; f++) {
                for (var [o, n, i] = e[f], l = !0, u = 0; u < o.length; u++)(!1 & i || a >= i) && Object.keys(t.O).every(e => t.O[e](o[u])) ? o.splice(u--, 1) : (l = !1, i < a && (a = i));
                if (l) {
                    e.splice(f--, 1);
                    var d = n();
                    void 0 !== d && (r = d)
                }
            }
            return r
        }
    })(), t.n = e => {
        var r = e && e.__esModule ? () => e.default : () => e;
        return t.d(r, {
            a: r
        }), r
    }, t.d = (e, r) => {
        for (var o in r) t.o(r, o) && !t.o(e, o) && Object.defineProperty(e, o, {
            enumerable: !0,
            get: r[o]
        })
    }, t.g = function() {
        if ("object" == typeof globalThis) return globalThis;
        try {
            return this || Function("return this")()
        } catch (e) {
            if ("object" == typeof window) return window
        }
    }(), t.o = (e, r) => Object.prototype.hasOwnProperty.call(e, r), t.r = e => {
        "undefined" != typeof Symbol && Symbol.toStringTag && Object.defineProperty(e, Symbol.toStringTag, {
            value: "Module"
        }), Object.defineProperty(e, "__esModule", {
            value: !0
        })
    }, t.p = "/4cf83f8627d9609709ef5165081e6f27acdfe5d8/_next/", (() => {
        var e = {
            68: 0
        };
        t.O.j = r => 0 === e[r];
        var r = (r, o) => {
                var n, i, [f, a, l] = o,
                    u = 0;
                if (f.some(r => 0 !== e[r])) {
                    for (n in a) t.o(a, n) && (t.m[n] = a[n]);
                    if (l) var d = l(t)
                }
                for (r && r(o); u < f.length; u++) i = f[u], t.o(e, i) && e[i] && e[i][0](), e[i] = 0;
                return t.O(d)
            },
            o = self.webpackChunk_N_E = self.webpackChunk_N_E || [];
        o.forEach(r.bind(null, 0)), o.push = r.bind(null, o.push.bind(o))
    })()
})();