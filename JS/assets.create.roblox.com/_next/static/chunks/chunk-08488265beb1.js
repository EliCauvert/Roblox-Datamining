;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "cde38926-5a56-c690-5772-29a8a601fe01")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 979128, e => {
    "use strict";
    let t, a, n;
    var l = e.i(721281),
        r = e.i(416340),
        i = e.i(79187),
        o = e.i(237401),
        s = e.i(706442),
        u = e.i(199834),
        d = e.i(982234),
        c = e.i(417410),
        m = e.i(565907),
        p = e.i(935606),
        f = e.i(169722),
        g = e.i(54369),
        y = e.i(728397),
        E = e.i(235684),
        v = e.i(854705),
        b = e.i(44161),
        h = e.i(734306),
        T = e.i(731693),
        x = e.i(835163),
        C = e.i(529390),
        S = e.i(397810),
        w = e.i(872204),
        N = e.i(291037),
        I = e.i(899819),
        A = e.i(777004),
        R = e.i(186214),
        k = e.i(35298),
        M = e.i(904090),
        D = e.i(242788),
        L = e.i(35159),
        B = e.i(523943),
        _ = e.i(438295),
        q = e.i(257115),
        O = e.i(973336),
        P = e.i(423107),
        U = e.i(649319),
        G = e.i(208215),
        F = e.i(464782),
        Q = e.i(620068),
        z = e.i(431346),
        H = e.i(795621),
        V = e.i(157310),
        W = e.i(711367),
        j = e.i(182012),
        K = e.i(260022),
        Y = e.i(459891),
        X = e.i(208426),
        J = e.i(71597),
        $ = e.i(161048),
        Z = e.i(110906),
        ee = e.i(197649),
        et = e.i(52746),
        ea = e.i(688702),
        en = e.i(808048),
        el = e.i(310432),
        er = e.i(46938),
        ei = e.i(698786),
        eo = e.i(646924),
        es = e.i(678365),
        eu = e.i(631719),
        ed = e.i(737420),
        ec = e.i(976544),
        em = e.i(21290),
        ep = e.i(677753),
        ef = e.i(940194),
        eg = e.i(252842),
        ey = e.i(892438),
        eE = e.i(823062),
        ev = e.i(127792),
        eb = e.i(858517),
        eh = e.i(921394),
        eT = e.i(149285);
    let ex = e => e.split("-").reduce((e, t) => {
            var a;
            return e + (null != (a = t[0]) ? a : "").toUpperCase() + t.slice(1)
        }, ""),
        eC = (0, s.makeStyles)()((e, t) => {
            let {
                gap: a
            } = t;
            return {
                gap: {
                    gap: a
                },
                flex: {
                    display: "flex"
                },
                justifyContentCenter: {
                    justifyContent: "center"
                },
                justifyContentFlexStart: {
                    justifyContent: "flex-start"
                },
                justifyContentFlexEnd: {
                    justifyContent: "flex-end"
                },
                justifyContentSpaceBetween: {
                    justifyContent: "space-between"
                },
                justifyContentSpaceAround: {
                    justifyContent: "space-around"
                },
                justifyContentSpaceEvenly: {
                    justifyContent: "space-evenly"
                },
                alignItemsCenter: {
                    alignItems: "center"
                },
                alignItemsFlexStart: {
                    alignItems: "flex-start"
                },
                alignItemsFlexEnd: {
                    alignItems: "flex-end"
                },
                flexDirectionRow: {
                    flexDirection: "row"
                },
                flexDirectionRowReverse: {
                    flexDirection: "row-reverse"
                },
                flexDirectionColumn: {
                    flexDirection: "column"
                },
                flexDirectionColumnReverse: {
                    flexDirection: "column-reverse"
                },
                flexWrapWrap: {
                    flexWrap: "wrap"
                },
                flexWrapWrapReverse: {
                    flexWrap: "wrap-reverse"
                },
                flexWrapNoWrap: {
                    flexWrap: "nowrap"
                }
            }
        }),
        eS = (0, r.forwardRef)((e, t) => {
            let {
                id: a,
                className: n,
                classes: l,
                flexDirection: i,
                flexWrap: o,
                justifyContent: s,
                alignItems: u,
                gap: d = 0,
                children: c
            } = e, {
                classes: {
                    flex: m,
                    ...p
                },
                cx: f
            } = eC({
                gap: d
            });
            return r.default.createElement("div", {
                ref: t,
                id: a,
                className: f(m, p.gap, n, null == l ? void 0 : l.root, p["flexDirection".concat(ex(null != i ? i : ""))], p["flexWrap".concat(ex(null != o ? o : ""))], p["alignItems".concat(ex(null != u ? u : ""))], p["justifyContent".concat(ex(null != s ? s : ""))])
            }, c)
        });
    eS.displayName = "Flex";
    var ew, eN, eI, eA = ((eN = {}).Navigation = "CreatorDashboard.Navigation", eN.Error = "CreatorDashboard.Error", eN.Controls = "CreatorDashboard.Controls", eN.DeveloperQuestionnaire = "CreatorDashboard.DeveloperQuestionnaire", eN.CommonUIControls = "CommonUI.Controls", eN);
    let eR = (0, s.makeStyles)()({
        headerFour: {
            marginBottom: "16px"
        },
        unorderedList: {
            margin: "0px"
        },
        orderedList: {
            margin: "0px",
            paddingLeft: "24px"
        }
    });

    function ek() {
        let {
            classes: {
                headerFour: e,
                unorderedList: t,
                orderedList: a
            }
        } = eR(), n = 0, l = () => n += 1;

        function i(e) {
            return e.startsWith("[") ? 1 : e.startsWith("####") ? 2 : e.startsWith("* ") ? 3 : /^\d+\.\s/.test(e) ? 6 : e.startsWith("|") ? 5 : 4
        }

        function o(e) {
            let t = [],
                a = /\[([^\]]+)\]\(([^)]+)\)/g,
                n = 0,
                i = a.exec(e);
            for (; null !== i;) i.index > n && t.push(e.slice(n, i.index)),
                function(e) {
                    try {
                        let {
                            hostname: t
                        } = new URL(e);
                        return "roblox.com" === t || t.endsWith(".roblox.com")
                    } catch (e) {
                        return !1
                    }
                }(i[2]) ? t.push(r.default.createElement(d.Link, {
                    href: i[2],
                    target: "_blank",
                    underline: "always",
                    key: l()
                }, i[1])) : t.push(i[1]), n = i.index + i[0].length, i = a.exec(e);
            return n < e.length && t.push(e.slice(n)), t
        }

        function s(e, t) {
            let a = e.split("**");
            return r.default.createElement(u.Typography, {
                variant: t ? "largeLabel2" : "body1",
                component: "span",
                color: "secondary",
                key: l()
            }, a.map((e, t, a) => t % 2 == 0 ? r.default.createElement(r.Fragment, {
                key: l()
            }, o(e)) : t % 2 == 1 && a.length % 2 == 1 || t % 2 == 1 && a.length % 2 == 0 && t < a.length - 2 ? r.default.createElement("b", {
                key: l()
            }, e) : (a.length % 2 == 0 && a.length, r.default.createElement(r.Fragment, {
                key: l()
            }, o(e)))))
        }

        function c(e) {
            return e.trim().replaceAll(/^\||\|$/g, "").split("|").map(e => e.trim())
        }

        function m(e) {
            if (0 === e.length) return null;
            let t = e.filter(e => !/^\|[\s\-:|]+\|$/.test(e.trim()));
            if (0 === t.length) return null;
            let a = c(t[0]),
                n = t.slice(1);
            return r.default.createElement("table", {
                key: l(),
                className: "margin-top-[8px] margin-bottom-[8px] width-full",
                style: {
                    borderCollapse: "collapse"
                }
            }, r.default.createElement("thead", null, r.default.createElement("tr", null, a.map(e => r.default.createElement("th", {
                className: "stroke-standard stroke-default text-align-x-left padding-small",
                key: l()
            }, s(e, !0))))), r.default.createElement("tbody", null, n.map(e => {
                let t = c(e);
                return r.default.createElement("tr", {
                    key: l()
                }, t.map(e => r.default.createElement("td", {
                    key: l(),
                    className: "stroke-standard stroke-default text-align-x-left padding-small"
                }, s(e))))
            })))
        }

        function p(e) {
            return 3 === e || 6 === e
        }

        function f(e, t) {
            return e === t.length - 1
        }
        return {
            parseText: (0, r.useCallback)((n, o) => {
                var c;
                let g, y = null == (c = null == o ? void 0 : o.includeLineBreaks) || c;
                if (0 === n.trim().length) return r.default.createElement(r.default.Fragment, null, null);
                let E = ((g = n.split("\n")).filter(e => e.length > 0), g.map(e => e.trim())),
                    v = [],
                    b = [],
                    h = !1,
                    T = !1,
                    x = [],
                    C = !1;

                function S(e) {
                    for (let t = e + 1; t < E.length; t += 1)
                        if (E[t].length > 0) return i(E[t]);
                    return null
                }
                let w = 0;

                function N() {
                    for (let e = 0; e < w; e += 1) b.push(r.default.createElement("br", {
                        key: l()
                    }));
                    w = 0
                }

                function I() {
                    ! function() {
                        if (0 === b.length) return;
                        let e = T ? r.default.createElement("ol", {
                            className: a,
                            key: l()
                        }, b.map(e => e)) : r.default.createElement("ul", {
                            className: t,
                            key: l()
                        }, b.map(e => e));
                        v.push(e), b = [], h = !1, T = !1
                    }(), w = 0
                }
                if (E.forEach((t, a) => {
                        if (0 === t.length && C) return;
                        if (0 === t.length && h) {
                            w += 1;
                            return
                        }
                        let n = i(t),
                            o = function(e, t) {
                                switch (t) {
                                    case 1:
                                        let a, n, i;
                                        return n = (a = e.slice(1, -1).split("]("))[1], i = a[0], r.default.createElement(u.Typography, {
                                            variant: "body1",
                                            component: "span",
                                            key: l()
                                        }, r.default.createElement(d.Link, {
                                            href: n,
                                            target: "_blank",
                                            underline: "always"
                                        }, i));
                                    case 3:
                                        let o;
                                        return o = e.replace(/(\*\s*)/, ""), r.default.createElement("li", {
                                            key: l()
                                        }, s(o));
                                    case 6:
                                        let c;
                                        return c = e.replace(/^\d+\.\s*/, ""), r.default.createElement("li", {
                                            key: l()
                                        }, s(c));
                                    case 2:
                                        let m;
                                        return m = e.replace(/(####\s*)/, ""), r.default.createElement(u.Typography, {
                                            variant: "subtitle2",
                                            key: l()
                                        }, m);
                                    case 4:
                                        return s(e);
                                    case 5:
                                        return r.default.createElement(r.Fragment, {
                                            key: l()
                                        }, e);
                                    default:
                                        throw Error("Unexpected markdown type: ".concat(t.toString()))
                                }
                            }(t, n);
                        if (5 === n) {
                            if (C || (C = !0), x.push(t), 5 === n && f(a, E)) {
                                C = !1;
                                let e = m(x);
                                e && v.push(e), x = []
                            }
                        } else if (5 !== n && C) {
                            C = !1;
                            let t = m(x);
                            if (t && v.push(t), x = [], p(n)) h || (h = !0, T = 6 === n), N(), b.push(o);
                            else if (2 === n) v.push(r.default.createElement("div", {
                                className: e
                            }, o));
                            else {
                                v.push(o);
                                let e = S(a);
                                y && null !== e && !p(e) && 5 !== e && 2 !== e && v.push(r.default.createElement("br", null))
                            }
                        } else if (p(n)) h || (h = !0, T = 6 === n), N(), b.push(o), f(a, E) && I();
                        else if (!p(n) && h) I(), v.push(o);
                        else if (2 === n) v.push(r.default.createElement("div", {
                            className: e
                        }, o));
                        else {
                            v.push(o);
                            let e = S(a);
                            y && null !== e && !p(e) && 5 !== e && 2 !== e && v.push(r.default.createElement("br", null))
                        }
                    }), h && I(), C && x.length > 0) {
                    let e = m(x);
                    e && v.push(e)
                }
                return r.default.createElement(r.default.Fragment, null, v.map((e, t) => r.default.createElement("span", {
                    key: t
                }, e)))
            }, [])
        }
    }
    let eM = "RadioButtonQuestion",
        eD = "CheckBoxQuestion",
        eL = "TextBoxQuestion",
        eB = "Title.MissingQuestionnaireId",
        e_ = "Message.MissingQuestionnaireId",
        eq = "Title.ChangedQuestionnaireId",
        eO = "Message.ChangedQuestionnaireId",
        eP = {
            titleKey: "Title.GuidelinesInProgress",
            messageKey: "Message.GuidelinesInProgress",
            buttonKey: "Button.Resume"
        },
        eU = {
            titleKey: "Title.GuidelinesNotStarted",
            messageKey: "Message.GuidelinesNotStarted",
            buttonKey: "Button.Start"
        },
        eG = {
            titleKey: "Title.GuidelinesSubmittedOldVersion",
            messageKey: "Message.GuidelinesSubmittedOldVersion",
            buttonKey: "Button.Update"
        },
        eF = {
            titleKey: "Title.GuidelinesSubmittedNewVersion",
            messageKey: "Message.GuidelinesSubmittedNewVersion",
            buttonKey: "Button.Restart"
        },
        eQ = {
            titleKey: "Title.GuidelinesSubmittedNewVersionInProgress",
            messageKey: "Message.GuidelinesSubmittedNewVersionInProgress",
            buttonKey: "Button.Resume"
        },
        ez = {
            titleKey: "Title.GuidelinesInProgress",
            messageKey: "Message.ContentMaturityInProgress",
            buttonKey: "Button.Resume"
        },
        eH = {
            titleKey: "Title.GuidelinesNotStarted",
            messageKey: "Message.ContentMaturityNotStarted",
            buttonKey: "Button.Start"
        },
        eV = {
            titleKey: "Title.GuidelinesSubmittedOldVersion",
            messageKey: "Message.ContentMaturitySubmittedOldVersion",
            buttonKey: "Button.Update"
        },
        eW = {
            titleKey: "Title.GuidelinesSubmittedNewVersion",
            messageKey: "Message.ContentMaturitySubmittedNewVersion",
            buttonKey: "Button.Restart"
        },
        ej = {
            titleKey: "Title.GuidelinesSubmittedNewVersionInProgress",
            messageKey: "Message.ContentMaturitySubmittedNewVersionInProgress",
            buttonKey: "Button.Resume"
        },
        eK = "started",
        eY = "".concat((0, K.getProductionCreatorHubUrl)("global"), "/docs/reference/engine/classes/PolicyService"),
        eX = "".concat((0, K.getProductionCreatorHubUrl)("global"), "/docs/production/promotion/experience-guidelines"),
        eJ = (e, t) => {
            let a = t.reduce((e, t) => {
                let {
                    questionId: a,
                    value: n
                } = t;
                return {
                    ...e,
                    [a]: JSON.parse(n)
                }
            }, {});

            function n(e) {
                return e.reduce((e, t) => {
                    var a;
                    return [...e, ...null != (a = t.childSections) ? a : []]
                }, [])
            }
            return e.questions.every(function e(t) {
                let l = a[t.id];
                if (void 0 === l) return !1;
                if (t.type === eD) {
                    let a = Array.isArray(l) ? l : [];
                    if (0 === a.length) return !1;
                    let r = t.options.filter(e => {
                            let {
                                id: t
                            } = e;
                            return a.includes(null != t ? t : "")
                        }),
                        i = r.reduce((e, t) => {
                            var a;
                            return [...e, ...null != (a = t.childQuestions) ? a : []]
                        }, []),
                        o = n(r),
                        s = 0 === i.length || i.every(e),
                        u = 0 === o.length || o.every(t => t.questions.every(e));
                    return s && u
                }
                if (t.type === eM) {
                    let a = t.options.find(e => e.id === l);
                    if (a) {
                        var r;
                        let t = null != (r = a.childQuestions) ? r : [],
                            l = n([a]),
                            i = 0 === t.length || t.every(e),
                            o = 0 === l.length || l.every(t => t.questions.every(e));
                        return i && o
                    }
                }
                return !0
            })
        },
        e$ = e => {
            var t, a;
            let {
                sections: n,
                currentIndex: l,
                answers: r,
                violatedSectionIds: i
            } = e, o = n.slice(l + 1);
            if (null == i ? void 0 : i.size) {
                let e = o.find(e => i.has(e.id));
                if (e) return e
            }
            let s = e => !eJ(e, r);
            return null != (t = null != (a = o.find(s)) ? a : n.slice(0, l).find(s)) ? t : null
        },
        eZ = (e, t) => {
            var a;
            return e ? e.find(e => e.id === t) || (null != (a = e.filter(e => "options" in e && !!e.options).flatMap(e => e.options.filter(e => e.childQuestions)).map(e => eZ(e.childQuestions, t)).find(e => null !== e)) ? a : null) : null
        },
        e0 = (e, t, a, n) => [...e.filter(e => e.questionId !== t).filter(e => !n.includes(e.questionId)), {
            questionId: t,
            value: a
        }],
        e1 = e => {
            let {
                section: t,
                priorAnswers: a,
                newAnswers: n,
                questionId: l
            } = e;
            if (!t) return !1;
            let r = eJ(t, a),
                i = eJ(t, n),
                o = eZ(t.questions, l);
            return !r && i && null != o && o.type !== eD
        },
        e2 = (0, r.createContext)({}),
        e4 = (0, r.createContext)(!0),
        e3 = e => {
            let {
                children: t,
                value: a
            } = e;
            return r.default.createElement(e2.Provider, {
                value: a
            }, t)
        },
        e9 = e => {
            let {
                children: t,
                isActive: a
            } = e;
            return r.default.createElement(e4.Provider, {
                value: a
            }, t)
        },
        e8 = (e, t) => {
            let a = (0, r.useRef)(t),
                n = (0, r.useRef)(null);
            (0, r.useEffect)(() => {
                a.current = t
            }, [t]);
            let l = (0, r.useCallback)(() => {
                    if (!a.current || n.current) return;
                    let e = Date.now();
                    n.current = {
                        iso: new Date(e).toISOString(),
                        milliseconds: e
                    }
                }, []),
                i = (0, r.useCallback)(() => {
                    var e;
                    let t = n.current;
                    t && (n.current = null, null == (e = a.current) || e.call(a, {
                        clientTimestamp: t.iso,
                        durationMs: Date.now() - t.milliseconds
                    }))
                }, []);
            (0, r.useEffect)(() => {
                e ? l() : i()
            }, [i, e, l]), (0, r.useEffect)(() => {
                let t = () => i(),
                    a = () => {
                        "hidden" === document.visibilityState ? i() : e && l()
                    };
                return window.addEventListener("pagehide", t), document.addEventListener("visibilitychange", a), () => {
                    window.removeEventListener("pagehide", t), document.removeEventListener("visibilitychange", a), i()
                }
            }, [i, e, l])
        },
        e7 = {
            width: "100%",
            height: "100%"
        },
        e6 = (0, s.makeStyles)()(e => ({
            sectionStyle: {
                ...e7,
                maxWidth: "700px"
            },
            sectionQuestion: {
                marginTop: e.spacing(1)
            },
            sectionSubQuestion: {
                marginTop: "20px"
            },
            container: {
                ...e7
            },
            navigationButtonsContainer: {
                display: "flex",
                flexFlow: "row wrap",
                marginTop: e.spacing(1)
            },
            navigationButtons: {
                marginRight: "16px",
                marginTop: e.spacing(1)
            },
            warningTextContainer: {
                margin: "".concat(e.spacing(4), " 0"),
                fontStyle: "italic"
            }
        }));
    var e5 = (0, r.forwardRef)((e, t) => {
        let {
            isSubQuestion: a,
            children: n
        } = e, {
            classes: {
                sectionQuestion: l,
                sectionSubQuestion: i
            }
        } = e6();
        return r.default.createElement("section", {
            ref: t,
            className: a ? i : l
        }, n)
    });
    let te = e => {
            let t = [];
            return e ? e.reduce((e, t) => {
                var a, n;
                return t.id && t.name && t.questions ? [...e, {
                    id: t.id,
                    name: t.name,
                    description: null != (a = t.description) ? a : null,
                    questions: t.questions,
                    metadata: null != (n = t.metadata) ? n : {}
                }] : e
            }, t) : t
        },
        tt = e => e.reduce((e, t) => t.questionId && t.value ? [...e, {
            questionId: t.questionId,
            value: t.value
        }] : e, []),
        ta = e => e ? e.reduce((e, t) => {
            if (t.id && t.text) {
                if (t.type === eM || t.type === eD) return [...e, {
                    id: t.id,
                    options: t.options,
                    metadata: t.metadata,
                    helpInfo: t.helpInfo,
                    text: t.text,
                    type: t.type
                }];
                if (t.type === eL) return [...e, {
                    id: t.id,
                    validationType: t.validationType,
                    maxInputLength: t.maxInputLength,
                    metadata: t.metadata,
                    helpInfo: t.helpInfo,
                    text: t.text,
                    type: t.type
                }]
            }
            return e
        }, []) : [],
        tn = e => {
            if (e.id && e.name && e.sections && e.description) {
                var t;
                let a;
                return {
                    id: e.id,
                    name: e.name,
                    description: e.description,
                    sections: (t = e.sections, a = [], t ? t.reduce((e, t) => {
                        var a, n;
                        return t.id && t.name && t.questions ? [...e, {
                            id: t.id,
                            name: t.name,
                            description: null != (a = t.description) ? a : null,
                            questions: ta(t.questions),
                            metadata: null != (n = t.metadata) ? n : {}
                        }] : e
                    }, a) : a)
                }
            }
            return null
        },
        tl = e => {
            let {
                validatedAnswers: t,
                errors: a,
                section: n,
                updateAnswer: l,
                depth: i = 0,
                questionComponent: o
            } = e, [s, d] = (0, r.useState)([]);
            return (0, r.useEffect)(() => {
                d(ta(n.questions))
            }, [n]), r.default.createElement(c.Step, null, r.default.createElement(m.StepLabel, null, r.default.createElement(u.Typography, {
                variant: "h1"
            }, n.name)), 0 === s.length ? r.default.createElement(p.CircularProgress, null) : s.map(e => r.default.createElement(o, {
                key: e.id,
                question: e,
                updateAnswer: l,
                validatedAnswers: t,
                errors: a,
                depth: i
            })))
        },
        tr = e => {
            let {
                validatedAnswers: t,
                errors: a,
                section: n,
                updateAnswer: l,
                depth: i = 0,
                questionComponent: o
            } = e, s = (0, r.useMemo)(() => ta(n.questions), [n.questions]);
            return r.default.createElement(c.Step, {
                className: "margin-top-medium"
            }, r.default.createElement(m.StepLabel, null, r.default.createElement(u.Typography, {
                variant: "h6"
            }, n.name)), s.map(e => r.default.createElement(o, {
                key: e.id,
                question: e,
                updateAnswer: l,
                validatedAnswers: t,
                errors: a,
                depth: i
            })))
        },
        ti = {
            isSectionStepperEnabled: !1,
            isFetched: !0
        },
        to = e => {
            let {
                children: t
            } = e;
            return r.default.createElement(r.default.Fragment, null, t(ti))
        },
        ts = {
            scrollContainerId: "applayout-scroll-container",
            isHostReady: !0,
            questionnaireVersion: {
                shouldUseV2: !0,
                isFetched: !0
            },
            sectionStepper: {
                isExperimentReady: !0,
                isExperimentEnabled: !1,
                Enrollment: to,
                Cache: to
            },
            onNotify: () => void 0
        },
        tu = (0, r.createContext)(ts),
        td = () => (0, r.useContext)(tu);

    function tc() {
        let e, t;
        return e = a => a.id ? a.type === eM || a.type === eD ? [a.id, ...a.options ? a.options.reduce((a, n) => {
            let l = [];
            return n.childQuestions && (l = [...n.childQuestions.reduce((t, a) => [...t, ...e(a)], [])]), n.childSections && (l = [...l, ...n.childSections.reduce((e, a) => [...e, ...t(a)], [])]), [...a, ...l]
        }, []) : []] : a.type === eL ? [a.id, ...(e => {
            throw Error("TextBox Questions are not supported for cleaning answers. Question ID: ".concat(e.id))
        })(a)] : [a.id] : [], t = t => t.questions ? t.questions.reduce((t, a) => [...t, ...e(a)], []) : [], {
            traverseQuestionsForQuestionIds: (0, r.useCallback)(t => 0 === t.length ? [] : t.reduce((t, a) => [...t, ...e(a)], []), [e]),
            traverseSectionsForQuestionIds: (0, r.useCallback)(e => 0 === e.length ? [] : e.reduce((e, a) => [...e, ...t(a)], []), [t])
        }
    }
    let tm = e => {
            var t, a;
            let {
                open: n,
                onClose: l,
                helpInfo: i
            } = e, {
                parseText: o
            } = ek(), [s, u] = (0, r.useState)("example-0"), d = i.examples && i.examples.length > 0;
            (0, r.useEffect)(() => {
                n && u("example-0")
            }, [n]);
            let c = r.default.useMemo(() => {
                    let e = [];
                    return i.images && i.images.forEach(t => {
                        t.url && e.push({
                            type: "image",
                            url: t.url,
                            altText: t.altText
                        })
                    }), i.videos && i.videos.forEach(t => {
                        t.url && e.push({
                            type: "video",
                            url: t.url,
                            altText: t.altText
                        })
                    }), e
                }, [i]),
                m = e => 0 === e.length ? null : r.default.createElement("div", {
                    className: "flex wrap gap-medium justify-center width-full"
                }, e.map(e => {
                    let t, a;
                    return r.default.createElement("div", {
                        key: "".concat(e.type, "-").concat(e.url),
                        className: "radius-medium max-width-[280px]",
                        style: {
                            flex: "1 1 300px",
                            boxSizing: "border-box"
                        }
                    }, "image" === e.type && r.default.createElement("img", {
                        src: e.url,
                        alt: e.altText || "Help image",
                        className: "width-full radius-medium max-height-[300px]",
                        style: {
                            height: "auto",
                            display: "block",
                            objectFit: "contain"
                        }
                    }), "video" === e.type && (t = e.url, /youtube\.com\/(embed|watch)|youtu\.be\//.test(t)) && r.default.createElement("iframe", {
                        src: e.url.replace("youtube.com", "youtube-nocookie.com"),
                        title: e.altText || "YouTube video",
                        className: "width-full radius-medium",
                        style: {
                            aspectRatio: "16 / 9",
                            display: "block",
                            border: "none"
                        },
                        allow: "accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture",
                        allowFullScreen: !0
                    }), "video" === e.type && (a = e.url, !/youtube\.com\/(embed|watch)|youtu\.be\//.test(a)) && r.default.createElement("video", {
                        controls: !0,
                        className: "width-full radius-medium",
                        style: {
                            height: "auto",
                            display: "block",
                            maxHeight: "300px"
                        },
                        "aria-label": e.altText || "Help video"
                    }, r.default.createElement("source", {
                        src: e.url
                    }), r.default.createElement("track", {
                        kind: "captions"
                    })))
                }));
            return r.default.createElement(Y.Dialog, {
                open: n,
                onOpenChange: e => {
                    e || l()
                },
                size: "Large",
                isModal: !0,
                hasCloseAffordance: !0,
                closeLabel: "close"
            }, r.default.createElement(Y.DialogContent, {
                className: "flex flex-col",
                style: {
                    maxHeight: "90vh",
                    maxWidth: "min(720px, 90vw)"
                }
            }, r.default.createElement(Y.DialogBody, {
                className: "flex flex-col gap-large scroll-y min-height-[0px]"
            }, r.default.createElement(Y.DialogTitle, {
                className: "text-heading-medium margin-none"
            }, i.title || "Help Information"), i.text && r.default.createElement("div", {
                className: "text-body-medium",
                style: {
                    wordWrap: "break-word",
                    overflowWrap: "break-word"
                }
            }, o(i.text)), d && r.default.createElement(X.Tabs, {
                value: s,
                onValueChange: u
            }, r.default.createElement(X.TabsList, {
                className: "width-full"
            }, null == (t = i.examples) ? void 0 : t.map((e, t) => {
                let a = "example-".concat(t);
                return r.default.createElement(X.TabsTrigger, {
                    key: a,
                    value: a
                }, e.title || "Example ".concat(t + 1))
            })), null == (a = i.examples) ? void 0 : a.map((e, t) => {
                let a = "example-".concat(t);
                return r.default.createElement(X.TabsContent, {
                    key: a,
                    value: a,
                    className: "padding-y-medium"
                }, (e => {
                    var t;
                    let a, n = null == (t = i.examples) ? void 0 : t[e];
                    if (!n) return null;
                    let l = (a = [], n.images && n.images.forEach(e => {
                        e.url && a.push({
                            type: "image",
                            url: e.url,
                            altText: e.altText
                        })
                    }), n.videos && n.videos.forEach(e => {
                        e.url && a.push({
                            type: "video",
                            url: e.url,
                            altText: e.altText
                        })
                    }), a);
                    return r.default.createElement("div", {
                        className: "flex flex-col gap-medium",
                        style: {
                            wordWrap: "break-word",
                            overflowWrap: "break-word"
                        }
                    }, n.title && r.default.createElement("h2", {
                        className: "text-title-large"
                    }, n.title), n.text && r.default.createElement("div", {
                        className: "text-body-medium"
                    }, o(n.text)), m(l))
                })(t))
            })), m(c))))
        },
        tp = e => {
            let {
                helpInfo: t
            } = e, {
                translate: a
            } = (0, i.useTranslation)(), [n, l] = (0, r.useState)(!1);
            return t.title || t.text || t.examples && t.examples.length > 0 ? r.default.createElement(r.default.Fragment, null, r.default.createElement("button", {
                className: "text-body-medium content-default cursor-pointer padding-[0px]",
                style: {
                    background: "none",
                    border: "none",
                    textDecoration: "underline",
                    marginLeft: "calc(var(--size-600) + var(--gap-medium))"
                },
                onClick: e => {
                    e.preventDefault(), l(!0)
                },
                type: "button"
            }, a("Label.ViewDetails")), r.default.createElement(tm, {
                open: n,
                onClose: () => l(!1),
                helpInfo: t
            })) : null
        },
        tf = (0, s.makeStyles)()(() => ({
            questionText: {
                display: "inline",
                "& p": {
                    display: "inline",
                    margin: 0
                }
            }
        })),
        tg = e => {
            let {
                questionText: t,
                helpInfo: a,
                children: n
            } = e, {
                translate: l
            } = (0, i.useTranslation)(), {
                parseText: o
            } = ek(), {
                classes: s
            } = tf(), [u, d] = (0, r.useState)(!1), {
                shouldUseV2: c
            } = td().questionnaireVersion, m = c && a && (a.title || a.text || a.examples && a.examples.length > 0);
            return r.default.createElement(r.default.Fragment, null, r.default.createElement(f.Grid, {
                item: !0
            }, r.default.createElement("div", {
                className: "inline-flex items-center flex-wrap gap-[4px]"
            }, r.default.createElement("span", {
                className: s.questionText
            }, o(t.trim(), {
                includeLineBreaks: !0
            }), m && r.default.createElement("button", {
                className: "margin-left-[4px] text-body-medium content-default cursor-pointer",
                style: {
                    background: "none",
                    border: "none",
                    padding: 0,
                    textDecoration: "underline"
                },
                onClick: e => {
                    e.preventDefault(), d(!0)
                },
                type: "button"
            }, l("Label.ViewDetails")))), n), m && a && r.default.createElement(tm, {
                open: u,
                onClose: () => {
                    d(!1)
                },
                helpInfo: a
            }))
        },
        ty = e => {
            let {
                translationKey: t
            } = e, {
                translate: a
            } = (0, i.useTranslation)();
            return r.default.createElement(u.Typography, {
                variant: "body2",
                color: "error",
                display: "block"
            }, a(t))
        },
        tE = e => {
            let {
                validatedAnswers: t,
                errors: a,
                question: n,
                updateAnswer: l,
                depth: i = 0,
                questionComponent: o
            } = e, {
                shouldUseV2: s
            } = td().questionnaireVersion, {
                traverseQuestionsForQuestionIds: d,
                traverseSectionsForQuestionIds: c
            } = tc(), m = t.find(e => e.questionId === n.id), p = (e => {
                if (e) {
                    let t = JSON.parse(e);
                    if (t && Array.isArray(t)) return t
                }
                return []
            })(null == m ? void 0 : m.value), E = !!a[n.id], v = n.options.filter(e => {
                var t;
                return p.includes(null != (t = e.id) ? t : "")
            }), b = ta(v.reduce((e, t) => {
                var a;
                return [...e, ...null != (a = t.childQuestions) ? a : []]
            }, [])), h = te(v.reduce((e, t) => {
                var a;
                return [...e, ...null != (a = t.childSections) ? a : []]
            }, [])), T = (e, t) => {
                let a = p.filter(e => !t.includes(e)),
                    r = n.options.filter(e => {
                        var t;
                        return a.includes(null != (t = e.id) ? t : "")
                    }),
                    i = ta(r.reduce((e, t) => {
                        var a;
                        return [...e, ...null != (a = t.childQuestions) ? a : []]
                    }, [])),
                    o = te(r.reduce((e, t) => {
                        var a;
                        return [...e, ...null != (a = t.childSections) ? a : []]
                    }, [])),
                    s = d(i),
                    u = c(o);
                l(e, JSON.stringify(t), [...s, ...u])
            }, x = e => {
                e.target.checked ? T(n.id, [...p, e.target.name]) : T(n.id, p.filter(t => t !== e.target.name))
            };
            return s ? r.default.createElement("section", null, r.default.createElement(f.Grid, {
                container: !0,
                direction: "column"
            }, r.default.createElement(tg, {
                questionText: n.text,
                helpInfo: n.helpInfo
            }, E && r.default.createElement(ty, {
                translationKey: "Message.MustChooseOption"
            })), r.default.createElement("div", {
                className: "flex flex-col gap-small margin-top-small"
            }, n.options.map(e => {
                var t;
                return r.default.createElement("div", {
                    key: e.id
                }, r.default.createElement(J.Checkbox, {
                    label: null != (t = e.text) ? t : "",
                    size: "Medium",
                    placement: "Start",
                    isChecked: !!p && !!e.id && p.includes(e.id),
                    onCheckedChange: t => {
                        var a;
                        t ? T(n.id, [...p, null != (a = e.id) ? a : ""]) : T(n.id, p.filter(t => t !== e.id))
                    }
                }), e.helpInfo && r.default.createElement(tp, {
                    helpInfo: e.helpInfo
                }))
            }))), b.length > 0 && b.map(e => r.default.createElement(o, {
                key: e.id,
                validatedAnswers: t,
                errors: a,
                question: e,
                updateAnswer: l,
                depth: i + 1,
                isSubQuestion: !0
            })), h.length > 0 && h.map(e => r.default.createElement(tr, {
                validatedAnswers: t,
                errors: a,
                updateAnswer: l,
                section: e,
                depth: i + 1,
                key: e.id,
                questionComponent: o
            }))) : r.default.createElement("section", null, r.default.createElement(f.Grid, {
                container: !0,
                direction: "column"
            }, r.default.createElement(tg, {
                questionText: n.text,
                helpInfo: n.helpInfo
            }, E && r.default.createElement(ty, {
                translationKey: "Message.MustChooseOption"
            })), n.options.map(e => r.default.createElement(g.FormControlLabel, {
                key: e.id,
                value: e.id,
                control: r.default.createElement(y.Checkbox, {
                    checked: !!p && !!e.id && p.includes(e.id),
                    onChange: x,
                    name: e.id
                }),
                label: r.default.createElement(u.Typography, {
                    variant: "body1",
                    color: "primary"
                }, e.text)
            }))), b.length > 0 && b.map(e => r.default.createElement(o, {
                key: e.id,
                validatedAnswers: t,
                errors: a,
                question: e,
                updateAnswer: l,
                depth: i + 1,
                isSubQuestion: !0
            })), h.length > 0 && h.map(e => r.default.createElement(tl, {
                validatedAnswers: t,
                errors: a,
                updateAnswer: l,
                section: e,
                depth: i + 1,
                key: e.id,
                questionComponent: o
            })))
        },
        tv = (0, s.makeStyles)()(() => ({
            radioGroupContainer: {
                margin: "var(--gap-medium) 0"
            }
        })),
        tb = e => {
            let {
                validatedAnswers: t,
                question: a,
                updateAnswer: n,
                errors: l,
                depth: i = 0,
                questionComponent: o
            } = e, {
                shouldUseV2: s
            } = td().questionnaireVersion, {
                traverseQuestionsForQuestionIds: d,
                traverseSectionsForQuestionIds: c
            } = tc(), m = t.find(e => e.questionId === a.id), p = null == m ? null : JSON.parse(m.value), y = !!l[a.id], b = a.options.find(e => e.id === p), h = ta(null == b ? void 0 : b.childQuestions), T = te(null == b ? void 0 : b.childSections), {
                classes: {
                    radioGroupContainer: x
                }
            } = tv();
            return s ? r.default.createElement("section", null, r.default.createElement(f.Grid, {
                container: !0,
                direction: "column"
            }, r.default.createElement(tg, {
                questionText: a.text,
                helpInfo: a.helpInfo
            }, y && r.default.createElement(ty, {
                translationKey: "Message.MustChooseOption"
            })), r.default.createElement(f.Grid, {
                className: x,
                item: !0
            }, r.default.createElement($.RadioGroup, {
                value: null != p ? p : void 0,
                onValueChange: e => {
                    let t = d(h),
                        l = c(T);
                    n(a.id, JSON.stringify(e), [...t, ...l])
                },
                size: "Medium",
                placement: "Start",
                className: "gap-small"
            }, a.options.map(e => {
                var t, a;
                return r.default.createElement("div", {
                    key: e.id
                }, r.default.createElement($.Radio, {
                    value: null != (t = e.id) ? t : "",
                    label: null != (a = e.text) ? a : ""
                }), e.helpInfo && r.default.createElement(tp, {
                    helpInfo: e.helpInfo
                }))
            })))), h.length > 0 && h.map(e => r.default.createElement(o, {
                key: e.id,
                validatedAnswers: t,
                errors: l,
                question: e,
                updateAnswer: n,
                depth: i + 1,
                isSubQuestion: !0
            })), T.length > 0 && T.map(e => r.default.createElement(tr, {
                validatedAnswers: t,
                errors: l,
                updateAnswer: n,
                section: e,
                depth: i + 1,
                key: e.id,
                questionComponent: o
            }))) : r.default.createElement("section", null, r.default.createElement(f.Grid, {
                container: !0,
                direction: "column"
            }, r.default.createElement(tg, {
                questionText: a.text,
                helpInfo: a.helpInfo
            }, y && r.default.createElement(ty, {
                translationKey: "Message.MustChooseOption"
            })), r.default.createElement(f.Grid, {
                className: x,
                item: !0
            }, r.default.createElement(E.RadioGroup, {
                name: "overview",
                value: p,
                onChange: e => {
                    let t = d(h),
                        l = c(T);
                    n(a.id, JSON.stringify(e.target.value), [...t, ...l])
                }
            }, a.options.map(e => {
                var t;
                return r.default.createElement(g.FormControlLabel, {
                    key: e.id,
                    value: e.id,
                    control: r.default.createElement(v.Radio, {
                        "aria-label": null != (t = e.text) ? t : "Error"
                    }),
                    label: r.default.createElement(u.Typography, {
                        variant: "body1",
                        color: "primary"
                    }, e.text)
                })
            })))), h.length > 0 && h.map(e => r.default.createElement(o, {
                key: e.id,
                validatedAnswers: t,
                errors: l,
                question: e,
                updateAnswer: n,
                depth: i + 1,
                isSubQuestion: !0
            })), T.length > 0 && T.map(e => r.default.createElement(tl, {
                validatedAnswers: t,
                errors: l,
                updateAnswer: n,
                section: e,
                depth: i + 1,
                key: e.id,
                questionComponent: o
            })))
        };

    function th(e, a, n) {
        let l = "".concat("https://apis.roblox.com", "/").concat(e),
            r = t;
        return new ep.Configuration({
            robloxSiteDomain: "roblox.com",
            basePath: l,
            credentials: "include",
            enableMrRouter: !0,
            ...r && {
                unifiedLogger: r
            },
            ...null == n ? void 0 : n.middleware,
            ...(null == n ? void 0 : n.enableBoundAuthToken) !== void 0,
            ...(null == n ? void 0 : n.boundAuthTokenLoadTimeout) !== void 0,
            ...(null == n ? void 0 : n.boundAuthTokenDataTimeout) !== void 0
        })
    }
    let tT = () => {
            if (!a) {
                let e = th("experience-questionnaire");
                a = {
                    questionnaireApi: new em.QuestionnairesApi(e),
                    responseApi: new em.ResponsesApi(e),
                    eligibilityApi: new em.EligibilityApi(e),
                    metadataApi: new em.MetadataApi(e),
                    questionnairesApiV2: new ec.QuestionnairesApi(e),
                    responsesApiV2: new ec.ResponsesApi(e)
                }
            }
            return a
        },
        tx = {
            getUniverseEligibility: e => tT().eligibilityApi.eligibilityGetUniverseEligibility({
                universeId: e
            }),
            getQuestionnaireStatus: () => tT().questionnaireApi.questionnairesGetQuestionnaireStatusForUser(),
            getLatestQuestionnaireIdForUniverse: e => tT().questionnaireApi.questionnairesGetLatestQuestionnaireIdForUniverse({
                universeId: e
            }),
            getSubmissionLatest: e => tT().responseApi.responsesGetLatestSubmission({
                universeId: e
            }),
            getQuestionnaireById: (e, t) => tT().questionnaireApi.questionnairesGetQuestionnaireById({
                questionnaireId: e,
                localeCode: t
            }),
            getAnswersByUniverseId: e => tT().responseApi.responsesGetActiveResponse({
                universeId: e
            }),
            async saveResponseByUniverseId(e, t, a) {
                await tT().responseApi.responsesSaveActiveResponse({
                    saveActiveResponseRequestBody: {
                        questionnaireId: t,
                        response: a
                    },
                    universeId: e
                })
            },
            validateResponse: async (e, t) => tT().responseApi.responsesValidateResponse({
                validateResponseRequestBody: {
                    questionnaireId: e,
                    response: t
                }
            }),
            getSubmissionPreview: async (e, t, a, n) => tT().responseApi.responsesPreviewDescriptors({
                previewSubmissionRequestBody: {
                    universeId: e,
                    questionnaireId: t,
                    response: a
                },
                localeCode: n
            }),
            submitResponseByUniverseId: (e, t, a) => tT().responseApi.responsesSubmitResponse({
                submitResponseRequestBody: {
                    questionnaireId: t,
                    response: a
                },
                universeId: e
            }),
            getMetadataStatus: e => tT().metadataApi.metadataGetUniverseMetadataStatus({
                universeId: e
            }),
            getQuestionnairePublishStatusList: e => tT().responseApi.responsesGetQuestionnairePublishStatusList({
                universeId: e
            })
        },
        tC = e => {
            var t, a;
            let {
                validatedAnswers: n,
                question: l,
                updateAnswer: o,
                errors: s
            } = e, {
                translate: d
            } = (0, i.useTranslation)(), c = null != (t = null == (a = n.find(e => e.questionId === l.id)) ? void 0 : a.value) ? t : "", m = !!s[l.id];
            return r.default.createElement("section", null, r.default.createElement(f.Grid, {
                container: !0,
                direction: "column"
            }, r.default.createElement(tg, {
                questionText: l.text,
                helpInfo: l.helpInfo
            }, m && 0 === c.length && r.default.createElement(ty, {
                translationKey: "Message.TextBoxNotEmpty"
            }), m && l.validationType === em.TextBoxValidationType.Email && r.default.createElement(ty, {
                translationKey: "Message.TextBoxNotValidEmail"
            })), r.default.createElement(f.Grid, {
                item: !0
            }, r.default.createElement(b.Input, {
                id: l.id,
                value: c,
                onChange: e => {
                    if (null === l.maxInputLength || e.target.value.length <= l.maxInputLength) throw Error("TextBox Questions are not currently supported")
                },
                error: m
            })), l.maxInputLength && c.length >= l.maxInputLength && r.default.createElement(f.Grid, {
                item: !0
            }, r.default.createElement(u.Typography, {
                variant: "body2",
                color: "secondary"
            }, d("Message.MaxLengthTextInput", {
                length: l.maxInputLength.toString()
            })))))
        },
        tS = e => {
            let {
                validatedAnswers: t,
                errors: a,
                question: n,
                updateAnswer: l,
                depth: i = 0,
                questionComponent: o
            } = e;
            return r.default.createElement(r.default.Fragment, null, n.type === eM && r.default.createElement(tb, {
                validatedAnswers: t,
                updateAnswer: l,
                question: n,
                errors: a,
                depth: i,
                questionComponent: o
            }), n.type === eD && r.default.createElement(tE, {
                validatedAnswers: t,
                updateAnswer: l,
                question: n,
                errors: a,
                depth: i,
                questionComponent: o
            }), n.type === eL && r.default.createElement(tC, {
                validatedAnswers: t,
                updateAnswer: l,
                question: n,
                errors: a
            }))
        },
        tw = e => {
            let {
                validatedAnswers: t,
                errors: a,
                question: n,
                updateAnswer: l,
                isSubQuestion: i,
                depth: o = 0
            } = e, s = (0, r.useRef)(null), [u, d] = (0, r.useState)(!1), c = (0, r.useContext)(e4), {
                onQuestionViewed: m
            } = (0, r.useContext)(e2);
            (0, r.useEffect)(() => {
                let e = s.current;
                if (!e || !m || !c || "u" < typeof IntersectionObserver) return;
                let t = new IntersectionObserver(e => {
                    var t;
                    let [a] = e;
                    return d(null != (t = null == a ? void 0 : a.isIntersecting) && t)
                }, {
                    threshold: 0
                });
                return t.observe(e), () => {
                    t.disconnect(), d(!1)
                }
            }, [c, m]);
            let p = (0, r.useCallback)(e => {
                null == m || m(n.id, e)
            }, [m, n.id]);
            return e8(c && !!m && ("u" < typeof IntersectionObserver || u), p), r.default.createElement(e5, {
                ref: s,
                isSubQuestion: i
            }, r.default.createElement(tS, {
                validatedAnswers: t,
                errors: a,
                question: n,
                updateAnswer: l,
                depth: o,
                questionComponent: tw
            }))
        },
        tN = (0, s.makeStyles)()(e => ({
            accordionRoot: {
                border: "unset",
                borderBottom: "1px solid ".concat(e.palette.components.divider),
                "&.Mui-expanded": {
                    margin: 0
                },
                "::before": {
                    content: "none"
                }
            },
            accordionSummaryContent: {
                justifyContent: "space-between",
                alignItems: "center",
                paddingRight: "var(--padding-small)"
            }
        })),
        tI = e => {
            let {
                questions: t,
                id: a,
                name: n,
                answers: l,
                errors: i,
                children: o,
                onChange: s,
                updateAnswer: d,
                expanded: c = !1,
                completed: m = !1,
                violated: p = !1
            } = e, {
                onSectionViewed: f
            } = (0, r.useContext)(e2), g = r.default.useCallback(e => {
                null == f || f(a, e)
            }, [a, f]);
            e8(c && !!f, g);
            let {
                classes: {
                    accordionRoot: y,
                    accordionSummaryContent: E
                }
            } = tN();
            return r.default.createElement(h.Accordion, {
                square: !0,
                variant: "outlined",
                expanded: c,
                onChange: () => s(a),
                classes: {
                    root: y
                }
            }, r.default.createElement(T.AccordionSummary, {
                classes: {
                    content: E
                },
                id: a,
                "data-testid": "".concat(a, "-summary")
            }, r.default.createElement(u.Typography, {
                variant: "h5"
            }, n), p && r.default.createElement(x.ErrorOutlineOutlinedIcon, {
                color: "error"
            }), !p && m && r.default.createElement(C.CheckCircleOutlineIcon, {
                color: "success"
            })), r.default.createElement(S.AccordionDetails, null, r.default.createElement(e9, {
                isActive: c
            }, t.map(e => r.default.createElement(tw, {
                errors: i,
                validatedAnswers: l,
                key: e.id,
                question: e,
                updateAnswer: d
            })), r.default.createElement(eS, {
                gap: 10
            }, o))))
        },
        tA = e => {
            setTimeout(() => {
                let t = document.getElementById(e);
                if (!t) return;
                let a = t.parentElement;
                for (; a;) {
                    let {
                        overflowY: e
                    } = window.getComputedStyle(a);
                    if ("auto" === e || "scroll" === e) break;
                    a = a.parentElement
                }
                if (!a) return void t.scrollIntoView({
                    block: "start",
                    behavior: "smooth"
                });
                let n = a.getBoundingClientRect(),
                    l = 0;
                a.querySelectorAll(".sticky").forEach(e => {
                    let t = window.getComputedStyle(e),
                        a = parseFloat(t.top);
                    "sticky" === t.position && a <= 0 && (l = Math.max(l, e.offsetHeight))
                });
                let r = t.getBoundingClientRect();
                a.scrollTo({
                    top: a.scrollTop + r.top - n.top - l,
                    behavior: "smooth"
                })
            }, 300)
        };
    var tR = (0, i.withTranslation)(e => {
        var t;
        let {
            questionnaire: a,
            answers: n,
            errors: l,
            isSaving: o,
            setAnswers: s,
            send: d,
            save: c,
            goToLanding: m,
            omitActionBar: p,
            onExpandedSectionChange: f,
            violatedSectionIds: g
        } = e, y = a.sections.length, {
            parseText: E
        } = ek(), {
            translate: v
        } = (0, i.useTranslation)(), b = null == (t = a.sections[0]) ? void 0 : t.description, h = (0, r.useMemo)(() => a.sections.map(e => {
            let {
                id: t
            } = e;
            return t
        }), [a.sections]), [T, x] = (0, r.useState)(() => {
            var e;
            return null != (e = h[0]) ? e : null
        });
        (0, r.useEffect)(() => {
            !h.length || null !== T && (T && h.includes(T) || x(h[0]))
        }, [T, h]), (0, r.useEffect)(() => {
            null == f || f(T)
        }, [T, f]), (0, r.useLayoutEffect)(() => {
            if (!(null == g ? void 0 : g.size)) return;
            let e = h.find(e => g.has(e));
            e && (x(e), tA(e))
        }, [g, h]);
        let C = (0, r.useCallback)(e => {
                let t = null != e ? e : n,
                    {
                        sections: l
                    } = a,
                    r = l.findIndex(e => e.id === T),
                    i = e$({
                        sections: l,
                        currentIndex: r,
                        answers: t,
                        violatedSectionIds: g
                    });
                i ? (x(i.id), tA(i.id)) : x(null)
            }, [T, n, a, g]),
            S = (0, r.useCallback)((e, t, l, r) => {
                let i = a.sections.find(t => t.id === e),
                    o = e0(n, t, l, r);
                s(t, o), c(o), e1({
                    section: i,
                    priorAnswers: n,
                    newAnswers: o,
                    questionId: t
                }) && C(o)
            }, [n, C, a.sections, c, s]),
            N = (0, H.useQueryClient)(),
            I = (0, r.useCallback)(async () => {
                await c(), await N.invalidateQueries({
                    queryKey: ["experienceQuestionnaire"]
                }), m()
            }, [m, N, c]),
            {
                completedSectionsMap: A,
                completedSectionsCount: R
            } = (0, r.useMemo)(() => {
                let e = {},
                    t = 0;
                return a.sections.forEach(a => {
                    let l = eJ(a, n);
                    e[a.id] = l, l && (t += 1)
                }), {
                    completedSectionsMap: e,
                    completedSectionsCount: t
                }
            }, [n, a.sections]);
        return y ? r.default.createElement(r.default.Fragment, null, r.default.createElement(u.Typography, null, v("Label.SectionsCompleted", {
            completed: R.toString(),
            total: y.toString()
        })), b && r.default.createElement("div", null, E(b)), r.default.createElement("div", null, a.sections.map(e => {
            let {
                id: t,
                name: a,
                questions: i
            } = e;
            return r.default.createElement(tI, {
                key: t,
                id: t,
                name: a,
                errors: l,
                answers: n,
                completed: A[t],
                violated: null == g ? void 0 : g.has(t),
                questions: i,
                expanded: T === t,
                onChange: e => {
                    x(t => t === e ? null : e)
                },
                updateAnswer: (e, a, n) => {
                    S(t, e, a, n)
                }
            })
        })), !p && r.default.createElement(eS, {
            gap: 12
        }, r.default.createElement(w.Button, {
            disabled: R !== y || o,
            variant: "contained",
            color: "primaryBrand",
            loading: o,
            onClick: d
        }, v("Button.Continue")), r.default.createElement(w.Button, {
            disabled: o,
            loading: o,
            variant: "contained",
            color: "secondary",
            onClick: I
        }, v("Action.SaveDraft")))) : null
    }, [eA.DeveloperQuestionnaire, eA.CommonUIControls, eA.Controls]);
    let tk = {
            width: "100%",
            height: "100%"
        },
        tM = (0, s.makeStyles)()(e => ({
            mainGrid: {
                ...tk,
                maxWidth: "700px",
                minWidth: 0,
                marginTop: e.spacing(1),
                display: "flex",
                flexDirection: "column"
            },
            sectionLabel: {
                fontWeight: "bold",
                marginBottom: e.spacing(2)
            },
            complianceText: {
                width: "50%",
                marginBottom: e.spacing(2)
            },
            table: {
                marginBottom: e.spacing(3)
            },
            restrictionsTable: {
                tableLayout: "fixed"
            },
            tableContainer: {
                width: "100%",
                maxWidth: "100%",
                minWidth: 0,
                overflowX: "auto"
            },
            restrictionsFirstColumnHeader: {
                width: "40%"
            },
            restrictionsHeaderText: {
                minWidth: 0,
                overflowWrap: "anywhere"
            },
            cell: {
                width: "50%"
            },
            cellIncreaseMaturity: {
                display: "flex",
                justifyContent: "space-between",
                alignItems: "center"
            },
            firstColumnHeader: {
                width: "50%"
            },
            tooltip: {
                display: "flex",
                alignItems: "center",
                minWidth: 0
            },
            tooltipIcon: {
                marginLeft: "8px",
                flexShrink: 0
            },
            boldText: {
                fontWeight: 450
            },
            unorderedList: {
                margin: "0px"
            },
            commonTextDiv: {
                marginTop: "24px"
            },
            guidelinesImpact: {
                marginTop: "16px"
            }
        }));
    async function tD(e) {
        try {
            return await e()
        } catch (a) {
            let t = function(e) {
                if (e && "object" == typeof e && "status" in e) {
                    let {
                        status: t
                    } = e;
                    return "number" == typeof t ? t : void 0
                }
            }(a);
            if (t === eg.StatusCodes.BAD_GATEWAY || t === eg.StatusCodes.GATEWAY_TIMEOUT || t === eg.StatusCodes.REQUEST_TIMEOUT || t === eg.StatusCodes.INTERNAL_SERVER_ERROR || t === eg.StatusCodes.SERVICE_UNAVAILABLE) return await e();
            throw a
        }
    }
    let tL = new class {
            getApi() {
                if (!this.experienceGuidelinesServiceApi) {
                    let e = th("experience-guidelines-service");
                    this.experienceGuidelinesServiceApi = new ef.ExperienceGuidelinesServiceAPIApi(e)
                }
                return this.experienceGuidelinesServiceApi
            }
            getDetailedGuidelines(e) {
                return this.getApi().v1beta1DetailedGuidelinesPost({
                    v1Beta1GetDetailedGuidelinesRequest: {
                        universeId: e
                    }
                })
            }
            getDetailedGuidelinesV2(e) {
                return this.getApi().v2beta1DetailedGuidelinesPost({
                    v2Beta1GetDetailedGuidelinesRequest: {
                        universeId: e
                    }
                })
            }
            saveCreatorOverrides(e, t) {
                return this.getApi().v1beta1CreatorOverridesPost({
                    v1Beta1SaveCreatorOverridesRequest: {
                        universeId: e,
                        creatorOverrides: t
                    }
                })
            }
            async multiGetAgeRecommendations(e) {
                let t = arguments.length > 1 && void 0 !== arguments[1] && arguments[1],
                    a = {
                        v1Beta1MultiGetAgeRecommendationRequest: {
                            universeIds: e
                        }
                    };
                return t ? tD(() => this.getApi().v1beta1MultiAgeRecommendationPost(a)) : this.getApi().v1beta1MultiAgeRecommendationPost(a)
            }
            async multiGetCreatorEligibility(e, t, a) {
                let n = arguments.length > 3 && void 0 !== arguments[3] && arguments[3],
                    l = {
                        v1Beta1MultiGetCreatorEligibilityRequest: {
                            universeId: e,
                            userIds: t,
                            action: a
                        }
                    };
                return n ? tD(() => this.getApi().v1beta1MultiCreatorEligibilityPost(l)) : this.getApi().v1beta1MultiCreatorEligibilityPost(l)
            }
            getCreatorControlsAgeRestriction(e) {
                return this.getApi().v1beta1CreatorControlsAgeRestrictionUniverseIdGet({
                    universeId: e
                })
            }
            saveCreatorControlsAgeRestriction(e, t) {
                return this.getApi().v1beta1CreatorControlsAgeRestrictionUniverseIdPost({
                    universeId: e,
                    v1Beta1SaveCreatorControlsAgeRestrictionRequest: {
                        universeId: e,
                        ageRestriction: t
                    }
                })
            }
            getCreatorControlsGeoRestriction(e) {
                return this.getApi().v1beta1CreatorControlsGeoRestrictionUniverseIdGet({
                    universeId: e
                })
            }
            saveCreatorControlsGeoRestriction(e, t) {
                return this.getApi().v1beta1CreatorControlsGeoRestrictionUniverseIdPost({
                    universeId: e,
                    v1Beta1SaveCreatorControlsGeoRestrictionRequest: {
                        universeId: e,
                        geoRestriction: t
                    }
                })
            }
            getAllCountries() {
                let e = arguments.length > 0 && void 0 !== arguments[0] && arguments[0];
                return e ? tD(() => this.getApi().v1beta1CountriesGet()) : this.getApi().v1beta1CountriesGet()
            }
            constructor() {
                (0, l._)(this, "experienceGuidelinesServiceApi", void 0)
            }
        },
        tB = e => {
            let {
                disabled: t,
                tooltipMsg: a,
                onClick: n
            } = e, {
                translate: l
            } = (0, i.useTranslation)(), o = r.default.createElement(w.Button, {
                size: "small",
                color: "secondary",
                variant: "contained",
                disabled: t,
                onClick: n
            }, l("Title.IncreaseMaturity") || "Increase maturity");
            return void 0 !== a && t && (o = r.default.createElement(M.Tooltip, {
                "data-testid": "button-toolTip",
                title: a,
                arrow: !0
            }, r.default.createElement("span", null, o))), o
        },
        t_ = e => {
            var t;
            let {
                open: a,
                creatorOverrides: n,
                onCancel: l,
                onSubmit: o,
                isSubmitting: s,
                onSelectionChange: d,
                selected: c
            } = e, {
                translate: m
            } = (0, i.useTranslation)();
            return r.default.createElement(N.Dialog, {
                open: a,
                maxWidth: "Medium",
                onClose: l
            }, r.default.createElement(I.DialogTitle, null, m("Title.IncreaseMaturityDialog") || "Please indicate your preferred Content Maturity"), r.default.createElement(A.DialogContent, null, r.default.createElement(R.DialogContentText, {
                id: "dialog-content-text-describe-id"
            }, r.default.createElement(u.Typography, {
                align: "center"
            }, m("Message.IncreaseMaturityDialog") || "The content maturity label displayed for your experience will always be the higher label between the questionnaire result and the content maturity label selected here.")), r.default.createElement(E.RadioGroup, {
                value: c,
                onChange: d
            }, (null == n ? void 0 : n.allowedCreatorOverratedAgeRecommendations) && (null == n || null == (t = n.allowedCreatorOverratedAgeRecommendations) ? void 0 : t.map(e => r.default.createElement(g.FormControlLabel, {
                key: e.displayName,
                value: e.minimumAge,
                label: r.default.createElement(u.Typography, {
                    variant: "body1",
                    color: "primary"
                }, e.displayName),
                control: r.default.createElement(v.Radio, {
                    "aria-label": e.displayName
                })
            }))), r.default.createElement(g.FormControlLabel, {
                value: "-1",
                label: r.default.createElement(u.Typography, {
                    variant: "body1",
                    color: "primary"
                }, "Use questionnaire result"),
                control: r.default.createElement(v.Radio, {
                    "aria-label": "Use questionnaire result"
                })
            }))), r.default.createElement(k.DialogActions, null, r.default.createElement(w.Button, {
                size: "large",
                variant: "contained",
                "aria-label": "Cancel",
                color: "secondary",
                onClick: l
            }, "Cancel"), r.default.createElement(w.Button, {
                size: "large",
                variant: "contained",
                "aria-label": m("Button.Submit"),
                color: "primaryBrand",
                loading: s,
                onClick: o
            }, m("Button.Submit"))))
        },
        tq = e => {
            let {
                translationKey: t
            } = e, {
                translate: a
            } = (0, i.useTranslation)(), {
                classes: {
                    tooltipIcon: n
                }
            } = tM();
            return r.default.createElement(M.Tooltip, {
                arrow: !0,
                title: a(t),
                placement: "bottom"
            }, r.default.createElement(D.InfoOutlinedIcon, {
                fontSize: "small",
                className: n
            }))
        };

    function tO() {
        let {
            onNotify: e
        } = td(), {
            translate: t
        } = (0, i.useTranslation)();
        return {
            showToastNetworkError: (0, r.useCallback)(a => {
                t && (null == e || e({
                    severity: "error",
                    title: t("Title.NetworkError"),
                    message: t("Message.NetworkError", {
                        status: "".concat(a)
                    })
                }))
            }, [e, t]),
            showToastUserError: (0, r.useCallback)((a, n) => {
                t && (null == e || e({
                    severity: "error",
                    title: t(a),
                    message: t(n)
                }))
            }, [e, t]),
            showToastSuccess: (0, r.useCallback)(a => {
                t && (null == e || e({
                    severity: "success",
                    title: t("Title.SubmitSuccess"),
                    message: t(a ? "Message.SubmitSuccess" : "Message.SaveSuccess")
                }))
            }, [e, t])
        }
    }

    function tP(e) {
        return e && "object" == typeof e && "response" in e ? e.response : e && "object" == typeof e && "json" in e ? e : null
    }
    let tU = {
            async attemptNetworkRequestWithRetry(e) {
                try {
                    return await e()
                } catch (n) {
                    var t;
                    let a = null == (t = tP(n)) ? void 0 : t.status;
                    if (a === eg.StatusCodes.BAD_GATEWAY || a === eg.StatusCodes.GATEWAY_TIMEOUT) return await e();
                    throw n
                }
            },
            handleNetworkRequestFailure(e, t, a) {
                var n;
                let l = null == (n = tP(e)) ? void 0 : n.status;
                if (!l) return void t("Error.UnknownError", "Message.PleaseTryAgain");
                let r = e && "object" == typeof e && "body" in e;
                l === eg.StatusCodes.BAD_REQUEST && r || eg.StatusCodes.NOT_FOUND, a(l)
            }
        },
        tG = e => {
            var t, a;
            let {
                universeId: n,
                contentDescriptors: l,
                displayName: s,
                creatorOverrides: d,
                isContentMaturityEnabled: c,
                isIncreaseMaturityEnabled: m
            } = e, {
                translate: p
            } = (0, i.useTranslation)(), {
                classes: {
                    table: f,
                    cell: g,
                    cellIncreaseMaturity: y,
                    firstColumnHeader: E,
                    tooltip: v
                }
            } = tM(), {
                showToastNetworkError: b,
                showToastUserError: h
            } = tO(), T = (0, o.useRouter)(), [x, C] = (0, r.useState)(!1), [S, w] = (0, r.useState)((null != (t = null == d || null == (a = d.creatorOverratedAgeRecommendation) ? void 0 : a.minimumAge) ? t : -1).toString()), N = (0, r.useCallback)(() => {
                var e, t;
                w((null != (e = null == d || null == (t = d.creatorOverratedAgeRecommendation) ? void 0 : t.minimumAge) ? e : -1).toString()), C(!0)
            }, [d]), I = (0, r.useCallback)(() => {
                var e, t;
                C(!1), w((null != (e = null == d || null == (t = d.creatorOverratedAgeRecommendation) ? void 0 : t.minimumAge) ? e : -1).toString())
            }, [d]), A = (0, r.useCallback)(async () => {
                try {
                    await tU.attemptNetworkRequestWithRetry(() => tL.saveCreatorOverrides(n, (0, ef.V1Beta1CreatorOverridesFromJSON)({
                        creatorOverratedAgeRecommendation: {
                            minimumAge: Number(S)
                        }
                    })))
                } catch (e) {
                    tU.handleNetworkRequestFailure(e, h, b)
                }
            }, [n, b, h, S]), [R, k] = (0, r.useState)(!1), M = (0, r.useCallback)(() => {
                (async function() {
                    k(!0);
                    try {
                        await A()
                    } finally {
                        k(!1)
                    }
                })().then(() => {
                    C(!1), T.reload()
                })
            }, [A]);
            return r.default.createElement(L.Table, {
                "aria-label": p("Title.ComplianceTable"),
                className: f
            }, r.default.createElement(B.TableHead, null, r.default.createElement(_.TableRow, null, r.default.createElement(q.TableCell, {
                className: E
            }, r.default.createElement("div", {
                className: v
            }, r.default.createElement(u.Typography, {
                variant: "tableHead",
                display: "inline"
            }, p(c ? "Title.ContentMaturityBracket" : "Title.AgeRecommendationBracket")), r.default.createElement(tq, {
                translationKey: c ? "Tooltip.ContentMaturityLabelRestrictionHeader" : "Tooltip.AgeRecommendationRestrictionHeader"
            }))), r.default.createElement(q.TableCell, {
                className: g
            }, r.default.createElement("div", {
                className: v
            }, r.default.createElement(u.Typography, {
                variant: "tableHead"
            }, p("TableHead.Descriptors")), r.default.createElement(tq, {
                translationKey: "Tooltip.ContentDescriptorRestrictionHeader"
            }))))), r.default.createElement(O.TableBody, null, r.default.createElement(_.TableRow, null, r.default.createElement(q.TableCell, {
                className: g
            }, r.default.createElement("div", {
                className: y
            }, r.default.createElement(u.Typography, {
                variant: "body2"
            }, null != s ? s : p("Guidelines.UnratedDisplayName")), m && d && r.default.createElement(tB, {
                disabled: (null == d ? void 0 : d.allowedCreatorOverratedAgeRecommendations) == null || (null == d ? void 0 : d.allowedCreatorOverratedAgeRecommendations.length) <= 0,
                tooltipMsg: s ? p("Tooltip.CannotIncreaseMaturity") || "Your experience’s maturity level cannot be increased further" : p("Tooltip.RetakeQuestionnaireToIncreaseMaturity") || "Please submit your answers again before increasing the maturity level",
                onClick: N
            }))), r.default.createElement(q.TableCell, {
                className: g
            }, l.length > 0 ? r.default.createElement(u.Typography, {
                variant: "body2"
            }, l.map(e => r.default.createElement("div", {
                key: e.name
            }, e.displayName))) : r.default.createElement(u.Typography, {
                variant: "body2"
            }, p("Message.NoFeatures"))))), r.default.createElement(t_, {
                open: x,
                creatorOverrides: d,
                onCancel: I,
                onSubmit: M,
                isSubmitting: R,
                onSelectionChange: (e, t) => {
                    w(t)
                },
                selected: S
            }))
        },
        tF = e => {
            let {
                restrictedCountries: t,
                isContentMaturityEnabled: a
            } = e, {
                translate: n
            } = (0, i.useTranslation)(), {
                classes: {
                    table: l,
                    restrictionsTable: o,
                    tableContainer: s,
                    restrictionsFirstColumnHeader: d,
                    restrictionsHeaderText: c,
                    tooltip: m
                }
            } = tM();
            return r.default.createElement("div", {
                className: s
            }, r.default.createElement(L.Table, {
                "aria-label": n("Title.ComplianceTable"),
                className: "".concat(l, " ").concat(o)
            }, r.default.createElement(B.TableHead, null, r.default.createElement(_.TableRow, null, r.default.createElement(q.TableCell, {
                className: d
            }, r.default.createElement("div", {
                className: m
            }, r.default.createElement(u.Typography, {
                className: c,
                variant: "tableHead"
            }, n("Title.GuidelinesRestrictedCountries")), r.default.createElement(tq, {
                translationKey: a ? "Tooltip.MaturityNonCompliantRegionRestrictionHeader" : "Tooltip.NonCompliantRegionRestrictionHeader"
            }))), r.default.createElement(q.TableCell, null, r.default.createElement("div", {
                className: m
            }, r.default.createElement(u.Typography, {
                className: c,
                variant: "tableHead"
            }, n("TableHead.Descriptors")), r.default.createElement(tq, {
                translationKey: "Tooltip.ContentDescriptorRestrictionHeader"
            }))), r.default.createElement(q.TableCell, null, r.default.createElement("div", {
                className: m
            }, r.default.createElement(u.Typography, {
                className: c,
                variant: "tableHead"
            }, n("Title.GuidelinesAgeRestriction")), r.default.createElement(tq, {
                translationKey: "Tooltip.AgeRestrictionHeader"
            }))))), r.default.createElement(O.TableBody, null, t.length > 0 ? t.sort((e, t) => e.countryCode.localeCompare(t.countryCode)).map(e => r.default.createElement(_.TableRow, {
                key: "".concat(e.countryCode, "-").concat(e.displayDescriptorName)
            }, r.default.createElement(q.TableCell, null, r.default.createElement(u.Typography, {
                variant: "body2"
            }, e.displayCountryName)), r.default.createElement(q.TableCell, null, r.default.createElement(u.Typography, {
                variant: "body2"
            }, r.default.createElement("div", null, e.displayDescriptorName))), r.default.createElement(q.TableCell, null, r.default.createElement(u.Typography, {
                variant: "body2"
            }, r.default.createElement("div", null, e.displayAgeRangeName))))) : r.default.createElement(_.TableRow, null, r.default.createElement(q.TableCell, null, r.default.createElement(u.Typography, {
                variant: "body2"
            }, n("Message.NoRestrictedCountries"))), r.default.createElement(q.TableCell, null, r.default.createElement(u.Typography, {
                variant: "body2"
            }, n("Message.NoFeatures"))), r.default.createElement(q.TableCell, null, r.default.createElement(u.Typography, {
                variant: "body2"
            }))))))
        },
        tQ = e => {
            let {
                universeId: t,
                restrictedCountries: a,
                ageDisplay: n,
                ageContentDescriptors: l,
                creatorOverrides: i,
                isContentMaturityEnabled: o,
                isIncreaseMaturityEnabled: s
            } = e;
            return r.default.createElement(r.default.Fragment, null, r.default.createElement(tG, {
                universeId: t,
                contentDescriptors: l,
                displayName: n,
                creatorOverrides: i,
                isContentMaturityEnabled: o,
                isIncreaseMaturityEnabled: s
            }), r.default.createElement(tF, {
                restrictedCountries: a,
                isContentMaturityEnabled: o
            }))
        },
        tz = () => (n || (n = new ey.IarcActivityServiceAPIApi(th("iarc-activity-service"))), n),
        tH = [eg.StatusCodes.BAD_GATEWAY, eg.StatusCodes.GATEWAY_TIMEOUT],
        tV = (e, t) => {
            var a;
            if (e > 1) return !1;
            let n = null == (a = tP(t)) ? void 0 : a.status;
            return void 0 !== n && tH.includes(n)
        },
        tW = e => (0, V.useQuery)({
            queryKey: ["experienceQuestionnaire", "getLatestQuestionnaireIdForUniverse", e],
            queryFn: () => tx.getLatestQuestionnaireIdForUniverse(e),
            retry: tV
        }),
        tj = (e, t) => {
            let a = async e => {
                let a = await tx.getQuestionnaireById(e, t);
                return a.questionnaire ? tn(a.questionnaire) : null
            };
            return (0, V.useQuery)({
                queryKey: ["experienceQuestionnaire", "getQuestionnaireById", e],
                queryFn: void 0 === e ? W.skipToken : () => a(e),
                retry: tV
            })
        },
        tK = e => (0, V.useQuery)({
            queryKey: ["experienceQuestionnaire", "getAnswersByUniverseId", e],
            queryFn: async () => {
                var t, a, n;
                try {
                    let n = await tx.getAnswersByUniverseId(e);
                    if (null == (t = n.response) ? void 0 : t.answers) return tt((null == (a = n.response) ? void 0 : a.answers) || [])
                } catch (e) {
                    if (404 !== (null == (n = tP(e)) ? void 0 : n.status)) throw e
                }
                return []
            },
            retry: tV,
            gcTime: 0,
            refetchOnMount: "always"
        }),
        tY = e => (0, V.useQuery)({
            queryKey: ["experienceQuestionnaire", "getSubmissionLatest", e],
            queryFn: async () => {
                try {
                    return await tx.getSubmissionLatest(e)
                } catch (e) {
                    var t;
                    if (404 === (null == (t = tP(e)) ? void 0 : t.status)) return null;
                    throw e
                }
            },
            retry: tV
        }),
        tX = function(e) {
            let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {};
            return (0, j.useMutation)({
                mutationKey: ["experienceQuestionnaire", "saveResponseByUniverseId"],
                mutationFn: t => {
                    let {
                        questionnaireId: a,
                        answers: n
                    } = t;
                    return tx.saveResponseByUniverseId(e, a, {
                        answers: n
                    })
                },
                ...t
            })
        },
        tJ = function(e) {
            let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {};
            return (0, j.useMutation)({
                mutationKey: ["experienceQuestionnaireV2", "submitAdditionalResponse", e],
                mutationFn: t => {
                    let a, {
                        questionnaireId: n,
                        answers: l
                    } = t;
                    return a = {
                        questionnaireId: n,
                        response: {
                            answers: l
                        }
                    }, tT().responsesApiV2.responsesSubmitResponse({
                        universeId: e,
                        submitResponseRequestBody: a
                    })
                },
                ...t
            })
        },
        t$ = e => (0, V.useQuery)({
            queryKey: ["experienceGuidelinesService", "getDetailedGuidelines", e],
            queryFn: async () => {
                try {
                    return await tL.getDetailedGuidelines(e)
                } catch (e) {
                    var t;
                    if (404 === (null == (t = tP(e)) ? void 0 : t.status)) return null;
                    throw e
                }
            },
            retry: tV
        }),
        tZ = e => (0, V.useQuery)({
            queryKey: ["experienceGuidelinesService", "getDetailedGuidelinesV2", e],
            queryFn: async () => {
                try {
                    return await tL.getDetailedGuidelinesV2(e)
                } catch (e) {
                    var t;
                    if (404 === (null == (t = tP(e)) ? void 0 : t.status)) return null;
                    throw e
                }
            },
            retry: tV
        }),
        t0 = e => (0, V.useQuery)({
            queryKey: ["experienceQuestionnaire", "getQuestionnairePublishStatusList", e],
            queryFn: async () => {
                try {
                    return await tx.getQuestionnairePublishStatusList(e)
                } catch (e) {
                    var t;
                    if (404 === (null == (t = tP(e)) ? void 0 : t.status)) return null;
                    throw e
                }
            },
            retry: tV
        }),
        t1 = e => (0, V.useQuery)({
            queryKey: ["experienceQuestionnaire", "getMetadataStatus", e],
            queryFn: () => tx.getMetadataStatus(e),
            retry: tV
        }),
        t2 = e => {
            switch (e) {
                case "IARC_ACTIVITY_TYPE_QUESTIONNAIRE_SUBMITTED":
                    return "Questionnaire submitted";
                case "IARC_ACTIVITY_TYPE_LIVE_RATINGS_NOTICE":
                    return "Ratings assigned";
                case "IARC_ACTIVITY_TYPE_RATINGS_CHECK_REVIEW_RECEIVED":
                    return "Ratings check review received";
                case "IARC_ACTIVITY_TYPE_GRAC_REFUSE_CLASSIFICATION":
                    return "GRAC refused classification";
                case "IARC_ACTIVITY_TYPE_RATING_CHANGE_NOTICE":
                    return "Rating change notice";
                case "IARC_ACTIVITY_TYPE_RATING_AUTHORITY_CUSTOM_EMAIL":
                    return "Rating authority custom email";
                case "IARC_ACTIVITY_TYPE_ROBLOX_MODERATION_REJECTION":
                    return "Ratings rejected";
                default:
                    return "Activity"
            }
        },
        t4 = e => void 0 === e || "" === e ? "IARC_ACTIVITY_TYPE_INVALID" : e,
        t3 = (0, K.resolveUrl)("robloxCommunityStandardsUrl", "production", "global"),
        t9 = {
            width: "100%",
            height: "100%"
        },
        t8 = (0, s.makeStyles)()(e => ({
            title: {
                marginBottom: e.spacing(1)
            },
            message: {
                marginBottom: e.spacing(1)
            },
            button: {
                marginBottom: e.spacing(0)
            },
            mainGridMargin: {
                ...t9,
                marginTop: e.spacing(5),
                display: "flex",
                flexDirection: "column"
            },
            boldText: {
                fontWeight: "bold"
            }
        })),
        t7 = e => {
            var t, a;
            let {
                header: n,
                creatorUsage: l,
                moderatorUsage: o,
                moderatorReasoning: s
            } = e, {
                translate: d
            } = (0, i.useTranslation)(), {
                classes: {
                    boldText: c
                }
            } = t8(), m = (null == l ? void 0 : l.contains) ? null == l || null == (t = l.experienceDescriptor) ? void 0 : t.displayName : d("Message.NotPresentDescriptorUsage"), p = (null == o ? void 0 : o.contains) ? null == o || null == (a = o.experienceDescriptor) ? void 0 : a.displayName : d("Message.NotPresentDescriptorUsage");
            return m !== p && m && p ? r.default.createElement("li", null, r.default.createElement(u.Typography, {
                variant: "body1",
                className: c
            }, n), r.default.createElement("ul", null, r.default.createElement("li", null, r.default.createElement(u.Typography, {
                variant: "body1"
            }, d("Message.YourSubmissionModeration"), ": ", m)), r.default.createElement("li", null, r.default.createElement(u.Typography, {
                variant: "body1"
            }, d("Message.ModeratorFeedbackModeration"), ": ", p)), s && r.default.createElement("li", null, r.default.createElement(u.Typography, {
                variant: "body1"
            }, "Feedback reasoning: ", s)))) : null
        },
        t6 = e => {
            var t;
            let {
                moderation: a,
                isContentMaturityEnabled: n,
                submitBy: l
            } = e, {
                translate: o,
                translateHTML: s
            } = (0, i.useTranslation)(), {
                classes: {
                    boldText: c
                }
            } = t8();
            if (!a.creatorUsages || !a.moderatorUsages) return null;
            let m = l ? (0, eg.getFormattedDateTime)(new Date(l)) : null;
            return r.default.createElement("div", null, m && r.default.createElement(r.default.Fragment, null, r.default.createElement(u.Typography, null, r.default.createElement("b", null, o("Label.RetakeTime", {
                retakeDeadline: m
            }))), r.default.createElement("br", null)), r.default.createElement(u.Typography, null, o("Message.UponReviewModerationText")), r.default.createElement("ul", null, a.moderatorUsages.items && a.moderatorUsages.items.length > 0 && (null == (t = a.moderatorUsages.items) ? void 0 : t.map(e => {
                var t, n, l, i, o;
                let s = null == (l = a.creatorUsages) || null == (n = l.items) ? void 0 : n.find(t => {
                        var a, n;
                        return (null == (a = t.name) ? void 0 : a.toLowerCase()) === (null == (n = e.name) ? void 0 : n.toLowerCase())
                    }),
                    u = null == (i = a.moderatorReasoning) ? void 0 : i.find(t => {
                        var a, n;
                        return (null == (a = t.descriptorName) ? void 0 : a.toLowerCase()) === (null == (n = e.name) ? void 0 : n.toLowerCase())
                    }),
                    d = null != (t = null == (o = e.descriptorDisplayName) ? void 0 : o.replaceAll(/\s\(.*\)/g, "")) ? t : "Unknown Descriptor";
                return r.default.createElement(t7, {
                    header: d,
                    creatorUsage: s,
                    moderatorUsage: e,
                    moderatorReasoning: null == u ? void 0 : u.reasoning,
                    key: e.name
                })
            }))), r.default.createElement(u.Typography, null, s("Description.ModerationRejectionAppeal", [{
                opening: "violationsAppealsLinkStart",
                closing: "violationsAppealsLinkEnd",
                content: e => r.default.createElement(d.Link, {
                    href: "https://www.".concat("roblox.com", "/report-appeals#"),
                    target: "_blank",
                    underline: "always"
                }, e)
            }])), r.default.createElement("div", {
                className: "margin-top-medium"
            }, r.default.createElement(u.Typography, {
                className: c
            }, o("Title.NextStepsModeration")), r.default.createElement("ul", null, r.default.createElement("li", null, r.default.createElement(u.Typography, null, o(n ? "Message.NextStepsModerationMaturity" : "Message.NextStepsModeration"))))))
        },
        t5 = e => {
            let {
                messageKey: t,
                isContentMaturityEnabled: a
            } = e, {
                classes: {
                    boldText: n,
                    commonTextDiv: l,
                    guidelinesImpact: o,
                    unorderedList: s
                }
            } = tM(), {
                translate: c,
                translateHTML: m
            } = (0, i.useTranslation)();
            return r.default.createElement(r.default.Fragment, null, r.default.createElement(u.Typography, {
                variant: "body1"
            }, m(t, [{
                opening: "experienceGuidelinesLinkStart",
                closing: "experienceGuidelinesLinkEnd",
                content: e => r.default.createElement(d.Link, {
                    href: eX,
                    target: "_blank",
                    underline: "always"
                }, e)
            }])), r.default.createElement("div", {
                className: l
            }, r.default.createElement(u.Typography, {
                variant: "body1",
                className: n
            }, c("Title.ImportantNote")), r.default.createElement("ul", {
                className: s
            }, r.default.createElement("li", null, r.default.createElement(u.Typography, {
                variant: "body1"
            }, m("Message.ImportantNoteRegenerateGuidelines", [{
                opening: "boldStart",
                closing: "boldEnd",
                content: e => r.default.createElement("span", {
                    className: n
                }, e)
            }]))), r.default.createElement("li", null, r.default.createElement(u.Typography, {
                variant: "body1"
            }, m("Message.ImportantNoteAnswersChanged", [{
                opening: "boldStart",
                closing: "boldEnd",
                content: e => r.default.createElement("span", {
                    className: n
                }, e)
            }])))), r.default.createElement("div", {
                className: o
            }, r.default.createElement(u.Typography, {
                variant: "body1",
                className: n
            }, c("Title.ImpactOfGuidelines")), r.default.createElement("br", null), r.default.createElement(u.Typography, {
                variant: "body1"
            }, c(a ? "Message.ImpactOfContentMaturity" : "Message.ImpactOfGuidelines")), r.default.createElement("ul", {
                className: s
            }, r.default.createElement("li", null, r.default.createElement(u.Typography, {
                variant: "body1"
            }, m(a ? "Message.ImpactOfContentMaturityLabel" : "Message.ImpactOfGuidelinesAgeRecommendation", [{
                opening: "boldStart",
                closing: "boldEnd",
                content: e => r.default.createElement("span", {
                    className: n
                }, e)
            }]))), r.default.createElement("li", null, r.default.createElement(u.Typography, {
                variant: "body1"
            }, m(a ? "Message.ImpactOfContentMaturityRegionalCompliance" : "Message.ImpactOfGuidelinesRegionalCompliance", [{
                opening: "boldStart",
                closing: "boldEnd",
                content: e => r.default.createElement("span", {
                    className: n
                }, e)
            }]))))), r.default.createElement("div", {
                className: o
            }, r.default.createElement(u.Typography, {
                variant: "body1"
            }, m("Message.LearnMoreAboutExperienceGuideline", [{
                opening: "linkStart",
                closing: "linkEnd",
                content: e => r.default.createElement(d.Link, {
                    href: eY,
                    target: "_blank",
                    underline: "always"
                }, e)
            }])))))
        };
    var ae = ((eI = ae || {})[eI.Unknown = 0] = "Unknown", eI[eI.SubmittedOldVersion = 1] = "SubmittedOldVersion", eI[eI.SubmittedCurrentVersion = 2] = "SubmittedCurrentVersion", eI[eI.SubmittedNone = 3] = "SubmittedNone", eI),
        at = (0, i.withTranslation)(e => {
            var t, a, n;
            let {
                onClick: l,
                universeId: o,
                progressState: s,
                submissionState: d,
                isContentMaturityEnabled: c,
                isIncreaseMaturityEnabled: m
            } = e, {
                translate: p,
                translateHTML: g
            } = (0, i.useTranslation)(), {
                classes: {
                    title: y,
                    message: E,
                    button: v
                }
            } = t8(), {
                classes: {
                    mainGrid: b
                }
            } = tM(), {
                data: h,
                error: T
            } = t$(o);
            (e => {
                let {
                    showToastNetworkError: t,
                    showToastUserError: a
                } = tO(), n = (0, r.useRef)(null);
                (0, r.useEffect)(() => {
                    null != e && n.current !== e && (n.current = e, tU.handleNetworkRequestFailure(e, a, t))
                }, [e, t, a])
            })(T);
            let x = null != (t = null == h ? void 0 : h.creatorOverrides) ? t : null,
                C = null != (a = null == h ? void 0 : h.submitBy) ? a : null,
                S = null != (n = null == h ? void 0 : h.moderation) ? n : null,
                {
                    ageDisplay: N,
                    ageContentDescriptors: I,
                    restrictedCountries: A
                } = (0, r.useMemo)(() => {
                    var e, t, a, n, l, r;
                    let i, o = null != (e = null == h ? void 0 : h.ageRecommendationDetails) ? e : null;
                    return {
                        ageDisplay: (null == o || null == (n = o.ageRecommendationSummary) || null == (a = n.ageRecommendation) ? void 0 : a.displayName) || null,
                        ageContentDescriptors: (null == o || null == (l = o.experienceDescriptorUsages) ? void 0 : l.items) == null ? [] : o.experienceDescriptorUsages.items.filter(e => {
                            var t;
                            return null != e.experienceDescriptor && !(null == (t = e.experienceDescriptorDimensionUsages) ? void 0 : t.some(e => "regionalcompliance" === e.dimensionName))
                        }).map(e => e.experienceDescriptor),
                        restrictedCountries: (r = null != (t = null == h ? void 0 : h.restrictedCountries) ? t : [], i = [], r.forEach(e => {
                            var t;
                            let a = [];
                            null == (t = e.experienceDescriptorUsages) || t.forEach(t => {
                                var n;
                                let l = {
                                    countryCode: e.countryCode || "",
                                    reasons: a,
                                    displayCountryName: e.countryDisplayName || "",
                                    displayDescriptorName: t.descriptorDisplayName || "",
                                    displayAgeRangeName: t.ageRangeDisplayName || ""
                                };
                                i.push(l), a.push((null == (n = t.experienceDescriptor) ? void 0 : n.displayName) || "")
                            })
                        }), i)
                    }
                }, [h]),
                R = c ? s === eK ? d === ae.SubmittedCurrentVersion ? {
                    ...ej
                } : {
                    ...ez
                } : d === ae.SubmittedNone ? {
                    ...eH
                } : d === ae.SubmittedOldVersion ? {
                    ...eV
                } : {
                    ...eW
                } : s === eK ? d === ae.SubmittedCurrentVersion ? {
                    ...eQ
                } : {
                    ...eP
                } : d === ae.SubmittedNone ? {
                    ...eU
                } : d === ae.SubmittedOldVersion ? {
                    ...eG
                } : {
                    ...eF
                };
            return r.default.createElement("section", null, r.default.createElement(f.Grid, {
                container: !0,
                direction: "column",
                className: b
            }, r.default.createElement(f.Grid, {
                item: !0,
                className: y
            }, r.default.createElement(u.Typography, {
                variant: "h2"
            }, (null == S ? void 0 : S.moderationStatus) === ef.V1Beta1ModerationStatus.Rejected ? g("Title.GuidelinesSubmittedModeratorRejected", [{
                opening: "redColorStart",
                closing: "redColorEnd",
                content: e => r.default.createElement(u.Typography, {
                    variant: "h2",
                    color: "error"
                }, e)
            }]) : p(R.titleKey))), (null == S ? void 0 : S.moderationStatus) === ef.V1Beta1ModerationStatus.Rejected && r.default.createElement(f.Grid, {
                item: !0,
                className: E
            }, r.default.createElement(t6, {
                submitBy: null != C ? C : "",
                moderation: S,
                isContentMaturityEnabled: c
            })), r.default.createElement(f.Grid, {
                item: !0,
                className: E
            }, r.default.createElement(t5, {
                messageKey: R.messageKey,
                isContentMaturityEnabled: c
            })), r.default.createElement(tQ, {
                universeId: o,
                restrictedCountries: A,
                ageDisplay: N,
                ageContentDescriptors: I,
                creatorOverrides: x,
                isContentMaturityEnabled: c,
                isIncreaseMaturityEnabled: m
            }), r.default.createElement(f.Grid, {
                item: !0,
                className: v
            }, r.default.createElement(w.Button, {
                onClick: l,
                variant: "contained",
                color: "primaryBrand",
                size: "large"
            }, p(R.buttonKey)))))
        }, [eA.DeveloperQuestionnaire]);
    let aa = e => {
        let {
            section: t,
            answers: a,
            errors: n,
            updateAnswer: l
        } = e, {
            onSectionViewed: i
        } = (0, r.useContext)(e2), o = (0, r.useCallback)(e => {
            null == i || i(t.id, e)
        }, [t.id, i]);
        return e8(!!i, o), r.default.createElement(e9, {
            isActive: !0
        }, t.questions.map(e => r.default.createElement(tw, {
            key: e.id,
            errors: n,
            validatedAnswers: a,
            question: e,
            updateAnswer: l
        })))
    };
    var an = (0, i.withTranslation)(e => {
        var t;
        let {
            questionnaire: a,
            answers: n,
            errors: l,
            isSaving: o,
            setAnswers: s,
            send: d,
            save: c,
            goToLanding: m
        } = e, {
            translate: p
        } = (0, i.useTranslation)(), {
            parseText: f
        } = ek(), g = (0, H.useQueryClient)(), {
            sections: y
        } = a, E = y.length, v = null == (t = y[0]) ? void 0 : t.description, [b, h] = (0, r.useState)(() => {
            if (!y.length) return 0;
            let e = y.findIndex(e => !eJ(e, n));
            return e >= 0 ? e : y.length - 1
        }), T = Math.min(b, Math.max(E - 1, 0)), x = y[T], C = T === E - 1, S = !!x && eJ(x, n), {
            steps: N,
            completedSectionsCount: I
        } = (0, r.useMemo)(() => {
            let e = y.map(e => eJ(e, n));
            return {
                steps: y.map((t, a) => ({
                    id: t.id,
                    label: t.name,
                    state: a === T ? "current" : e[a] ? "complete" : "upcoming"
                })),
                completedSectionsCount: e.filter(Boolean).length
            }
        }, [y, n, T]), A = (0, r.useCallback)(e => {
            let t = e$({
                sections: y,
                currentIndex: T,
                answers: e
            });
            if (t) {
                let e = y.findIndex(e => e.id === t.id);
                e >= 0 && h(e);
                return
            }
            T < E - 1 && h(e => Math.min(e + 1, E - 1))
        }, [T, y, E]), R = (0, r.useCallback)((e, t, a) => {
            let l = y[T],
                r = e0(n, e, t, a);
            s(e, r), c(r), e1({
                section: l,
                priorAnswers: n,
                newAnswers: r,
                questionId: e
            }) && A(r)
        }, [n, T, A, c, y, s]), k = (0, r.useCallback)(async () => {
            await c(), await g.invalidateQueries({
                queryKey: ["experienceQuestionnaire"]
            }), m()
        }, [m, g, c]);
        return E && x ? r.default.createElement(r.default.Fragment, null, r.default.createElement(u.Typography, null, p("Label.SectionsCompleted", {
            completed: I.toString(),
            total: E.toString()
        })), v && r.default.createElement("div", null, f(v)), r.default.createElement(Z.Stepper, {
            steps: N,
            currentStepIndex: T,
            size: "Medium"
        }), r.default.createElement(aa, {
            key: x.id,
            section: x,
            answers: n,
            errors: l,
            updateAnswer: R
        }), r.default.createElement("div", {
            className: "flex gap-small"
        }, r.default.createElement(w.Button, {
            disabled: 0 === T || o,
            variant: "outlined",
            color: "secondary",
            onClick: () => h(e => Math.max(e - 1, 0))
        }, p("Button.Back")), !C && r.default.createElement(w.Button, {
            disabled: !S || o,
            variant: "contained",
            color: "primaryBrand",
            onClick: () => h(e => Math.min(e + 1, E - 1))
        }, p("Button.Next")), C && r.default.createElement(w.Button, {
            disabled: I !== E || o,
            variant: "contained",
            color: "primaryBrand",
            loading: o,
            onClick: d
        }, p("Button.Continue")), r.default.createElement(w.Button, {
            disabled: o,
            loading: o,
            variant: "contained",
            color: "secondary",
            onClick: k
        }, p("Action.SaveDraft")))) : null
    }, [eA.DeveloperQuestionnaire, eA.CommonUIControls, eA.Controls, eA.Navigation]);
    let al = (0, s.makeStyles)()({
            root: {
                flexGrow: 1,
                width: "100%",
                height: "100%",
                minHeight: 200
            }
        }),
        ar = () => {
            let {
                classes: {
                    root: e
                }
            } = al();
            return r.default.createElement(f.Grid, {
                classes: {
                    root: e
                },
                container: !0,
                justifyContent: "center",
                alignItems: "center"
            }, r.default.createElement(p.CircularProgress, null))
        },
        ai = "unknown",
        ao = (e, t) => "creator-hub:questionnaire-attempt:".concat(e, ":").concat(t),
        as = (e, t) => "".concat(ao(e, t), ":active-ms"),
        au = (e, t) => "".concat(ao(e, t), ":active-since"),
        ad = e => {
            let t = Number(window.localStorage.getItem(e));
            return Number.isFinite(t) && t > 0 ? t : 0
        },
        ac = (e, t) => {
            var a;
            return {
                attempt_id: e.attemptId,
                entry_point: e.entryPoint,
                event_timestamp: t,
                locale: null != (a = e.locale) ? a : ai,
                platform: "web",
                questionnaire_id: e.questionnaireId,
                questionnaire_version: e.questionnaireId,
                universe_id: String(e.universeId)
            }
        },
        am = (e, t, a) => {
            let n = (0, r.useCallback)(() => {
                    t && ((e, t) => {
                        try {
                            let a = au(e, t);
                            if (ad(a) > 0) return;
                            window.localStorage.setItem(a, String(Date.now()))
                        } catch (e) {}
                    })(e, t)
                }, [t, e]),
                l = (0, r.useCallback)(() => {
                    t && ((e, t) => {
                        try {
                            let a = au(e, t),
                                n = ad(a);
                            if (0 === n) return;
                            let l = as(e, t),
                                r = ad(l) + Math.max(Date.now() - n, 0);
                            window.localStorage.setItem(l, String(r)), window.localStorage.removeItem(a)
                        } catch (e) {}
                    })(e, t)
                }, [t, e]);
            (0, r.useEffect)(() => {
                a ? n() : l()
            }, [a, l, n]), (0, r.useEffect)(() => {
                let e = () => l(),
                    t = () => {
                        "hidden" === document.visibilityState ? l() : a && n()
                    };
                return window.addEventListener("pagehide", e), document.addEventListener("visibilitychange", t), () => {
                    window.removeEventListener("pagehide", e), document.removeEventListener("visibilitychange", t), l()
                }
            }, [a, l, n])
        },
        ap = {
            logImpressionEvent: () => {}
        },
        af = () => {
            let e = (0, eE.useOptionalUnifiedLoggerProvider)();
            return (0, r.useMemo)(() => {
                var a, n;
                return null != (a = null != (n = null == e ? void 0 : e.unifiedLogger) ? n : t) ? a : ap
            }, [e])
        },
        ag = e => {
            let {
                explicitEntryPoint: t,
                locale: a,
                questionnaireId: n,
                universeId: l
            } = e, i = af(), [o, s] = (0, r.useState)(""), [u, d] = (0, r.useState)(""), c = (0, r.useCallback)(e => {
                var r, o;
                if (!n) return !1;
                let u = ((e, t) => {
                        let a = ao(e, t);
                        try {
                            let e = window.localStorage.getItem(a);
                            if (e) return e
                        } catch (e) {}
                        let n = eg.uuidService.generateRandomUuid();
                        try {
                            window.localStorage.setItem(a, n)
                        } catch (e) {}
                        return n
                    })(l, n),
                    c = function(e) {
                        let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : "u" < typeof document ? "" : document.referrer;
                        if (e) return e;
                        if (!t) return "direct";
                        try {
                            let e = new URL(t);
                            if (e.origin === window.location.origin) return e.pathname;
                            return e.hostname || ai
                        } catch (e) {
                            return ai
                        }
                    }(t);
                return s(u), d(c), o = {
                    attemptId: u,
                    entryPoint: c,
                    locale: a,
                    questionnaireId: n,
                    universeId: l
                }, i.logImpressionEvent({
                    eventName: "QuestionnaireStarted",
                    parameters: ac(o, new Date().toISOString())
                }), null == e || null == (r = e.onStarted) || r.call(e), !0
            }, [t, a, n, i, l]), m = (0, r.useCallback)(() => {
                if (n) {
                    var e;
                    let t;
                    t = ((e, t) => {
                        try {
                            let a = as(e, t),
                                n = au(e, t);
                            if (null === window.localStorage.getItem(a) && null === window.localStorage.getItem(n)) return null;
                            let l = ad(n),
                                r = 0 === l ? 0 : Math.max(Date.now() - l, 0);
                            return ad(a) + r
                        } catch (e) {
                            return null
                        }
                    })((e = {
                        attemptId: o,
                        entryPoint: u,
                        locale: a,
                        questionnaireId: n,
                        universeId: l
                    }).universeId, e.questionnaireId), i.logImpressionEvent({
                        eventName: "QuestionnaireCompleted",
                        parameters: {
                            ...ac(e, new Date().toISOString()),
                            ...null === t ? {} : {
                                attempt_duration_ms: String(t)
                            }
                        }
                    });
                    try {
                        window.localStorage.removeItem(ao(l, n)), window.localStorage.removeItem(as(l, n)), window.localStorage.removeItem(au(l, n))
                    } catch (e) {}
                }
                s("")
            }, [o, u, a, n, i, l]);
            return {
                attemptId: o,
                completeAttempt: m,
                entryPoint: u,
                startAttempt: c
            }
        },
        ay = e => {
            let {
                attemptId: t,
                entryPoint: a,
                locale: n,
                questionnaireId: l,
                universeId: i
            } = e, o = af(), s = (0, r.useCallback)((e, r) => {
                l && o.logImpressionEvent({
                    eventName: "SectionViewed",
                    parameters: {
                        ...ac({
                            attemptId: t,
                            entryPoint: a,
                            locale: n,
                            questionnaireId: l,
                            universeId: i
                        }, r.clientTimestamp),
                        duration_ms: String(Math.max(Math.round(r.durationMs), 0)),
                        section_id: e
                    }
                })
            }, [t, a, n, l, o, i]), u = (0, r.useCallback)((e, r) => {
                l && o.logImpressionEvent({
                    eventName: "QuestionViewed",
                    parameters: {
                        ...ac({
                            attemptId: t,
                            entryPoint: a,
                            locale: n,
                            questionnaireId: l,
                            universeId: i
                        }, r.clientTimestamp),
                        duration_ms: String(Math.max(Math.round(r.durationMs), 0)),
                        question_id: e
                    }
                })
            }, [t, a, n, l, o, i]);
            return (0, r.useMemo)(() => ({
                onQuestionViewed: u,
                onSectionViewed: s
            }), [u, s])
        },
        aE = e => e ? e.toLowerCase().replaceAll("-", "_") : null,
        av = e => {
            let {
                classes: {
                    boldText: t,
                    commonTextDiv: a,
                    guidelinesImpact: n,
                    unorderedList: l
                }
            } = tM(), {
                translate: o,
                translateHTML: s
            } = (0, i.useTranslation)();
            return r.default.createElement("div", {
                className: a
            }, r.default.createElement(u.Typography, {
                variant: "body1"
            }, s(e ? "Message.ImpactOfContentMaturityPreview" : "Message.ImpactOfGuidelinesPreview", [{
                opening: "experienceGuidelinesLinkStart",
                closing: "experienceGuidelinesLinkEnd",
                content: e => r.default.createElement(d.Link, {
                    href: eX,
                    target: "_blank",
                    underline: "always"
                }, e)
            }])), r.default.createElement("ul", {
                className: l
            }, r.default.createElement("li", null, r.default.createElement(u.Typography, {
                variant: "body1"
            }, s(e ? "Message.ImpactOfContentMaturityLabelPreview" : "Message.ImpactOfGuidelinesAgeRecommendationPreview", [{
                opening: "boldStart",
                closing: "boldEnd",
                content: e => r.default.createElement("span", {
                    className: t
                }, e)
            }]))), r.default.createElement("li", null, r.default.createElement(u.Typography, {
                variant: "body1"
            }, s(e ? "Message.ImpactOfMaturityRegionalCompliancePreview" : "Message.ImpactOfGuidelinesRegionalCompliancePreview", [{
                opening: "boldStart",
                closing: "boldEnd",
                content: e => r.default.createElement("span", {
                    className: t
                }, e)
            }])))), r.default.createElement("div", {
                className: n
            }, r.default.createElement(u.Typography, {
                variant: "body1"
            }, s("Message.LearnMoreAboutExperienceGuideline", [{
                opening: "linkStart",
                closing: "linkEnd",
                content: e => r.default.createElement(d.Link, {
                    href: eY,
                    target: "_blank",
                    underline: "always"
                }, e)
            }]))))
        },
        ab = e => {
            let {
                translate: t
            } = (0, i.useTranslation)();
            return r.default.createElement(u.Typography, {
                variant: "caption",
                color: "secondary",
                display: "block"
            }, e ? t("Message.RestrictedMaturityDisabledCountries") : "17+ experiences are currently unplayable in Korea, Saudi Arabia, and Turkey.")
        },
        ah = e => {
            let {
                universeId: t,
                questionnaireId: a,
                questionnaireResponse: n,
                onEdit: l,
                attemptSubmit: o,
                isSaving: s,
                moveBackAScreen: d,
                isContentMaturityEnabled: c,
                isIncreaseMaturityEnabled: m
            } = e, {
                parseText: p
            } = ek(), {
                translate: g
            } = (0, i.useTranslation)(), {
                classes: {
                    navigationButtons: y,
                    navigationButtonsContainer: E
                }
            } = e6(), {
                classes: {
                    sectionLabel: v,
                    mainGrid: b
                }
            } = tM(), {
                classes: {
                    message: h
                }
            } = t8(), {
                showToastNetworkError: T,
                showToastUserError: x
            } = tO(), {
                locale: C
            } = (0, i.useLocalization)(), [S, I] = (0, r.useState)(!0), [A, R] = (0, r.useState)(!1), [k, M] = (0, r.useState)(), [D, L] = (0, r.useState)(), [B, _] = (0, r.useState)(), [q, O] = (0, r.useState)([]), [G, F] = (0, r.useState)(null), [Q, z] = (0, r.useState)(null), [H, V] = (0, r.useState)(null), [W, j] = (0, r.useState)([]), [K, Y] = (0, r.useState)(!1), [X, J] = (0, r.useState)(null), $ = (0, r.useCallback)(async () => {
                try {
                    var e, a, n, l, r;
                    let i = await tU.attemptNetworkRequestWithRetry(() => tL.getDetailedGuidelines(t));
                    V(null != (e = null == (r = i.ageRecommendationDetails) || null == (l = r.ageRecommendationSummary) || null == (n = l.ageRecommendation) ? void 0 : n.minimumAge) ? e : null), J(null != (a = i.creatorOverrides) ? a : null)
                } catch (e) {
                    throw Error("Unable to get current guidelines, defaulting to null which will trigger confirmation.")
                }
            }, [t]), Z = (0, r.useCallback)(async e => {
                try {
                    var n, l, r, i, o, s, u;
                    let d, c = aE(C),
                        m = await tU.attemptNetworkRequestWithRetry(() => tx.getSubmissionPreview(t, a, e, c));
                    j(null != (n = null == m ? void 0 : m.restrictedCountries) ? n : []);
                    let p = null != (l = m.ageRecommendationDetails) ? l : null;
                    O((d = [], (null == p ? void 0 : p.descriptorUsages) != null && p.descriptorUsages.forEach(e => {
                        null != e.descriptor && d.push(e.descriptor)
                    }), d)), F((null == p || null == (o = p.summary) || null == (i = o.ageRecommendation) ? void 0 : i.displayName) || null), z(null != (r = null == p || null == (u = p.summary) || null == (s = u.ageRecommendation) ? void 0 : s.minimumAge) ? r : null), await $(), m.userErrorMessage && _(m.userErrorMessage), m.userWarningMessage && L(m.userWarningMessage), m.userInfoMessage && M(m.userInfoMessage), m.disableSubmitButton && R(!0)
                } catch (e) {
                    d(), tU.handleNetworkRequestFailure(e, x, T)
                }
            }, [t, a, $, T, x]), ee = (0, r.useCallback)(e => {
                e && e.preventDefault(), 18 === Q && 18 !== H ? Y(!K) : o()
            }, [o, H, K, Q]), et = (0, r.useCallback)(e => {
                e && e.preventDefault(), o(), Y(!K)
            }, [o, K]);
            return ((0, r.useEffect)(() => {
                async function e() {
                    I(!0), await Z(n), I(!1)
                }
                s || e()
            }, [JSON.stringify(n), Z]), S) ? r.default.createElement(ar, null) : r.default.createElement("section", null, r.default.createElement(f.Grid, {
                container: !0,
                direction: "column",
                className: b
            }, r.default.createElement(f.Grid, {
                item: !0,
                className: h
            }, r.default.createElement(r.default.Fragment, null, r.default.createElement(u.Typography, {
                variant: "h2",
                className: v
            }, g("Title.GuidelinesPreview")), r.default.createElement(av, {
                isContentMaturityEnabled: c
            }), k && r.default.createElement(f.Grid, {
                item: !0,
                className: h
            }, r.default.createElement(P.Alert, {
                severity: "info",
                variant: "standard"
            }, r.default.createElement(u.Typography, null, p(k)))), r.default.createElement(tQ, {
                universeId: t,
                restrictedCountries: W,
                ageDisplay: G,
                ageContentDescriptors: q,
                creatorOverrides: X,
                isContentMaturityEnabled: c,
                isIncreaseMaturityEnabled: m
            }))), 18 === Q && r.default.createElement(f.Grid, {
                item: !0,
                className: h
            }, r.default.createElement(ab, {
                isContentMaturityEnabled: c
            })), B && r.default.createElement(f.Grid, {
                item: !0,
                className: h
            }, r.default.createElement(P.Alert, {
                severity: "error",
                variant: "standard"
            }, r.default.createElement(u.Typography, null, p(B)))), D && r.default.createElement(f.Grid, {
                item: !0,
                className: h
            }, r.default.createElement(P.Alert, {
                severity: "warning",
                variant: "standard"
            }, r.default.createElement(u.Typography, null, p(D)))), r.default.createElement(f.Grid, {
                container: !0,
                direction: "row",
                className: E
            }, r.default.createElement(f.Grid, {
                item: !0,
                className: y
            }, r.default.createElement(w.Button, {
                disabled: A,
                onClick: e => ee(e),
                variant: "contained",
                color: "primaryBrand",
                size: "large",
                loading: s
            }, g("Button.Submit"))), r.default.createElement(f.Grid, {
                item: !0,
                className: y
            }, r.default.createElement(w.Button, {
                onClick: l,
                variant: "contained",
                color: "primary",
                size: "large"
            }, g("Button.Edit")))), r.default.createElement(N.Dialog, {
                onClose: () => ee(),
                open: K
            }, r.default.createElement(U.DialogTemplate, {
                cancelText: "Cancel",
                color: "primaryBrand",
                confirmText: c ? g("Message.ConfirmRestrictedLabel") : "Yes, make experience ages 17+",
                content: c ? g("Message.RestrictedLabelWarningAge18Plus") : "This experience will become accessible to only age-verified 17+ users. The age recommendation of “Ages 17+” cannot be removed.",
                onCancel: e => ee(e),
                onConfirm: e => et(e),
                title: c ? g("Title.ConfirmRestrictedLabel") : "Make experience Ages 17+?",
                variant: "alert"
            }))))
        };
    var aT = (0, i.withTranslation)(e => {
        let {
            universeId: t
        } = e, a = (0, o.useRouter)(), {
            showToastNetworkError: n,
            showToastUserError: l,
            showToastSuccess: s
        } = tO(), [u, d] = (0, r.useState)({}), [c, m] = (0, r.useState)(!1), [p, g] = (0, r.useState)(null), [y, E] = (0, r.useState)(0), [v, b] = (0, r.useState)(!1), [h, T] = (0, r.useState)(!1), x = (0, r.useRef)(y), {
            locale: C
        } = (0, i.useLocalization)(), S = aE(C), w = "string" == typeof a.query.entryPoint ? a.query.entryPoint : void 0, N = td(), I = N.sectionStepper.isExperimentReady, A = N.sectionStepper.isExperimentEnabled, R = I && A, k = (0, r.useCallback)((e, t) => {
            if (g(t), u[e]) {
                let t = {
                    ...u
                };
                delete t[e], d(t)
            }
        }, [u]), {
            data: M,
            refetch: D,
            isLoading: L
        } = tW(t), B = null == M ? void 0 : M.questionnaireId, {
            attemptId: _,
            completeAttempt: q,
            entryPoint: O,
            startAttempt: P
        } = ag({
            explicitEntryPoint: w,
            locale: C,
            questionnaireId: B,
            universeId: t
        }), {
            data: U,
            isLoading: G
        } = tj(B, S), F = (0, r.useCallback)(async () => {
            var e;
            return null == (e = (await D()).data) ? void 0 : e.questionnaireId
        }, [D]), {
            data: Q,
            isLoading: z
        } = tK(t), V = (0, r.useMemo)(() => {
            var e;
            return null != (e = null != p ? p : Q) ? e : []
        }, [p, Q]);
        (0, r.useLayoutEffect)(() => {
            1 === y && 1 !== x.current && (b(V.length > 0), T(2 === x.current)), x.current = y
        }, [y, V]);
        let {
            data: W,
            isLoading: K
        } = tY(t), {
            isLoading: Y
        } = t$(t), {
            submissionState: X,
            progressState: J
        } = (0, r.useMemo)(() => {
            var e;
            let t = (null != (e = null == Q ? void 0 : Q.length) ? e : 0) > 0;
            return (null == W ? void 0 : W.submission) == null ? {
                submissionState: ae.SubmittedNone,
                progressState: t ? "started" : "not_started"
            } : B === W.questionnaireId ? {
                submissionState: ae.SubmittedCurrentVersion,
                progressState: t ? "started" : "submitted"
            } : {
                submissionState: ae.SubmittedOldVersion,
                progressState: t ? "started" : "submitted"
            }
        }, [null == Q ? void 0 : Q.length, B, W]), {
            mutateAsync: $
        } = function(e) {
            let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {},
                a = (0, H.useQueryClient)();
            return (0, j.useMutation)({
                mutationKey: ["experienceQuestionnaire", "saveResponseByUniverseId"],
                mutationFn: t => {
                    let {
                        questionnaireId: a,
                        answers: n
                    } = t;
                    return tx.submitResponseByUniverseId(e, a, {
                        answers: n
                    })
                },
                onSuccess: () => a.invalidateQueries({
                    queryKey: ["experienceQuestionnaire"]
                }),
                ...t
            })
        }(t), {
            mutateAsync: Z
        } = tX(t), {
            mutateAsync: ee
        } = function() {
            let e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {};
            return (0, j.useMutation)({
                mutationKey: ["experienceQuestionnaire", "validateResponse"],
                mutationFn: e => {
                    let {
                        questionnaireId: t,
                        answers: a
                    } = e;
                    return tx.validateResponse(t, {
                        answers: a
                    })
                },
                ...e
            })
        }();
        am(t, B, 1 === y || 2 === y);
        let et = ay({
                attemptId: _,
                entryPoint: O,
                locale: C,
                questionnaireId: B,
                universeId: t
            }),
            ea = (0, r.useCallback)(async e => {
                if (await F() !== B) return l(eq, eO), !1;
                if (!B) return l(eB, e_), !1;
                try {
                    return m(!0), await Z({
                        questionnaireId: B,
                        answers: null != e ? e : V
                    }), !0
                } catch (e) {
                    return tU.handleNetworkRequestFailure(e, l, n), !1
                } finally {
                    m(!1)
                }
            }, [F, B, l, Z, V, n]),
            en = (0, r.useCallback)(async () => {
                if (!B) return l(eB, e_), !1;
                try {
                    m(!0);
                    let e = await ee({
                        questionnaireId: B,
                        answers: V
                    });
                    if (!0 !== e.isValid) {
                        if (null != e.failures) {
                            let t = {};
                            e.failures.forEach(e => {
                                null != e.questionId && (t[e.questionId] = !0)
                            }), d(t), l("Title.ValidationFailed", "Message.ValidationFailed")
                        }
                        return !1
                    }
                    return E(2), !0
                } catch (e) {
                    return tU.handleNetworkRequestFailure(e, l, n), !1
                } finally {
                    m(!1)
                }
            }, [B, l, ee, V, n]),
            el = (0, r.useCallback)(() => {
                var e;
                E(1), null == (e = document.getElementById(N.scrollContainerId)) || e.scrollTo(0, 0)
            }, [N.scrollContainerId]),
            er = (0, r.useCallback)(() => {
                E(0)
            }, []),
            ei = (0, r.useCallback)(() => {
                P({
                    onStarted: el
                })
            }, [el, P]),
            eo = async () => {
                if (await F() !== B) return void l(eq, eO);
                if (!B) return void l(eB, e_);
                try {
                    m(!0), await $({
                        questionnaireId: B,
                        answers: V
                    }), q(), g(null), s(!0), E(0)
                } catch (e) {
                    tU.handleNetworkRequestFailure(e, l, n)
                } finally {
                    m(!1)
                }
            }, es = async () => {
                await F() !== B ? l(eq, eO) : el()
            }, eu = (0, r.useMemo)(() => ({
                answers: V,
                errors: u,
                isSaving: c,
                setAnswers: k,
                send: en,
                save: ea,
                goToLanding: er
            }), [V, u, c, k, en, ea, er]), ed = (e, a) => r.default.createElement(f.Grid, {
                container: !0,
                flexDirection: "column",
                gap: "var(--gap-xxlarge)",
                maxWidth: "700px"
            }, 0 === y && r.default.createElement(at, {
                onClick: ei,
                universeId: t,
                progressState: J,
                submissionState: X,
                isContentMaturityEnabled: !0,
                isIncreaseMaturityEnabled: !0
            }), 1 === y && U && (!R || v || a ? r.default.createElement(e3, {
                value: et
            }, R && !h && a && e ? r.default.createElement(an, {
                questionnaire: U,
                ...eu
            }) : r.default.createElement(tR, {
                questionnaire: U,
                ...eu
            })) : r.default.createElement(ar, null)), 2 === y && B && r.default.createElement(ah, {
                universeId: t,
                questionnaireId: B,
                questionnaireResponse: {
                    answers: V
                },
                onEdit: es,
                attemptSubmit: eo,
                isSaving: c,
                moveBackAScreen: el,
                isContentMaturityEnabled: !0,
                isIncreaseMaturityEnabled: !1
            }));
        if (L || z || K || G || Y || !I) return r.default.createElement(ar, null);
        let ec = R && 1 === y && !v,
            em = R && 1 === y && v,
            {
                Enrollment: ep,
                Cache: ef
            } = N.sectionStepper;
        return ec ? r.default.createElement(ep, null, e => {
            let {
                isSectionStepperEnabled: t,
                isFetched: a
            } = e;
            return ed(t, a)
        }) : em ? r.default.createElement(ef, null, e => {
            let {
                isSectionStepperEnabled: t,
                isFetched: a
            } = e;
            return ed(t, a)
        }) : ed(!1, !0)
    }, [eA.Navigation, eA.DeveloperQuestionnaire, eA.Error]);
    let ax = e => {
        let {
            lightSrc: t,
            darkSrc: a,
            alt: n,
            ...l
        } = e, {
            themeMode: i
        } = (0, eh.useThemeMode)();
        return r.default.createElement("img", {
            src: "dark" === i && null != a ? a : t,
            alt: n,
            ...l
        })
    };
    var aC = (0, i.withTranslation)(e => {
        let {
            title: t,
            message: a,
            buttonText: n,
            onReload: l,
            className: o
        } = e, {
            translate: s
        } = (0, i.useTranslation)();
        return r.default.createElement("div", {
            className: (0, ee.clsx)("flex flex-col justify-center items-center size-full", o)
        }, r.default.createElement(ax, {
            lightSrc: eb.default,
            darkSrc: ev.default,
            alt: "failure"
        }), r.default.createElement("div", {
            className: "flex flex-col text-align-x-center gap-small margin-bottom-medium"
        }, r.default.createElement("h2", {
            className: "text-heading-small content-emphasis margin-none"
        }, null != t ? t : s("Heading.GenericError")), r.default.createElement("span", {
            className: "text-body-medium content-default"
        }, a)), l && r.default.createElement(et.Button, {
            variant: "Standard",
            size: "Medium",
            onClick: l
        }, null != n ? n : s("Action.FailedToLoadPage")))
    }, [eA.Error]);
    let aS = e => {
            let {
                href: t,
                ...a
            } = e;
            return r.default.createElement(d.Link, {
                href: null != t ? t : "/",
                ...a
            })
        },
        aw = (0, s.makeStyles)()(e => ({
            borderedTable: {
                width: "100%",
                tableLayout: "fixed",
                border: "1px solid ".concat(e.palette.components.divider),
                borderCollapse: "separate",
                borderSpacing: 0,
                borderRadius: e.border.radius.medium.borderRadius,
                "& thead tr:first-of-type th": {
                    "&:first-of-type": {
                        borderTopLeftRadius: e.border.radius.medium.borderRadius
                    },
                    "&:last-of-type": {
                        borderTopRightRadius: e.border.radius.medium.borderRadius
                    }
                },
                "& tbody tr:last-of-type td": {
                    borderBottom: "none",
                    "&:first-of-type": {
                        borderBottomLeftRadius: e.border.radius.medium.borderRadius
                    },
                    "&:last-of-type": {
                        borderBottomRightRadius: e.border.radius.medium.borderRadius
                    }
                },
                "& th, & td": {
                    border: "none",
                    borderBottom: "1px solid ".concat(e.palette.components.divider)
                }
            }
        })),
        aN = e => {
            let {
                open: t,
                onClose: a,
                moderation: n
            } = e, {
                translate: l
            } = (0, i.useTranslation)(), {
                classes: {
                    borderedTable: o
                }
            } = aw(), s = (0, r.useMemo)(() => {
                var e, t, a, r, i;
                let o = null != (e = n.moderatorReasoning) ? e : [],
                    s = null != (t = null == (r = n.creatorUsages) ? void 0 : r.items) ? t : [],
                    u = null != (a = null == (i = n.moderatorUsages) ? void 0 : i.items) ? a : [],
                    d = l("Message.NotPresentDescriptorUsage"),
                    c = e => {
                        var t, a, n;
                        return e ? e.contains ? null != (t = null != (a = e.descriptorDisplayName) ? a : null == (n = e.experienceDescriptor) ? void 0 : n.displayName) ? t : "—" : d : "—"
                    };
                return o.map(e => {
                    var t, a, n, l, r, i;
                    let o = s.find(t => t.name === e.descriptorName),
                        d = u.find(t => t.name === e.descriptorName),
                        m = null != (t = null != (a = null != (n = null == o || null == (r = o.experienceDescriptor) ? void 0 : r.displayName) ? n : null == d || null == (i = d.experienceDescriptor) ? void 0 : i.displayName) ? a : e.descriptorName) ? t : "";
                    return {
                        descriptorName: null != (l = e.descriptorName) ? l : "",
                        descriptorLabel: m,
                        creatorDisplayName: c(o),
                        moderatorDisplayName: c(d),
                        reasoning: e.reasoning
                    }
                })
            }, [n, l]);
            return r.default.createElement(Y.Dialog, {
                open: t,
                onOpenChange: e => {
                    e || a()
                },
                size: "Large",
                isModal: !0,
                hasCloseAffordance: !0,
                closeLabel: l("Action.Close")
            }, r.default.createElement(Y.DialogContent, {
                className: "flex flex-col",
                style: {
                    maxHeight: "80vh",
                    maxWidth: "min(720px, 90vw)"
                }
            }, r.default.createElement(Y.DialogBody, {
                className: "flex flex-col gap-large min-height-[0px]"
            }, r.default.createElement(Y.DialogTitle, {
                className: "text-heading-small margin-none"
            }, l("Title.YourModerationFeedback")), r.default.createElement("span", {
                className: "text-body-medium content-default"
            }, l("Description.ModerationFeedbackInaccurate")), r.default.createElement("div", {
                style: {
                    overflowY: "auto",
                    minHeight: 0
                }
            }, r.default.createElement(L.Table, {
                className: "".concat(o, " radius-medium clip")
            }, r.default.createElement(B.TableHead, null, r.default.createElement(_.TableRow, null, r.default.createElement(q.TableCell, null, r.default.createElement("span", {
                className: "text-label-medium"
            }, l("TableHead.YourResponse"))), r.default.createElement(q.TableCell, null, r.default.createElement("span", {
                className: "text-label-medium"
            }, l("TableHead.ModeratorFeedback"))))), r.default.createElement(O.TableBody, null, s.length > 0 ? s.map(e => r.default.createElement(_.TableRow, {
                key: e.descriptorName
            }, r.default.createElement(q.TableCell, null, r.default.createElement("div", {
                className: "flex flex-col"
            }, r.default.createElement("span", {
                className: "text-label-medium"
            }, e.descriptorLabel), r.default.createElement("span", {
                className: "text-body-medium"
            }, e.creatorDisplayName))), r.default.createElement(q.TableCell, null, r.default.createElement("div", {
                className: "flex flex-col"
            }, r.default.createElement("span", {
                className: "text-label-medium"
            }, e.descriptorLabel), r.default.createElement("span", {
                className: "text-body-medium"
            }, e.moderatorDisplayName), e.reasoning && r.default.createElement("span", {
                className: "text-body-small content-default"
            }, e.reasoning))))) : r.default.createElement(_.TableRow, null, r.default.createElement(q.TableCell, null, r.default.createElement("span", {
                className: "text-body-medium"
            }, "—")), r.default.createElement(q.TableCell, null, r.default.createElement("span", {
                className: "text-body-medium"
            }, "—"))))))), r.default.createElement(Y.DialogFooter, {
                className: "flex items-center justify-end gap-small"
            }, r.default.createElement(et.Button, {
                as: "a",
                href: "https://www.roblox.com/report-appeals#/",
                target: "_blank",
                rel: "noopener",
                variant: "Standard",
                size: "Medium"
            }, l("Action.AppealDecision")))))
        },
        aI = e => {
            let {
                description: t,
                linkLabel: a,
                linkHref: n
            } = e;
            return r.default.createElement("div", {
                className: "flex items-center gap-small padding-medium radius-medium bg-surface-200"
            }, r.default.createElement(ea.Icon, {
                name: "icon-regular-circle-i",
                size: "Medium",
                className: "shrink-0"
            }), r.default.createElement("span", {
                className: "text-body-medium content-default grow-1"
            }, t), a && n && r.default.createElement(en.Link, {
                href: n,
                target: "_blank",
                color: "Standard",
                underline: "always",
                isExternal: !1,
                className: "shrink-0"
            }, a))
        },
        aA = e => {
            switch (e) {
                case "Assigned":
                    return "Success";
                case "Pending":
                case "NotStarted":
                default:
                    return "Neutral";
                case "Rejected":
                    return "Alert"
            }
        },
        aR = (0, s.makeStyles)()(e => ({
            accordionRoot: {
                border: "unset",
                borderBottom: "1px solid ".concat(e.palette.components.divider),
                "&.Mui-expanded": {
                    margin: 0
                },
                "::before": {
                    content: "none"
                }
            },
            accordionSummaryContent: {
                justifyContent: "space-between",
                alignItems: "center",
                paddingRight: "var(--padding-small)",
                display: "flex",
                gap: "var(--gap-medium)"
            }
        })),
        ak = e => {
            var t, a, n, l, o, s, u, d, c;
            let {
                ratingsStatus: m,
                nonCompliantRegionStatus: p,
                detailedGuidelines: f,
                isOverEighteenQuestionnaire: g
            } = e, {
                classes: {
                    accordionRoot: y,
                    accordionSummaryContent: E
                }
            } = aR(), {
                classes: {
                    borderedTable: v
                }
            } = aw(), {
                translate: b,
                translateHTML: x,
                translateWithNamespace: C
            } = (0, i.useTranslation)(), w = null != (t = null == f || null == (s = f.ageRecommendationDetails) || null == (o = s.experienceDescriptorUsages) ? void 0 : o.items) ? t : [], N = null == f || null == (d = f.ageRecommendationDetails) || null == (u = d.ageRecommendationSummary) ? void 0 : u.ageRecommendation, I = null != (a = null == f ? void 0 : f.restrictedCountries) ? a : [], A = null != (n = null == f ? void 0 : f.robloxProducts) ? n : [], R = w.map(e => e.descriptorDisplayName).filter(Boolean), k = null == N ? void 0 : N.contentMaturity, M = !k || "unrated" === k, D = M ? "—" : null != (l = null == N ? void 0 : N.displayName) ? l : "—", P = (null == f || null == (c = f.moderation) ? void 0 : c.moderationStatus) === ef.V2Beta1ModerationStatus.Rejected ? "Rejected" : M ? "NotStarted" : "Assigned", U = A.flatMap(e => {
                var t, a;
                return (null != (t = null == (a = e.iarcProduct) ? void 0 : a.ratingList) ? t : []).map(t => ({
                    product: e,
                    rating: t
                }))
            }).sort((e, t) => {
                var a, n;
                return (null != (a = e.rating.ratingAuthorityShortText) ? a : "").localeCompare(null != (n = t.rating.ratingAuthorityShortText) ? n : "")
            }), F = U.length > 0 ? "Assigned" : "Assigned" === m ? "NotStarted" : m, Q = I.length > 0 ? "Assigned" : p, z = !g;
            return r.default.createElement("div", {
                className: "flex flex-col gap-medium"
            }, z && 0 === U.length && r.default.createElement(aI, {
                description: C(eA.DeveloperQuestionnaire, "Description.U18NoRatings")
            }), r.default.createElement(h.Accordion, {
                square: !0,
                variant: "outlined",
                classes: {
                    root: y
                }
            }, r.default.createElement(T.AccordionSummary, {
                expandIcon: r.default.createElement(G.ExpandMoreIcon, null),
                classes: {
                    content: E
                }
            }, r.default.createElement("span", {
                className: "text-heading-small"
            }, b("Title.RobloxMaturityLabelV2")), r.default.createElement(el.Badge, {
                label: b("Label.".concat(P)),
                variant: aA(P)
            })), r.default.createElement(S.AccordionDetails, null, r.default.createElement("div", {
                className: "flex flex-col gap-medium"
            }, r.default.createElement(L.Table, {
                className: "".concat(v, " radius-medium clip")
            }, r.default.createElement(B.TableHead, null, r.default.createElement(_.TableRow, null, r.default.createElement(q.TableCell, null, r.default.createElement("div", {
                className: "flex items-center gap-small"
            }, r.default.createElement("span", {
                className: "text-label-medium"
            }, b("Label.Rating")))), r.default.createElement(q.TableCell, null, r.default.createElement("div", {
                className: "flex items-center gap-small"
            }, r.default.createElement("span", {
                className: "text-label-medium"
            }, b("TableHead.Descriptors")))))), r.default.createElement(O.TableBody, null, r.default.createElement(_.TableRow, null, r.default.createElement(q.TableCell, null, r.default.createElement("span", {
                className: "text-body-medium"
            }, D || "—")), r.default.createElement(q.TableCell, null, r.default.createElement("div", {
                className: "flex flex-col"
            }, w.map(e => {
                var t;
                return null == (t = e.experienceDescriptor) ? void 0 : t.displayName
            }).filter(Boolean).map(e => r.default.createElement("span", {
                key: e,
                className: "text-body-medium"
            }, e)), 0 === w.length && r.default.createElement("span", {
                className: "text-body-medium"
            }, "—"))))))))), r.default.createElement(h.Accordion, {
                square: !0,
                variant: "outlined",
                classes: {
                    root: y
                }
            }, r.default.createElement(T.AccordionSummary, {
                expandIcon: r.default.createElement(G.ExpandMoreIcon, null),
                classes: {
                    content: E
                }
            }, r.default.createElement("span", {
                className: "text-heading-small"
            }, b("Title.MoreContentRatings")), r.default.createElement(el.Badge, {
                label: b("Label.".concat(F)),
                variant: aA(F)
            })), r.default.createElement(S.AccordionDetails, null, r.default.createElement("div", {
                className: "flex flex-col gap-medium"
            }, r.default.createElement("span", {
                className: "text-body-medium content-default"
            }, b("Description.MoreContentRatings")), "Pending" === m && (z ? r.default.createElement(aI, {
                description: C(eA.DeveloperQuestionnaire, "Description.U18PendingRatings")
            }) : r.default.createElement(er.FeedbackBanner, {
                title: "",
                description: b("Description.PendingRatingsAutoUpdate"),
                layout: "Inline",
                variant: "Standard",
                severity: "Info"
            })), r.default.createElement(L.Table, {
                className: "".concat(v, " radius-medium clip")
            }, r.default.createElement(B.TableHead, null, r.default.createElement(_.TableRow, null, r.default.createElement(q.TableCell, null, r.default.createElement("div", {
                className: "flex items-center gap-small"
            }, r.default.createElement("span", {
                className: "text-label-medium"
            }, b("Label.RatingSystem")))), r.default.createElement(q.TableCell, null, r.default.createElement("div", {
                className: "flex items-center gap-small"
            }, r.default.createElement("span", {
                className: "text-label-medium"
            }, b("Label.Rating")))), r.default.createElement(q.TableCell, null, r.default.createElement("div", {
                className: "flex items-center gap-small"
            }, r.default.createElement("span", {
                className: "text-label-medium"
            }, b("Label.InteractiveElements")))), r.default.createElement(q.TableCell, null, r.default.createElement("div", {
                className: "flex items-center gap-small"
            }, r.default.createElement("span", {
                className: "text-label-medium"
            }, b("Label.IARCDescriptors")))), r.default.createElement(q.TableCell, null, r.default.createElement("div", {
                className: "flex items-center gap-small"
            }, r.default.createElement("span", {
                className: "text-label-medium"
            }, b("Label.RobloxDescriptors")))))), r.default.createElement(O.TableBody, null, U.length > 0 ? U.map(e => {
                var t, a, n, l, i, o, s, u, d, c;
                let {
                    product: m,
                    rating: p
                } = e;
                return r.default.createElement(_.TableRow, {
                    key: "".concat(null != (t = m.productId) ? t : "", "-").concat(null != (a = p.ratingAuthorityID) ? a : "", "-").concat(null != (n = p.ageRatingID) ? n : "")
                }, r.default.createElement(q.TableCell, null, r.default.createElement("div", {
                    className: "flex flex-col gap-xsmall"
                }, r.default.createElement("span", {
                    className: "text-body-medium"
                }, null != (l = p.ratingAuthorityShortText) ? l : "—"), p.localizedRegionText && r.default.createElement("span", {
                    className: "text-body-small content-muted"
                }, p.localizedRegionText))), r.default.createElement(q.TableCell, null, r.default.createElement("div", {
                    className: "flex items-center gap-small"
                }, p.ageRatingIconUrl && r.default.createElement("img", {
                    src: p.ageRatingIconUrl,
                    alt: null != (i = p.localizedDisplayText) ? i : "",
                    className: "height-[32px] width-[32px] radius-small"
                }), r.default.createElement("span", {
                    className: "text-body-medium"
                }, null != (o = p.localizedDisplayText) ? o : "—"))), r.default.createElement(q.TableCell, null, r.default.createElement("div", {
                    className: "flex flex-col"
                }, (null != (s = p.interactiveElementList) ? s : []).map(e => {
                    var t;
                    return null != (t = e.localizedDisplayText) ? t : e.interactiveElementText
                }).filter(Boolean).map(e => r.default.createElement("span", {
                    key: e,
                    className: "text-body-medium"
                }, e)), !(null == (d = p.interactiveElementList) ? void 0 : d.length) && r.default.createElement("span", {
                    className: "text-body-medium"
                }, "—"))), r.default.createElement(q.TableCell, null, r.default.createElement("span", {
                    className: "text-body-medium"
                }, null != (u = null == (c = p.descriptorList) ? void 0 : c.map(e => {
                    var t;
                    return null != (t = e.localizedDisplayText) ? t : e.descriptorText
                }).join(", ")) ? u : "—")), r.default.createElement(q.TableCell, null, r.default.createElement("div", {
                    className: "flex flex-col"
                }, R.map(e => r.default.createElement("span", {
                    key: e,
                    className: "text-body-medium"
                }, e)), 0 === R.length && r.default.createElement("span", {
                    className: "text-body-medium"
                }, "—"))))
            }) : r.default.createElement(_.TableRow, null, r.default.createElement(q.TableCell, null, r.default.createElement("span", {
                className: "text-body-medium"
            }, "—")), r.default.createElement(q.TableCell, null, r.default.createElement("span", {
                className: "text-body-medium"
            }, "—")), r.default.createElement(q.TableCell, null, r.default.createElement("span", {
                className: "text-body-medium"
            }, "—")), r.default.createElement(q.TableCell, null, r.default.createElement("span", {
                className: "text-body-medium"
            }, "—")), r.default.createElement(q.TableCell, null, r.default.createElement("span", {
                className: "text-body-medium"
            }, "—")))))))), r.default.createElement(h.Accordion, {
                square: !0,
                variant: "outlined",
                classes: {
                    root: y
                }
            }, r.default.createElement(T.AccordionSummary, {
                expandIcon: r.default.createElement(G.ExpandMoreIcon, null),
                classes: {
                    content: E
                }
            }, r.default.createElement("span", {
                className: "text-heading-small"
            }, b("Title.NonCompliantRegions")), r.default.createElement(el.Badge, {
                label: b("Label.".concat(Q)),
                variant: aA(Q)
            })), r.default.createElement(S.AccordionDetails, null, r.default.createElement("div", {
                className: "flex flex-col gap-medium"
            }, r.default.createElement("span", {
                className: "text-body-medium content-default"
            }, x("Description.NonCompliantRegions", [{
                opening: "policyApisLinkStart",
                closing: "policyApisLinkEnd",
                content: e => r.default.createElement(aS, {
                    href: "https://create.roblox.com/docs/reference/engine/classes/PolicyService",
                    target: "_blank"
                }, e)
            }])), r.default.createElement(L.Table, {
                className: "".concat(v, " radius-medium clip")
            }, r.default.createElement(B.TableHead, null, r.default.createElement(_.TableRow, null, r.default.createElement(q.TableCell, null, r.default.createElement("div", {
                className: "flex items-center gap-small"
            }, r.default.createElement("span", {
                className: "text-label-medium"
            }, b("Title.Location")))), r.default.createElement(q.TableCell, null, r.default.createElement("div", {
                className: "flex items-center gap-small"
            }, r.default.createElement("span", {
                className: "text-label-medium"
            }, b("TableHead.Descriptors")))), r.default.createElement(q.TableCell, null, r.default.createElement("div", {
                className: "flex items-center gap-small"
            }, r.default.createElement("span", {
                className: "text-label-medium"
            }, b("Title.GuidelinesAgeRestriction")))))), r.default.createElement(O.TableBody, null, I.length > 0 ? I.map((e, t) => {
                var a, n, l, i, o, s;
                return r.default.createElement(_.TableRow, {
                    key: null != (a = e.countryCode) ? a : t
                }, r.default.createElement(q.TableCell, null, r.default.createElement("span", {
                    className: "text-body-medium"
                }, null != (n = e.countryDisplayName) ? n : "—")), r.default.createElement(q.TableCell, null, r.default.createElement("span", {
                    className: "text-body-medium"
                }, null != (l = null == (o = e.experienceDescriptorUsages) ? void 0 : o.map(e => e.descriptorDisplayName).filter(Boolean).join(", ")) ? l : "—")), r.default.createElement(q.TableCell, null, r.default.createElement("span", {
                    className: "text-body-medium"
                }, null != (i = null == (s = e.experienceDescriptorUsages) ? void 0 : s.map(e => e.ageRangeDisplayName).filter(Boolean).join(", ")) ? i : "—")))
            }) : r.default.createElement(_.TableRow, null, r.default.createElement(q.TableCell, null, r.default.createElement("span", {
                className: "text-body-medium"
            }, "—")), r.default.createElement(q.TableCell, null, r.default.createElement("span", {
                className: "text-body-medium"
            }, "—")), r.default.createElement(q.TableCell, null, r.default.createElement("span", {
                className: "text-body-medium"
            }, "—")))))))))
        };

    function aM(e, t) {
        (null == t || t > e.length) && (t = e.length);
        for (var a = 0, n = Array(t); a < t; a++) n[a] = e[a];
        return n
    }
    let aD = Object.entries,
        aL = Object.setPrototypeOf,
        aB = Object.isFrozen,
        a_ = Object.getPrototypeOf,
        aq = Object.getOwnPropertyDescriptor,
        aO = Object.freeze,
        aP = Object.seal,
        aU = Object.create,
        aG = "u" > typeof Reflect && Reflect,
        aF = aG.apply,
        aQ = aG.construct;
    aO || (aO = function(e) {
        return e
    }), aP || (aP = function(e) {
        return e
    }), aF || (aF = function(e, t) {
        for (var a = arguments.length, n = Array(a > 2 ? a - 2 : 0), l = 2; l < a; l++) n[l - 2] = arguments[l];
        return e.apply(t, n)
    }), aQ || (aQ = function(e) {
        for (var t = arguments.length, a = Array(t > 1 ? t - 1 : 0), n = 1; n < t; n++) a[n - 1] = arguments[n];
        return new e(...a)
    });
    let az = a5(Array.prototype.forEach),
        aH = a5(Array.prototype.lastIndexOf),
        aV = a5(Array.prototype.pop),
        aW = a5(Array.prototype.push),
        aj = a5(Array.prototype.splice),
        aK = Array.isArray,
        aY = a5(String.prototype.toLowerCase),
        aX = a5(String.prototype.toString),
        aJ = a5(String.prototype.match),
        a$ = a5(String.prototype.replace),
        aZ = a5(String.prototype.indexOf),
        a0 = a5(String.prototype.trim),
        a1 = a5(Number.prototype.toString),
        a2 = a5(Boolean.prototype.toString),
        a4 = "u" < typeof BigInt ? null : a5(BigInt.prototype.toString),
        a3 = "u" < typeof Symbol ? null : a5(Symbol.prototype.toString),
        a9 = a5(Object.prototype.hasOwnProperty),
        a8 = a5(Object.prototype.toString),
        a7 = a5(RegExp.prototype.test),
        a6 = (ew = TypeError, function() {
            for (var e = arguments.length, t = Array(e), a = 0; a < e; a++) t[a] = arguments[a];
            return aQ(ew, t)
        });

    function a5(e) {
        return function(t) {
            t instanceof RegExp && (t.lastIndex = 0);
            for (var a = arguments.length, n = Array(a > 1 ? a - 1 : 0), l = 1; l < a; l++) n[l - 1] = arguments[l];
            return aF(e, t, n)
        }
    }

    function ne(e, t) {
        let a = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : aY;
        if (aL && aL(e, null), !aK(t)) return e;
        let n = t.length;
        for (; n--;) {
            let l = t[n];
            if ("string" == typeof l) {
                let e = a(l);
                e !== l && (aB(t) || (t[n] = e), l = e)
            }
            e[l] = !0
        }
        return e
    }

    function nt(e) {
        let t = aU(null);
        for (let n of aD(e)) {
            var a = function(e) {
                if (Array.isArray(e)) return e
            }(n) || function(e) {
                var t = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                if (null != t) {
                    var a, n, l, r, i = [],
                        o = !0,
                        s = !1;
                    try {
                        for (l = (t = t.call(e)).next; !(o = (a = l.call(t)).done) && (i.push(a.value), 2 !== i.length); o = !0);
                    } catch (e) {
                        s = !0, n = e
                    } finally {
                        try {
                            if (!o && null != t.return && (r = t.return(), Object(r) !== r)) return
                        } finally {
                            if (s) throw n
                        }
                    }
                    return i
                }
            }(n) || function(e) {
                if (e) {
                    if ("string" == typeof e) return aM(e, 2);
                    var t = ({}).toString.call(e).slice(8, -1);
                    return "Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t ? Array.from(e) : "Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t) ? aM(e, 2) : void 0
                }
            }(n) || function() {
                throw TypeError("Invalid attempt to destructure non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
            }();
            let l = a[0],
                r = a[1];
            a9(e, l) && (aK(r) ? t[l] = function(e) {
                for (let t = 0; t < e.length; t++) a9(e, t) || (e[t] = null);
                return e
            }(r) : r && "object" == typeof r && r.constructor === Object ? t[l] = nt(r) : t[l] = r)
        }
        return t
    }

    function na(e, t) {
        for (; null !== e;) {
            let a = aq(e, t);
            if (a) {
                if (a.get) return a5(a.get);
                if ("function" == typeof a.value) return a5(a.value)
            }
            e = a_(e)
        }
        return function() {
            return null
        }
    }
    let nn = aO(["a", "abbr", "acronym", "address", "area", "article", "aside", "audio", "b", "bdi", "bdo", "big", "blink", "blockquote", "body", "br", "button", "canvas", "caption", "center", "cite", "code", "col", "colgroup", "content", "data", "datalist", "dd", "decorator", "del", "details", "dfn", "dialog", "dir", "div", "dl", "dt", "element", "em", "fieldset", "figcaption", "figure", "font", "footer", "form", "h1", "h2", "h3", "h4", "h5", "h6", "head", "header", "hgroup", "hr", "html", "i", "img", "input", "ins", "kbd", "label", "legend", "li", "main", "map", "mark", "marquee", "menu", "menuitem", "meter", "nav", "nobr", "ol", "optgroup", "option", "output", "p", "picture", "pre", "progress", "q", "rp", "rt", "ruby", "s", "samp", "search", "section", "select", "shadow", "slot", "small", "source", "spacer", "span", "strike", "strong", "style", "sub", "summary", "sup", "table", "tbody", "td", "template", "textarea", "tfoot", "th", "thead", "time", "tr", "track", "tt", "u", "ul", "var", "video", "wbr"]),
        nl = aO(["svg", "a", "altglyph", "altglyphdef", "altglyphitem", "animatecolor", "animatemotion", "animatetransform", "circle", "clippath", "defs", "desc", "ellipse", "enterkeyhint", "exportparts", "filter", "font", "g", "glyph", "glyphref", "hkern", "image", "inputmode", "line", "lineargradient", "marker", "mask", "metadata", "mpath", "part", "path", "pattern", "polygon", "polyline", "radialgradient", "rect", "stop", "style", "switch", "symbol", "text", "textpath", "title", "tref", "tspan", "view", "vkern"]),
        nr = aO(["feBlend", "feColorMatrix", "feComponentTransfer", "feComposite", "feConvolveMatrix", "feDiffuseLighting", "feDisplacementMap", "feDistantLight", "feDropShadow", "feFlood", "feFuncA", "feFuncB", "feFuncG", "feFuncR", "feGaussianBlur", "feImage", "feMerge", "feMergeNode", "feMorphology", "feOffset", "fePointLight", "feSpecularLighting", "feSpotLight", "feTile", "feTurbulence"]),
        ni = aO(["animate", "color-profile", "cursor", "discard", "font-face", "font-face-format", "font-face-name", "font-face-src", "font-face-uri", "foreignobject", "hatch", "hatchpath", "mesh", "meshgradient", "meshpatch", "meshrow", "missing-glyph", "script", "set", "solidcolor", "unknown", "use"]),
        no = aO(["math", "menclose", "merror", "mfenced", "mfrac", "mglyph", "mi", "mlabeledtr", "mmultiscripts", "mn", "mo", "mover", "mpadded", "mphantom", "mroot", "mrow", "ms", "mspace", "msqrt", "mstyle", "msub", "msup", "msubsup", "mtable", "mtd", "mtext", "mtr", "munder", "munderover", "mprescripts"]),
        ns = aO(["maction", "maligngroup", "malignmark", "mlongdiv", "mscarries", "mscarry", "msgroup", "mstack", "msline", "msrow", "semantics", "annotation", "annotation-xml", "mprescripts", "none"]),
        nu = aO(["#text"]),
        nd = aO(["accept", "action", "align", "alt", "autocapitalize", "autocomplete", "autopictureinpicture", "autoplay", "background", "bgcolor", "border", "capture", "cellpadding", "cellspacing", "checked", "cite", "class", "clear", "color", "cols", "colspan", "command", "commandfor", "controls", "controlslist", "coords", "crossorigin", "datetime", "decoding", "default", "dir", "disabled", "disablepictureinpicture", "disableremoteplayback", "download", "draggable", "enctype", "enterkeyhint", "exportparts", "face", "for", "headers", "height", "hidden", "high", "href", "hreflang", "id", "inert", "inputmode", "integrity", "ismap", "kind", "label", "lang", "list", "loading", "loop", "low", "max", "maxlength", "media", "method", "min", "minlength", "multiple", "muted", "name", "nonce", "noshade", "novalidate", "nowrap", "open", "optimum", "part", "pattern", "placeholder", "playsinline", "popover", "popovertarget", "popovertargetaction", "poster", "preload", "pubdate", "radiogroup", "readonly", "rel", "required", "rev", "reversed", "role", "rows", "rowspan", "spellcheck", "scope", "selected", "shape", "size", "sizes", "slot", "span", "srclang", "start", "src", "srcset", "step", "style", "summary", "tabindex", "title", "translate", "type", "usemap", "valign", "value", "width", "wrap", "xmlns"]),
        nc = aO(["accent-height", "accumulate", "additive", "alignment-baseline", "amplitude", "ascent", "attributename", "attributetype", "azimuth", "basefrequency", "baseline-shift", "begin", "bias", "by", "class", "clip", "clippathunits", "clip-path", "clip-rule", "color", "color-interpolation", "color-interpolation-filters", "color-profile", "color-rendering", "cx", "cy", "d", "dx", "dy", "diffuseconstant", "direction", "display", "divisor", "dur", "edgemode", "elevation", "end", "exponent", "fill", "fill-opacity", "fill-rule", "filter", "filterunits", "flood-color", "flood-opacity", "font-family", "font-size", "font-size-adjust", "font-stretch", "font-style", "font-variant", "font-weight", "fx", "fy", "g1", "g2", "glyph-name", "glyphref", "gradientunits", "gradienttransform", "height", "href", "id", "image-rendering", "in", "in2", "intercept", "k", "k1", "k2", "k3", "k4", "kerning", "keypoints", "keysplines", "keytimes", "lang", "lengthadjust", "letter-spacing", "kernelmatrix", "kernelunitlength", "lighting-color", "local", "marker-end", "marker-mid", "marker-start", "markerheight", "markerunits", "markerwidth", "maskcontentunits", "maskunits", "max", "mask", "mask-type", "media", "method", "mode", "min", "name", "numoctaves", "offset", "operator", "opacity", "order", "orient", "orientation", "origin", "overflow", "paint-order", "path", "pathlength", "patterncontentunits", "patterntransform", "patternunits", "points", "preservealpha", "preserveaspectratio", "primitiveunits", "r", "rx", "ry", "radius", "refx", "refy", "repeatcount", "repeatdur", "restart", "result", "rotate", "scale", "seed", "shape-rendering", "slope", "specularconstant", "specularexponent", "spreadmethod", "startoffset", "stddeviation", "stitchtiles", "stop-color", "stop-opacity", "stroke-dasharray", "stroke-dashoffset", "stroke-linecap", "stroke-linejoin", "stroke-miterlimit", "stroke-opacity", "stroke", "stroke-width", "style", "surfacescale", "systemlanguage", "tabindex", "tablevalues", "targetx", "targety", "transform", "transform-origin", "text-anchor", "text-decoration", "text-rendering", "textlength", "type", "u1", "u2", "unicode", "values", "viewbox", "visibility", "version", "vert-adv-y", "vert-origin-x", "vert-origin-y", "width", "word-spacing", "wrap", "writing-mode", "xchannelselector", "ychannelselector", "x", "x1", "x2", "xmlns", "y", "y1", "y2", "z", "zoomandpan"]),
        nm = aO(["accent", "accentunder", "align", "bevelled", "close", "columnalign", "columnlines", "columnspacing", "columnspan", "denomalign", "depth", "dir", "display", "displaystyle", "encoding", "fence", "frame", "height", "href", "id", "largeop", "length", "linethickness", "lquote", "lspace", "mathbackground", "mathcolor", "mathsize", "mathvariant", "maxsize", "minsize", "movablelimits", "notation", "numalign", "open", "rowalign", "rowlines", "rowspacing", "rowspan", "rspace", "rquote", "scriptlevel", "scriptminsize", "scriptsizemultiplier", "selection", "separator", "separators", "stretchy", "subscriptshift", "supscriptshift", "symmetric", "voffset", "width", "xmlns"]),
        np = aO(["xlink:href", "xml:id", "xlink:title", "xml:space", "xmlns:xlink"]),
        nf = aP(/{{[\w\W]*|^[\w\W]*}}/g),
        ng = aP(/<%[\w\W]*|^[\w\W]*%>/g),
        ny = aP(/\${[\w\W]*/g),
        nE = aP(/^data-[\-\w.\u00B7-\uFFFF]+$/),
        nv = aP(/^aria-[\-\w]+$/),
        nb = aP(/^(?:(?:(?:f|ht)tps?|mailto|tel|callto|sms|cid|xmpp|matrix):|[^a-z]|[a-z+.\-]+(?:[^a-z+.\-:]|$))/i),
        nh = aP(/^(?:\w+script|data):/i),
        nT = aP(/[\u0000-\u0020\u00A0\u1680\u180E\u2000-\u2029\u205F\u3000]/g),
        nx = aP(/^html$/i),
        nC = aP(/^[a-z][.\w]*(-[.\w]+)+$/i),
        nS = function(e, t) {
            if ("object" != typeof e || "function" != typeof e.createPolicy) return null;
            let a = null,
                n = "data-tt-policy-suffix";
            t && t.hasAttribute(n) && (a = t.getAttribute(n));
            let l = "dompurify" + (a ? "#" + a : "");
            try {
                return e.createPolicy(l, {
                    createHTML: e => e,
                    createScriptURL: e => e
                })
            } catch (e) {
                return console.warn("TrustedTypes policy " + l + " could not be created."), null
            }
        },
        nw = function() {
            return {
                afterSanitizeAttributes: [],
                afterSanitizeElements: [],
                afterSanitizeShadowDOM: [],
                beforeSanitizeAttributes: [],
                beforeSanitizeElements: [],
                beforeSanitizeShadowDOM: [],
                uponSanitizeAttribute: [],
                uponSanitizeElement: [],
                uponSanitizeShadowNode: []
            }
        };
    var nN = function e() {
        let t, a = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : window,
            n = t => e(t);
        if (n.version = "3.4.5", n.removed = [], !a || !a.document || 9 !== a.document.nodeType || !a.Element) return n.isSupported = !1, n;
        let l = a.document,
            r = l,
            i = r.currentScript,
            o = a.DocumentFragment,
            s = a.HTMLTemplateElement,
            u = a.Node,
            d = a.Element,
            c = a.NodeFilter,
            m = a.NamedNodeMap,
            p = void 0 === m ? a.NamedNodeMap || a.MozNamedAttrMap : m,
            f = a.HTMLFormElement,
            g = a.DOMParser,
            y = a.trustedTypes,
            E = d.prototype,
            v = na(E, "cloneNode"),
            b = na(E, "remove"),
            h = na(E, "nextSibling"),
            T = na(E, "childNodes"),
            x = na(E, "parentNode"),
            C = u && u.prototype ? na(u.prototype, "nodeType") : null;
        if ("function" == typeof s) {
            let e = l.createElement("template");
            e.content && e.content.ownerDocument && (l = e.content.ownerDocument)
        }
        let S = "",
            w = l,
            N = w.implementation,
            I = w.createNodeIterator,
            A = w.createDocumentFragment,
            R = w.getElementsByTagName,
            k = r.importNode,
            M = nw();
        n.isSupported = "function" == typeof aD && "function" == typeof x && N && void 0 !== N.createHTMLDocument;
        let D = nb,
            L = null,
            B = ne({}, [...nn, ...nl, ...nr, ...no, ...nu]),
            _ = null,
            q = ne({}, [...nd, ...nc, ...nm, ...np]),
            O = Object.seal(aU(null, {
                tagNameCheck: {
                    writable: !0,
                    configurable: !1,
                    enumerable: !0,
                    value: null
                },
                attributeNameCheck: {
                    writable: !0,
                    configurable: !1,
                    enumerable: !0,
                    value: null
                },
                allowCustomizedBuiltInElements: {
                    writable: !0,
                    configurable: !1,
                    enumerable: !0,
                    value: !1
                }
            })),
            P = null,
            U = null,
            G = Object.seal(aU(null, {
                tagCheck: {
                    writable: !0,
                    configurable: !1,
                    enumerable: !0,
                    value: null
                },
                attributeCheck: {
                    writable: !0,
                    configurable: !1,
                    enumerable: !0,
                    value: null
                }
            })),
            F = !0,
            Q = !0,
            z = !1,
            H = !0,
            V = !1,
            W = !0,
            j = !1,
            K = !1,
            Y = !1,
            X = !1,
            J = !1,
            $ = !1,
            Z = !0,
            ee = !1,
            et = "user-content-",
            ea = !0,
            en = !1,
            el = {},
            er = null,
            ei = ne({}, ["annotation-xml", "audio", "colgroup", "desc", "foreignobject", "head", "iframe", "math", "mi", "mn", "mo", "ms", "mtext", "noembed", "noframes", "noscript", "plaintext", "script", "style", "svg", "template", "thead", "title", "video", "xmp"]),
            eo = null,
            es = ne({}, ["audio", "video", "img", "source", "image", "track"]),
            eu = null,
            ed = ne({}, ["alt", "class", "for", "id", "label", "name", "pattern", "placeholder", "role", "summary", "title", "value", "style", "xmlns"]),
            ec = "http://www.w3.org/1998/Math/MathML",
            em = "http://www.w3.org/2000/svg",
            ep = "http://www.w3.org/1999/xhtml",
            ef = ep,
            eg = !1,
            ey = null,
            eE = ne({}, [ec, em, ep], aX),
            ev = ne({}, ["mi", "mo", "mn", "ms", "mtext"]),
            eb = ne({}, ["annotation-xml"]),
            eh = ne({}, ["title", "style", "font", "a", "script"]),
            eT = null,
            ex = ["application/xhtml+xml", "text/html"],
            eC = null,
            eS = null,
            ew = l.createElement("form"),
            eN = function(e) {
                return e instanceof RegExp || e instanceof Function
            },
            eI = function() {
                let e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {};
                if (eS && eS === e) return;
                e && "object" == typeof e || (e = {}), e = nt(e), eC = "application/xhtml+xml" === (eT = -1 === ex.indexOf(e.PARSER_MEDIA_TYPE) ? "text/html" : e.PARSER_MEDIA_TYPE) ? aX : aY, L = a9(e, "ALLOWED_TAGS") && aK(e.ALLOWED_TAGS) ? ne({}, e.ALLOWED_TAGS, eC) : B, _ = a9(e, "ALLOWED_ATTR") && aK(e.ALLOWED_ATTR) ? ne({}, e.ALLOWED_ATTR, eC) : q, ey = a9(e, "ALLOWED_NAMESPACES") && aK(e.ALLOWED_NAMESPACES) ? ne({}, e.ALLOWED_NAMESPACES, aX) : eE, eu = a9(e, "ADD_URI_SAFE_ATTR") && aK(e.ADD_URI_SAFE_ATTR) ? ne(nt(ed), e.ADD_URI_SAFE_ATTR, eC) : ed, eo = a9(e, "ADD_DATA_URI_TAGS") && aK(e.ADD_DATA_URI_TAGS) ? ne(nt(es), e.ADD_DATA_URI_TAGS, eC) : es, er = a9(e, "FORBID_CONTENTS") && aK(e.FORBID_CONTENTS) ? ne({}, e.FORBID_CONTENTS, eC) : ei, P = a9(e, "FORBID_TAGS") && aK(e.FORBID_TAGS) ? ne({}, e.FORBID_TAGS, eC) : nt({}), U = a9(e, "FORBID_ATTR") && aK(e.FORBID_ATTR) ? ne({}, e.FORBID_ATTR, eC) : nt({}), el = !!a9(e, "USE_PROFILES") && (e.USE_PROFILES && "object" == typeof e.USE_PROFILES ? nt(e.USE_PROFILES) : e.USE_PROFILES), F = !1 !== e.ALLOW_ARIA_ATTR, Q = !1 !== e.ALLOW_DATA_ATTR, z = e.ALLOW_UNKNOWN_PROTOCOLS || !1, H = !1 !== e.ALLOW_SELF_CLOSE_IN_ATTR, V = e.SAFE_FOR_TEMPLATES || !1, W = !1 !== e.SAFE_FOR_XML, j = e.WHOLE_DOCUMENT || !1, X = e.RETURN_DOM || !1, J = e.RETURN_DOM_FRAGMENT || !1, $ = e.RETURN_TRUSTED_TYPE || !1, Y = e.FORCE_BODY || !1, Z = !1 !== e.SANITIZE_DOM, ee = e.SANITIZE_NAMED_PROPS || !1, ea = !1 !== e.KEEP_CONTENT, en = e.IN_PLACE || !1, D = ! function(e) {
                    try {
                        return a7(e, ""), !0
                    } catch (e) {
                        return !1
                    }
                }(e.ALLOWED_URI_REGEXP) ? nb : e.ALLOWED_URI_REGEXP, ef = "string" == typeof e.NAMESPACE ? e.NAMESPACE : ep, ev = a9(e, "MATHML_TEXT_INTEGRATION_POINTS") && e.MATHML_TEXT_INTEGRATION_POINTS && "object" == typeof e.MATHML_TEXT_INTEGRATION_POINTS ? nt(e.MATHML_TEXT_INTEGRATION_POINTS) : ne({}, ["mi", "mo", "mn", "ms", "mtext"]), eb = a9(e, "HTML_INTEGRATION_POINTS") && e.HTML_INTEGRATION_POINTS && "object" == typeof e.HTML_INTEGRATION_POINTS ? nt(e.HTML_INTEGRATION_POINTS) : ne({}, ["annotation-xml"]);
                let a = a9(e, "CUSTOM_ELEMENT_HANDLING") && e.CUSTOM_ELEMENT_HANDLING && "object" == typeof e.CUSTOM_ELEMENT_HANDLING ? nt(e.CUSTOM_ELEMENT_HANDLING) : aU(null);
                if (O = aU(null), a9(a, "tagNameCheck") && eN(a.tagNameCheck) && (O.tagNameCheck = a.tagNameCheck), a9(a, "attributeNameCheck") && eN(a.attributeNameCheck) && (O.attributeNameCheck = a.attributeNameCheck), a9(a, "allowCustomizedBuiltInElements") && "boolean" == typeof a.allowCustomizedBuiltInElements && (O.allowCustomizedBuiltInElements = a.allowCustomizedBuiltInElements), V && (Q = !1), J && (X = !0), el && (L = ne({}, nu), _ = aU(null), !0 === el.html && (ne(L, nn), ne(_, nd)), !0 === el.svg && (ne(L, nl), ne(_, nc), ne(_, np)), !0 === el.svgFilters && (ne(L, nr), ne(_, nc), ne(_, np)), !0 === el.mathMl && (ne(L, no), ne(_, nm), ne(_, np))), G.tagCheck = null, G.attributeCheck = null, a9(e, "ADD_TAGS") && ("function" == typeof e.ADD_TAGS ? G.tagCheck = e.ADD_TAGS : aK(e.ADD_TAGS) && (L === B && (L = nt(L)), ne(L, e.ADD_TAGS, eC))), a9(e, "ADD_ATTR") && ("function" == typeof e.ADD_ATTR ? G.attributeCheck = e.ADD_ATTR : aK(e.ADD_ATTR) && (_ === q && (_ = nt(_)), ne(_, e.ADD_ATTR, eC))), a9(e, "ADD_URI_SAFE_ATTR") && aK(e.ADD_URI_SAFE_ATTR) && ne(eu, e.ADD_URI_SAFE_ATTR, eC), a9(e, "FORBID_CONTENTS") && aK(e.FORBID_CONTENTS) && (er === ei && (er = nt(er)), ne(er, e.FORBID_CONTENTS, eC)), a9(e, "ADD_FORBID_CONTENTS") && aK(e.ADD_FORBID_CONTENTS) && (er === ei && (er = nt(er)), ne(er, e.ADD_FORBID_CONTENTS, eC)), ea && (L["#text"] = !0), j && ne(L, ["html", "head", "body"]), L.table && (ne(L, ["tbody"]), delete P.tbody), e.TRUSTED_TYPES_POLICY) {
                    if ("function" != typeof e.TRUSTED_TYPES_POLICY.createHTML) throw a6('TRUSTED_TYPES_POLICY configuration option must provide a "createHTML" hook.');
                    if ("function" != typeof e.TRUSTED_TYPES_POLICY.createScriptURL) throw a6('TRUSTED_TYPES_POLICY configuration option must provide a "createScriptURL" hook.');
                    S = (t = e.TRUSTED_TYPES_POLICY).createHTML("")
                } else void 0 === t && (t = nS(y, i)), null !== t && "string" == typeof S && (S = t.createHTML(""));
                aO && aO(e), eS = e
            },
            eA = ne({}, [...nl, ...nr, ...ni]),
            eR = ne({}, [...no, ...ns]),
            ek = function(e) {
                let t = x(e);
                t && t.tagName || (t = {
                    namespaceURI: ef,
                    tagName: "template"
                });
                let a = aY(e.tagName),
                    n = aY(t.tagName);
                return !!ey[e.namespaceURI] && (e.namespaceURI === em ? t.namespaceURI === ep ? "svg" === a : t.namespaceURI === ec ? "svg" === a && ("annotation-xml" === n || ev[n]) : !!eA[a] : e.namespaceURI === ec ? t.namespaceURI === ep ? "math" === a : t.namespaceURI === em ? "math" === a && eb[n] : !!eR[a] : e.namespaceURI === ep ? (t.namespaceURI !== em || !!eb[n]) && (t.namespaceURI !== ec || !!ev[n]) && !eR[a] && (eh[a] || !eA[a]) : "application/xhtml+xml" === eT && !!ey[e.namespaceURI])
            },
            eM = function(e) {
                aW(n.removed, {
                    element: e
                });
                try {
                    x(e).removeChild(e)
                } catch (t) {
                    b(e)
                }
            },
            eD = function(e, t) {
                try {
                    aW(n.removed, {
                        attribute: t.getAttributeNode(e),
                        from: t
                    })
                } catch (e) {
                    aW(n.removed, {
                        attribute: null,
                        from: t
                    })
                }
                if (t.removeAttribute(e), "is" === e)
                    if (X || J) try {
                        eM(t)
                    } catch (e) {} else try {
                        t.setAttribute(e, "")
                    } catch (e) {}
            },
            eL = function(e) {
                let a = null,
                    n = null;
                if (Y) e = "<remove></remove>" + e;
                else {
                    let t = aJ(e, /^[\r\n\t ]+/);
                    n = t && t[0]
                }
                "application/xhtml+xml" === eT && ef === ep && (e = '<html xmlns="http://www.w3.org/1999/xhtml"><head></head><body>' + e + "</body></html>");
                let r = t ? t.createHTML(e) : e;
                if (ef === ep) try {
                    a = new g().parseFromString(r, eT)
                } catch (e) {}
                if (!a || !a.documentElement) {
                    a = N.createDocument(ef, "template", null);
                    try {
                        a.documentElement.innerHTML = eg ? S : r
                    } catch (e) {}
                }
                let i = a.body || a.documentElement;
                return (e && n && i.insertBefore(l.createTextNode(n), i.childNodes[0] || null), ef === ep) ? R.call(a, j ? "html" : "body")[0] : j ? a.documentElement : i
            },
            eB = function(e) {
                return I.call(e.ownerDocument || e, e, c.SHOW_ELEMENT | c.SHOW_COMMENT | c.SHOW_TEXT | c.SHOW_PROCESSING_INSTRUCTION | c.SHOW_CDATA_SECTION, null)
            },
            e_ = function(e) {
                e.normalize();
                let t = I.call(e.ownerDocument || e, e, c.SHOW_TEXT | c.SHOW_COMMENT | c.SHOW_CDATA_SECTION | c.SHOW_PROCESSING_INSTRUCTION, null),
                    a = t.nextNode();
                for (; a;) {
                    let e = a.data;
                    az([nf, ng, ny], t => {
                        e = a$(e, t, " ")
                    }), a.data = e, a = t.nextNode()
                }
            },
            eq = function(e) {
                return e instanceof f && ("string" != typeof e.nodeName || "string" != typeof e.textContent || "function" != typeof e.removeChild || !(e.attributes instanceof p) || "function" != typeof e.removeAttribute || "function" != typeof e.setAttribute || "string" != typeof e.namespaceURI || "function" != typeof e.insertBefore || "function" != typeof e.hasChildNodes)
            },
            eO = function(e) {
                if (!C || "object" != typeof e || null === e) return !1;
                try {
                    return "number" == typeof C(e)
                } catch (e) {
                    return !1
                }
            };

        function eP(e, t, a) {
            az(e, e => {
                e.call(n, t, a, eS)
            })
        }
        let eU = function(e) {
                let t = null;
                if (eP(M.beforeSanitizeElements, e, null), eq(e)) return eM(e), !0;
                let a = eC(e.nodeName);
                if (eP(M.uponSanitizeElement, e, {
                        tagName: a,
                        allowedTags: L
                    }), W && e.hasChildNodes() && !eO(e.firstElementChild) && a7(/<[/\w!]/g, e.innerHTML) && a7(/<[/\w!]/g, e.textContent) || W && e.namespaceURI === ep && "style" === a && eO(e.firstElementChild) || 7 === e.nodeType || W && 8 === e.nodeType && a7(/<[/\w]/g, e.data)) return eM(e), !0;
                if (P[a] || !(G.tagCheck instanceof Function && G.tagCheck(a)) && !L[a]) {
                    if (!P[a] && eQ(a) && (O.tagNameCheck instanceof RegExp && a7(O.tagNameCheck, a) || O.tagNameCheck instanceof Function && O.tagNameCheck(a))) return !1;
                    if (ea && !er[a]) {
                        let t = x(e) || e.parentNode,
                            a = T(e) || e.childNodes;
                        if (a && t) {
                            let n = a.length;
                            for (let l = n - 1; l >= 0; --l) {
                                let n = v(a[l], !0);
                                t.insertBefore(n, h(e))
                            }
                        }
                    }
                    return eM(e), !0
                }
                return e instanceof d && !ek(e) || ("noscript" === a || "noembed" === a || "noframes" === a) && a7(/<\/no(script|embed|frames)/i, e.innerHTML) ? (eM(e), !0) : (V && 3 === e.nodeType && (t = e.textContent, az([nf, ng, ny], e => {
                    t = a$(t, e, " ")
                }), e.textContent !== t && (aW(n.removed, {
                    element: e.cloneNode()
                }), e.textContent = t)), eP(M.afterSanitizeElements, e, null), !1)
            },
            eG = function(e, t, a) {
                if (U[t] || Z && ("id" === t || "name" === t) && (a in l || a in ew)) return !1;
                let n = _[t] || G.attributeCheck instanceof Function && G.attributeCheck(t, e);
                if (Q && !U[t] && a7(nE, t));
                else if (F && a7(nv, t));
                else if (!n || U[t]) {
                    if (!(eQ(e) && (O.tagNameCheck instanceof RegExp && a7(O.tagNameCheck, e) || O.tagNameCheck instanceof Function && O.tagNameCheck(e)) && (O.attributeNameCheck instanceof RegExp && a7(O.attributeNameCheck, t) || O.attributeNameCheck instanceof Function && O.attributeNameCheck(t, e)) || "is" === t && O.allowCustomizedBuiltInElements && (O.tagNameCheck instanceof RegExp && a7(O.tagNameCheck, a) || O.tagNameCheck instanceof Function && O.tagNameCheck(a)))) return !1
                } else if (eu[t]);
                else if (a7(D, a$(a, nT, "")));
                else if (("src" === t || "xlink:href" === t || "href" === t) && "script" !== e && 0 === aZ(a, "data:") && eo[e]);
                else if (z && !a7(nh, a$(a, nT, "")));
                else if (a) return !1;
                return !0
            },
            eF = ne({}, ["annotation-xml", "color-profile", "font-face", "font-face-format", "font-face-name", "font-face-src", "font-face-uri", "missing-glyph"]),
            eQ = function(e) {
                return !eF[aY(e)] && a7(nC, e)
            },
            ez = function(e) {
                eP(M.beforeSanitizeAttributes, e, null);
                let a = e.attributes;
                if (!a || eq(e)) return;
                let l = {
                        attrName: "",
                        attrValue: "",
                        keepAttr: !0,
                        allowedAttributes: _,
                        forceKeepAttr: void 0
                    },
                    r = a.length;
                for (; r--;) {
                    let i = a[r],
                        o = i.name,
                        s = i.namespaceURI,
                        u = i.value,
                        d = eC(o),
                        c = "value" === o ? u : a0(u);
                    if (l.attrName = d, l.attrValue = c, l.keepAttr = !0, l.forceKeepAttr = void 0, eP(M.uponSanitizeAttribute, e, l), c = l.attrValue, ee && ("id" === d || "name" === d) && 0 !== aZ(c, et) && (eD(o, e), c = et + c), W && a7(/((--!?|])>)|<\/(style|script|title|xmp|textarea|noscript|iframe|noembed|noframes)/i, c) || "attributename" === d && aJ(c, "href")) {
                        eD(o, e);
                        continue
                    }
                    if (l.forceKeepAttr) continue;
                    if (!l.keepAttr || !H && a7(/\/>/i, c)) {
                        eD(o, e);
                        continue
                    }
                    V && az([nf, ng, ny], e => {
                        c = a$(c, e, " ")
                    });
                    let m = eC(e.nodeName);
                    if (!eG(m, d, c)) {
                        eD(o, e);
                        continue
                    }
                    if (t && "object" == typeof y && "function" == typeof y.getAttributeType)
                        if (s);
                        else switch (y.getAttributeType(m, d)) {
                            case "TrustedHTML":
                                c = t.createHTML(c);
                                break;
                            case "TrustedScriptURL":
                                c = t.createScriptURL(c)
                        }
                    if (c !== u) try {
                        s ? e.setAttributeNS(s, o, c) : e.setAttribute(o, c), eq(e) ? eM(e) : aV(n.removed)
                    } catch (t) {
                        eD(o, e)
                    }
                }
                eP(M.afterSanitizeAttributes, e, null)
            },
            eH = function(e) {
                let t = null,
                    a = eB(e);
                for (eP(M.beforeSanitizeShadowDOM, e, null); t = a.nextNode();) eP(M.uponSanitizeShadowNode, t, null), eU(t), ez(t), t.content instanceof o && eH(t.content);
                eP(M.afterSanitizeShadowDOM, e, null)
            },
            eV = function(e) {
                if (1 === e.nodeType && e.shadowRoot instanceof o) {
                    let t = e.shadowRoot;
                    eV(t), eH(t)
                }
                let t = e.childNodes;
                if (!t) return;
                let a = [];
                for (let e of (az(t, e => {
                        aW(a, e)
                    }), a)) eV(e)
            };
        return n.sanitize = function(e) {
            let a = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {},
                l = null,
                i = null,
                s = null,
                u = null;
            if ((eg = !e) && (e = "<!-->"), "string" != typeof e && !eO(e) && "string" != typeof(e = function(e) {
                    switch (typeof e) {
                        case "string":
                            return e;
                        case "number":
                            return a1(e);
                        case "boolean":
                            return a2(e);
                        case "bigint":
                            return a4 ? a4(e) : "0";
                        case "symbol":
                            return a3 ? a3(e) : "Symbol()";
                        case "undefined":
                        default:
                            return a8(e);
                        case "function":
                        case "object": {
                            if (null === e) return a8(e);
                            let t = na(e, "toString");
                            if ("function" == typeof t) {
                                let a = t(e);
                                return "string" == typeof a ? a : a8(a)
                            }
                            return a8(e)
                        }
                    }
                }(e))) throw a6("dirty is not a string, aborting");
            if (!n.isSupported) return e;
            if (K || eI(a), n.removed = [], "string" == typeof e && (en = !1), en) {
                let t = e.nodeName;
                if ("string" == typeof t) {
                    let e = eC(t);
                    if (!L[e] || P[e]) throw a6("root node is forbidden and cannot be sanitized in-place")
                }
                eV(e)
            } else if (eO(e)) 1 === (i = (l = eL("<!---->")).ownerDocument.importNode(e, !0)).nodeType && "BODY" === i.nodeName || "HTML" === i.nodeName ? l = i : l.appendChild(i), eV(i);
            else {
                if (!X && !V && !j && -1 === e.indexOf("<")) return t && $ ? t.createHTML(e) : e;
                if (!(l = eL(e))) return X ? null : $ ? S : ""
            }
            l && Y && eM(l.firstChild);
            let d = eB(en ? e : l);
            for (; s = d.nextNode();) eU(s), ez(s), s.content instanceof o && eH(s.content);
            if (en) return V && e_(e), e;
            if (X) {
                if (V && e_(l), J)
                    for (u = A.call(l.ownerDocument); l.firstChild;) u.appendChild(l.firstChild);
                else u = l;
                return (_.shadowroot || _.shadowrootmode) && (u = k.call(r, u, !0)), u
            }
            let c = j ? l.outerHTML : l.innerHTML;
            return j && L["!doctype"] && l.ownerDocument && l.ownerDocument.doctype && l.ownerDocument.doctype.name && a7(nx, l.ownerDocument.doctype.name) && (c = "<!DOCTYPE " + l.ownerDocument.doctype.name + ">\n" + c), V && az([nf, ng, ny], e => {
                c = a$(c, e, " ")
            }), t && $ ? t.createHTML(c) : c
        }, n.setConfig = function() {
            let e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {};
            eI(e), K = !0
        }, n.clearConfig = function() {
            eS = null, K = !1
        }, n.isValidAttribute = function(e, t, a) {
            return eS || eI({}), eG(eC(e), eC(t), a)
        }, n.addHook = function(e, t) {
            "function" == typeof t && aW(M[e], t)
        }, n.removeHook = function(e, t) {
            if (void 0 !== t) {
                let a = aH(M[e], t);
                return -1 === a ? void 0 : aj(M[e], a, 1)[0]
            }
            return aV(M[e])
        }, n.removeHooks = function(e) {
            M[e] = []
        }, n.removeAllHooks = function() {
            M = nw()
        }, n
    }();
    let nI = null;
    var nA = (0, i.withTranslation)(e => {
            let {
                events: t,
                initialSelectedEvent: a,
                onSelectedEventChange: n
            } = e, {
                translate: l
            } = (0, i.useTranslation)(), {
                locale: o
            } = (0, i.useLocalization)(), [s, u] = (0, r.useState)(null), d = e => {
                let t = new Date(e);
                return Number.isNaN(t.getTime()) ? e : new Intl.DateTimeFormat(null != o ? o : void 0, {
                    dateStyle: "medium",
                    timeStyle: "short"
                }).format(t)
            }, c = e => {
                u(e), null == n || n(e)
            };
            return ((0, r.useEffect)(() => {
                a && (u(a), null == n || n(a))
            }, [a]), t && 0 !== t.length) ? r.default.createElement(r.default.Fragment, null, r.default.createElement(ei.Timeline, null, t.map(e => r.default.createElement(ei.TimelineItem, {
                key: e.id,
                title: e.title,
                description: d(e.createTime),
                link: e.details ? r.default.createElement("span", {
                    role: "button",
                    tabIndex: 0,
                    className: "text-body-medium content-link cursor-pointer",
                    onClick: () => c(e),
                    onKeyDown: t => {
                        ("Enter" === t.key || " " === t.key) && c(e)
                    }
                }, "View") : void 0
            }))), r.default.createElement(Y.Dialog, {
                open: null !== s,
                onOpenChange: e => {
                    e || c(null)
                },
                size: "Large",
                isModal: !0,
                hasCloseAffordance: !0,
                closeLabel: "Close"
            }, r.default.createElement(Y.DialogContent, null, r.default.createElement(Y.DialogBody, {
                className: "flex flex-col gap-y-xsmall scroll-y max-height-[70vh]"
            }, r.default.createElement(Y.DialogTitle, {
                className: "text-heading-small margin-none"
            }, null == s ? void 0 : s.title), r.default.createElement("div", {
                className: "flex flex-col gap-y-xxlarge"
            }, r.default.createElement("div", {
                className: "flex flex-col"
            }, r.default.createElement("span", {
                className: "text-title-large"
            }, "Date"), r.default.createElement("span", {
                className: "text-body-large"
            }, s ? d(s.createTime) : "")), (null == s ? void 0 : s.details) && r.default.createElement("div", {
                className: "flex flex-col"
            }, r.default.createElement("span", {
                className: "text-title-large"
            }, "Details"), r.default.createElement("div", {
                className: "text-body-large",
                dangerouslySetInnerHTML: {
                    __html: (!nI && (nI = nN(window)).addHook("afterSanitizeAttributes", e => {
                        "a" === e.tagName.toLowerCase() && (e.setAttribute("target", "_blank"), e.setAttribute("rel", "noopener noreferrer"))
                    }), nI).sanitize(s.details, {
                        ALLOWED_TAGS: ["b", "i", "u", "s", "br", "p", "ol", "li", "strong", "a", "em"],
                        ALLOWED_ATTR: ["href", "target", "rel"]
                    })
                }
            })))), r.default.createElement(Y.DialogFooter, {
                className: "flex gap-x-small"
            }, r.default.createElement(et.Button, {
                variant: "Standard",
                size: "Medium",
                className: "fill basis-0",
                onClick: () => c(null)
            }, "Close"))))) : r.default.createElement("div", {
                className: "flex flex-col items-center justify-center padding-xlarge"
            }, r.default.createElement("span", {
                className: "text-body-medium content-muted"
            }, l("Description.NoActivity")))
        }, [eA.Navigation, eA.DeveloperQuestionnaire, eA.Error]),
        nR = (0, i.withTranslation)(e => {
            let {
                universeId: t,
                onStartQuestionnaire: a,
                showSubmissionSuccessAlert: n,
                onDismissSubmissionSuccessAlert: l,
                isOverEighteenQuestionnaire: s
            } = e, {
                translate: u,
                translateHTML: d
            } = (0, i.useTranslation)(), {
                locale: c
            } = (0, i.useLocalization)(), m = (0, o.useRouter)(), [p, f] = (0, r.useState)("ratings"), [g, y] = (0, r.useState)(!0), [E, v] = (0, r.useState)(!0), [b, h] = (0, r.useState)(!1), T = (0, r.useRef)(!1), [x, C] = (0, r.useState)(null), S = "string" == typeof m.query.activityLogId ? m.query.activityLogId : void 0, {
                data: w = []
            } = (0, V.useQuery)({
                queryKey: ["iarcActivityService", "listIarcActivities", t],
                queryFn: async () => {
                    var e, a;
                    try {
                        return (null != (e = (await tz().v1UniversesUniverseIdIarcActivitiesGet({
                            universeId: t,
                            pageSize: void 0,
                            pageToken: void 0
                        })).iarcActivities) ? e : []).map((e, t) => {
                            var a, n;
                            let l;
                            return {
                                id: "".concat(e.universeId, "-").concat(t),
                                type: t4(e.type),
                                title: t2(e.type),
                                details: null != (a = e.details) ? a : "",
                                createTime: null != (n = e.createTime) ? n : "",
                                user: (l = e.type, "IARC_ACTIVITY_TYPE_QUESTIONNAIRE_SUBMITTED" !== l) ? "System" : "You"
                            }
                        })
                    } catch (e) {
                        if (404 === (null == (a = tP(e)) ? void 0 : a.status)) return [];
                        throw e
                    }
                },
                retry: tV
            }), {
                data: N
            } = (0, V.useQuery)({
                queryKey: ["iarcActivityService", "getIarcActivity", t, S],
                queryFn: void 0 === S ? W.skipToken : async () => {
                    var e, a, n;
                    try {
                        let n, l = (await tz().v1UniversesUniverseIdIarcActivitiesIdGet({
                            universeId: t,
                            id: S
                        })).iarcActivity;
                        if (!l) return null;
                        return {
                            id: S,
                            type: t4(l.type),
                            title: t2(l.type),
                            details: null != (e = l.details) ? e : "",
                            createTime: null != (a = l.createTime) ? a : "",
                            user: (n = l.type, "IARC_ACTIVITY_TYPE_QUESTIONNAIRE_SUBMITTED" !== n) ? "System" : "You"
                        }
                    } catch (e) {
                        if (404 === (null == (n = tP(e)) ? void 0 : n.status)) return null;
                        throw e
                    }
                },
                retry: tV
            });
            (0, r.useEffect)(() => {
                !T.current && S && N && (T.current = !0, f("activity"), C(N))
            }, [S, N]);
            let I = (0, r.useCallback)(async e => {
                    let {
                        activityLogId: t,
                        ...a
                    } = m.query;
                    await m.replace({
                        pathname: m.pathname,
                        query: e ? {
                            ...a,
                            activityLogId: e.id
                        } : a
                    }, void 0, {
                        shallow: !0
                    })
                }, [m]),
                {
                    data: A
                } = tZ(t),
                {
                    data: R
                } = t1(t),
                {
                    data: k,
                    isLoading: M
                } = t0(t),
                {
                    ratingsStatus: D,
                    nonCompliantRegionStatus: L
                } = (0, r.useMemo)(() => {
                    var e;
                    let t = null == k ? void 0 : k.statuses;
                    if (!t || 0 === t.length) return {
                        ratingsStatus: "NotStarted",
                        nonCompliantRegionStatus: "NotStarted"
                    };
                    let a = null == (e = t[0].externalState) ? void 0 : e.toLowerCase(),
                        n = "NotStarted";
                    return "assigned" === a ? n = "Assigned" : "pending" === a ? n = "Pending" : "rejected" === a && (n = "Rejected"), {
                        ratingsStatus: n,
                        nonCompliantRegionStatus: n
                    }
                }, [k]),
                B = (null == R ? void 0 : R.status) === em.MetadataStatus.Incomplete,
                _ = null == A ? void 0 : A.moderation,
                q = (null == _ ? void 0 : _.moderationStatus) === ef.V2Beta1ModerationStatus.Rejected;
            return r.default.createElement("div", {
                className: "flex flex-col gap-xxlarge"
            }, n && r.default.createElement(er.FeedbackBanner, {
                title: u("Alert.QuestionnaireSubmittedTitle"),
                description: u("Alert.QuestionnaireSubmittedResponse"),
                layout: "Inline",
                variant: "Standard",
                severity: "Success",
                onDismiss: l
            }), g && r.default.createElement(er.FeedbackBanner, {
                title: "",
                description: u("Description.IARCQuestionnaireOverviewBannerMarch"),
                layout: "Inline",
                variant: "Emphasis",
                severity: "Info",
                primaryActionLabel: u("Action.ViewDetails"),
                onPrimaryAction: () => window.open("https://create.roblox.com/docs/production/publishing/content-ratings", "_blank"),
                onDismiss: () => y(!1)
            }), q && E && r.default.createElement(er.FeedbackBanner, {
                title: "",
                description: (null == A ? void 0 : A.submitBy) ? u("Description.ModerationBannerWillBeUnrated", {
                    moderationGracePeriodEnd: new Intl.DateTimeFormat(null != c ? c : void 0, {
                        dateStyle: "medium",
                        timeStyle: "short"
                    }).format(new Date(A.submitBy))
                }) : u("Description.ModerationBannerUnrated"),
                layout: "Inline",
                variant: "Emphasis",
                severity: "Warning",
                primaryActionLabel: u("Action.LearnMore"),
                onPrimaryAction: () => window.open("https://create.roblox.com/docs/production/publishing/content-ratings", "_blank"),
                onDismiss: () => v(!1)
            }), B && r.default.createElement(eo.SystemBanner, {
                title: u("Alert.QuestionnaireMetadataIncompleteTitle"),
                description: u("Alert.QuestionnaireMetadataIncompleteMessage"),
                variant: "Standard",
                severity: "Warning",
                primaryActionLabel: u("Action.AddNow"),
                onPrimaryAction: () => window.open("/dashboard/creations/experiences/".concat(t, "/configure"), "_blank")
            }), r.default.createElement("h1", {
                className: "text-heading-large margin-none"
            }, u("Heading.MaturityAndComplianceQuestionnaireV2")), r.default.createElement("div", null, r.default.createElement("span", {
                className: "text-body-medium"
            }, d("Description.IARCQuestionnaireOverviewMarch", [{
                opening: "maturityRatingLinkStart",
                closing: "maturityRatingLinkEnd",
                content: e => r.default.createElement(aS, {
                    href: "https://create.roblox.com/docs/production/publishing/content-ratings",
                    target: "_blank"
                }, e)
            }]))), r.default.createElement("div", {
                className: "flex gap-small items-center"
            }, r.default.createElement(et.Button, {
                onClick: a,
                size: "Medium",
                variant: "Emphasis",
                isDisabled: B,
                isLoading: M
            }, u("NotStarted" === D ? "Action.GetRating" : "Action.GetANewRating")), q && r.default.createElement(et.Button, {
                onClick: () => h(!0),
                size: "Medium",
                variant: "Standard"
            }, u("Action.ReviewModeratorFeedback"))), q && _ && r.default.createElement(aN, {
                open: b,
                onClose: () => h(!1),
                moderation: _
            }), r.default.createElement(X.Tabs, {
                value: p,
                onValueChange: f,
                size: "Large",
                variant: "Contained",
                fitBehavior: "Fit"
            }, r.default.createElement(X.TabsList, null, r.default.createElement(X.TabsTrigger, {
                value: "ratings"
            }, u("Tab.Ratings")), r.default.createElement(X.TabsTrigger, {
                value: "activity"
            }, u("Tab.Activity"))), r.default.createElement(X.TabsContent, {
                value: "ratings"
            }, r.default.createElement(ak, {
                ratingsStatus: D,
                nonCompliantRegionStatus: L,
                detailedGuidelines: null != A ? A : void 0,
                isOverEighteenQuestionnaire: s
            })), r.default.createElement(X.TabsContent, {
                value: "activity"
            }, r.default.createElement(nA, {
                events: w,
                initialSelectedEvent: x,
                onSelectedEventChange: I
            }))))
        }, [eA.Navigation, eA.DeveloperQuestionnaire, eA.Error]);

    function nk(e, t) {
        return new Set(e.filter(e => t.some(t => (function e(t, a) {
            return t.some(t => {
                var n;
                return t.id === a || (null != (n = t.options) ? n : []).some(t => {
                    var n;
                    return t.childQuestions && e(t.childQuestions, a) || (null != (n = t.childSections) ? n : []).some(t => {
                        var n;
                        return e(null != (n = t.questions) ? n : [], a)
                    })
                })
            })
        })(e.questions, t))).map(e => e.id))
    }
    let nM = () => {};
    var nD = (0, i.withTranslation)(e => {
        var t;
        let {
            attemptId: a,
            entryPoint: n,
            universeId: l,
            onComplete: o,
            onBack: s,
            onCancel: u,
            onViolation: d,
            actionBarContainer: c
        } = e, m, p, {
            locale: g
        } = (0, i.useLocalization)(), {
            translate: y
        } = (0, i.useTranslation)(), {
            showToastNetworkError: E,
            showToastUserError: v
        } = tO(), [b, h] = (0, r.useState)({}), [T, x] = (0, r.useState)(!1), [C, S] = (0, r.useState)(null), [w, N] = (0, r.useState)([]), [I, A] = (0, r.useState)(new Set), {
            data: R
        } = tW(l), k = null == R ? void 0 : R.questionnaireId, {
            data: M,
            isLoading: D
        } = (m = async e => {
            if (!e) return null;
            let t = await tT().questionnairesApiV2.questionnairesGetAdditionalQuestionnaire({
                universeId: l,
                localeCode: g
            });
            return t.questionnaire ? tn(t.questionnaire) : null
        }, (0, V.useQuery)({
            queryKey: ["experienceQuestionnaireV2", "getAdditionalQuestionnaire", k, l],
            queryFn: void 0 === k ? W.skipToken : () => m(k),
            retry: tV
        })), L = null == M ? void 0 : M.id, B = ay({
            attemptId: a,
            entryPoint: n,
            locale: g,
            questionnaireId: L,
            universeId: l
        }), {
            data: _,
            isLoading: q,
            isFetching: O
        } = (p = async e => {
            var t, a;
            return e ? tt(null != (t = null == (a = (await tT().responsesApiV2.responsesGetActiveAdditionalResponse({
                universeId: l
            })).response) ? void 0 : a.answers) ? t : []) : []
        }, (0, V.useQuery)({
            queryKey: ["experienceQuestionnaireV2", "getAdditionalQuestionnaireAnswers", k, l],
            queryFn: void 0 === k ? W.skipToken : () => p(k),
            retry: tV,
            gcTime: 0,
            refetchOnMount: "always"
        })), {
            mutateAsync: P
        } = tX(l), {
            mutateAsync: U
        } = tJ(l);
        (0, r.useEffect)(() => {
            null === C && _ && N(_)
        }, [_, C]);
        let G = (0, r.useCallback)((e, t) => {
                if (N(t), S("unsaved"), b[e]) {
                    let {
                        [e]: t, ...a
                    } = b;
                    h(a)
                }
            }, [b]),
            Q = (0, r.useCallback)(async e => {
                if (!L) return v(eB, e_), !1;
                try {
                    return x(!0), await P({
                        questionnaireId: L,
                        answers: null != e ? e : w
                    }), S("saved"), !0
                } catch (e) {
                    return tU.handleNetworkRequestFailure(e, v, E), !1
                } finally {
                    x(!1)
                }
            }, [L, v, P, w, E]),
            z = (0, r.useCallback)(async () => {
                if (!L) return void v(eB, e_);
                try {
                    x(!0);
                    let a = await U({
                        questionnaireId: L,
                        answers: w
                    });
                    if (!1 === a.isValid) {
                        var e, t;
                        let n = (null != (e = a.failures) ? e : []).map(e => e.questionId).filter(e => !!e),
                            l = nk(null != (t = null == M ? void 0 : M.sections) ? t : [], n);
                        A(l), null == d || d(!0, l);
                        return
                    }
                    o(L)
                } catch (e) {
                    tU.handleNetworkRequestFailure(e, v, E)
                } finally {
                    x(!1)
                }
            }, [L, v, U, w, E, o, M, d]),
            H = (0, r.useMemo)(() => !!M && M.sections.every(e => eJ(e, w)), [M, w]),
            j = (0, r.useMemo)(() => M ? M.sections.filter(e => eJ(e, w)).length : 0, [M, w]),
            K = null != (t = null == M ? void 0 : M.sections.length) ? t : 0,
            Y = q || null === C && O;
        return D || Y || !M ? r.default.createElement(ar, null) : r.default.createElement(f.Grid, {
            container: !0,
            flexDirection: "column",
            gap: "var(--gap-xxlarge)"
        }, y("Progress.SectionsCompleted", {
            completed: j.toString(),
            total: K.toString()
        }), r.default.createElement(e3, {
            value: B
        }, r.default.createElement(tR, {
            questionnaire: M,
            answers: w,
            errors: b,
            isSaving: T,
            setAnswers: G,
            omitActionBar: !0,
            send: nM,
            save: Q,
            goToLanding: nM,
            violatedSectionIds: I
        })), c && (0, eT.createPortal)(r.default.createElement("div", {
            className: "flex justify-between items-center gap-medium padding-top-medium"
        }, r.default.createElement("div", {
            className: "flex items-center gap-medium"
        }, r.default.createElement(et.Button, {
            variant: "Utility",
            size: "Medium",
            onClick: u
        }, y("Button.Cancel")), T && r.default.createElement("span", {
            className: "text-body-small content-muted"
        }, y("Progress.Saving")), !T && "saved" === C && r.default.createElement("span", {
            className: "flex items-center gap-xsmall text-body-small content-muted"
        }, r.default.createElement(F.CheckIcon, {
            fontSize: "small"
        }), y("Label.Saved")), !T && "unsaved" === C && r.default.createElement("span", {
            className: "text-body-small content-muted"
        }, y("Label.UnsavedChanges"))), r.default.createElement("div", {
            className: "flex gap-small"
        }, r.default.createElement(et.Button, {
            variant: "Utility",
            size: "Medium",
            onClick: s
        }, y("Button.Back")), r.default.createElement(et.Button, {
            variant: "Emphasis",
            size: "Medium",
            onClick: z,
            isDisabled: !H || T,
            isLoading: T
        }, y("Button.Continue")))), c))
    }, [eA.Navigation, eA.DeveloperQuestionnaire, eA.Error]);
    let nL = e => {
            var t, a;
            let {
                open: n = !0,
                onClose: l,
                robloxGuidance: o,
                showViolationWarning: s = !1,
                onDismissWarning: u,
                actionBarContainer: d
            } = e, {
                translate: c,
                translateHTML: m
            } = (0, i.useTranslation)(), {
                parseText: p
            } = ek(), f = (0, Q.useMediaQuery)("(max-width: 600px)"), g = (0, r.useMemo)(() => p(o), [p, o]), y = (0, r.useMemo)(() => m("Description.GuidanceViolatingWarning", [{
                opening: "warningBoldStart",
                closing: "warningBoldEnd",
                content: e => r.default.createElement("b", null, e)
            }, {
                opening: "communityStandardsLinkStart",
                closing: "communityStandardsLinkEnd",
                content: e => r.default.createElement(aS, {
                    href: t3,
                    target: "_blank"
                }, e)
            }]), [m]), E = () => s ? r.default.createElement("div", {
                className: "flex flex-col fill items-center justify-center padding-x-xlarge gap-large"
            }, r.default.createElement("span", {
                className: "text-body-large content-default text-center"
            }, y), r.default.createElement(et.Button, {
                variant: "Standard",
                size: "Medium",
                onClick: u
            }, c("Action.Ok"))) : null, v = (0, r.useRef)(null), b = (0, r.useRef)(null);
            return ((0, r.useEffect)(() => {
                var e;
                if (f) return;
                let t = null == (e = v.current) ? void 0 : e.lastElementChild;
                t && (t.scrollTop = 0)
            }, [o, f]), (0, r.useEffect)(() => {
                let e = v.current,
                    t = b.current;
                if (!e || !t || f) return;
                let a = function(e) {
                        let t = e.parentElement;
                        for (; t;) {
                            let {
                                overflowY: e
                            } = window.getComputedStyle(t);
                            if ("auto" === e || "scroll" === e) return t;
                            t = t.parentElement
                        }
                        return null
                    }(t),
                    n = 0,
                    l = () => {
                        var n;
                        let l = null != (n = null == a ? void 0 : a.getBoundingClientRect().top) ? n : 0,
                            r = d ? d.getBoundingClientRect().top : window.innerHeight,
                            i = t.getBoundingClientRect();
                        e.style.top = "".concat(Math.max(l, 0), "px"), e.style.bottom = "".concat(Math.max(window.innerHeight - r, 0), "px"), e.style.left = "".concat(i.left, "px"), e.style.width = "".concat(i.width, "px")
                    },
                    r = () => {
                        cancelAnimationFrame(n), n = requestAnimationFrame(l)
                    };
                l();
                let i = new ResizeObserver(r);
                a && i.observe(a), d && i.observe(d);
                let o = null == d ? void 0 : d.parentElement;
                return o && i.observe(o), a && a.addEventListener("scroll", r, {
                    passive: !0
                }), window.addEventListener("resize", r, {
                    passive: !0
                }), () => {
                    cancelAnimationFrame(n), i.disconnect(), a && a.removeEventListener("scroll", r), window.removeEventListener("resize", r)
                }
            }, [f, d, o, s]), f) ? r.default.createElement(es.SheetRoot, {
                open: n,
                onOpenChange: e => {
                    e || l()
                }
            }, r.default.createElement(es.SheetContent, {
                closeLabel: "Close guidance panel",
                "aria-describedby": void 0
            }, r.default.createElement(es.SheetTitle, null, c("Label.RobloxGuidance")), r.default.createElement(es.SheetBody, {
                className: "flex flex-col gap-xlarge padding-bottom-xlarge fill"
            }, null != (t = E()) ? t : g))) : r.default.createElement(r.default.Fragment, null, r.default.createElement("div", {
                ref: b,
                className: "shrink-0 width-[360px] min-width-[320px]"
            }), r.default.createElement("div", {
                ref: v,
                className: "fixed flex flex-col bg-surface-100 radius-large clip",
                style: {
                    zIndex: 20
                }
            }, r.default.createElement("div", {
                className: "flex items-center justify-between padding-x-xlarge padding-y-small shrink-0"
            }, r.default.createElement("span", {
                className: "text-heading-small content-emphasis"
            }, c("Label.RobloxGuidance")), r.default.createElement(eu.IconButton, {
                icon: "icon-regular-x-small",
                ariaLabel: "Close guidance panel",
                variant: "Utility",
                size: "Large",
                onClick: l
            })), r.default.createElement("div", {
                className: "flex flex-col gap-xlarge padding-x-xlarge padding-bottom-xlarge scroll-y fill min-height-0",
                style: {
                    overscrollBehaviorY: "contain"
                }
            }, null != (a = E()) ? a : g)))
        },
        nB = e => {
            let {
                onClick: t
            } = e, {
                translate: a
            } = (0, i.useTranslation)();
            return r.default.createElement(ed.Tooltip, {
                position: "left-center",
                title: a("Label.ViewGuidance"),
                delayDurationMs: 200
            }, r.default.createElement(ed.TooltipTrigger, {
                asChild: !0
            }, r.default.createElement(eu.IconButton, {
                className: "bg-surface-100",
                icon: "icon-regular-book-open",
                ariaLabel: "Open Roblox guidance",
                variant: "Standard",
                size: "Large",
                isCircular: !0,
                onClick: t
            })))
        },
        n_ = e => {
            let {
                onClick: t,
                actionBarContainer: a
            } = e, n = (0, Q.useMediaQuery)("(max-width: 600px)"), [l, i] = (0, r.useState)(0);
            return ((0, r.useEffect)(() => {
                if (!a) return;
                let e = () => i(a.offsetHeight);
                e();
                let t = new ResizeObserver(e);
                return t.observe(a), () => t.disconnect()
            }, [a]), n) ? r.default.createElement("div", {
                className: "fixed right-[24px]",
                style: {
                    zIndex: 1e3,
                    bottom: l + 24
                }
            }, r.default.createElement(nB, {
                onClick: t
            })) : r.default.createElement("div", {
                className: "shrink-0 flex flex-col radius-large",
                style: {
                    marginTop: -48,
                    alignSelf: "stretch"
                }
            }, r.default.createElement("div", {
                className: "sticky flex items-center justify-center",
                style: {
                    bottom: l + 16,
                    marginTop: "auto"
                }
            }, r.default.createElement(nB, {
                onClick: t
            })))
        },
        nq = () => {},
        nO = e => {
            let t = JSON.parse(e);
            return "string" == typeof t ? [t] : Array.isArray(t) ? t.filter(e => "string" == typeof e) : []
        };
    var nP = (0, i.withTranslation)(e => {
        var t, a, n, l, o, s, u, d;
        let {
            attemptId: c,
            entryPoint: m,
            universeId: p,
            activeStep: g,
            onNext: y,
            onBack: E,
            onCancel: v,
            onComplete: b,
            onActiveSectionChange: h,
            onViolation: T,
            actionBarContainer: x
        } = e, {
            translate: C
        } = (0, i.useTranslation)(), {
            showToastNetworkError: S,
            showToastUserError: w
        } = tO(), [N, I] = (0, r.useState)({}), [A, R] = (0, r.useState)(!1), [k, M] = (0, r.useState)(null), [D, L] = (0, r.useState)([]), [B, _] = (0, r.useState)(new Set), {
            locale: q
        } = (0, i.useLocalization)(), O = aE(q), {
            data: P
        } = tW(p), U = null == P ? void 0 : P.questionnaireId, G = ay({
            attemptId: c,
            entryPoint: m,
            locale: q,
            questionnaireId: U,
            universeId: p
        }), {
            data: Q,
            isLoading: z
        } = tj(U, O), {
            data: H,
            isLoading: V,
            isFetching: W
        } = tK(p), {
            mutateAsync: j
        } = tX(p), {
            mutateAsync: K
        } = tJ(p), {
            traverseQuestionsForQuestionIds: Y,
            traverseSectionsForQuestionIds: X
        } = tc(), J = (null != (t = null == Q || null == (n = Q.sections) ? void 0 : n.length) ? t : 0) === 1, $ = J && 0 === g, Z = J ? 1 === g : 0 === g, ee = J ? null == Q || null == (s = Q.sections) || null == (o = s[0]) || null == (l = o.questions) ? void 0 : l[0] : null, ea = null == Q || null == (d = Q.sections) || null == (u = d[0]) ? void 0 : u.id, en = (0, r.useCallback)(e => {
            var t;
            ea && (null == (t = G.onSectionViewed) || t.call(G, ea, e))
        }, [ea, G]);
        e8($ && !!ea, en);
        let el = (0, r.useCallback)(e => {
            var t;
            ee && (null == (t = G.onQuestionViewed) || t.call(G, ee.id, e))
        }, [ee, G]);
        e8($ && !!ee, el);
        let er = (0, r.useMemo)(() => {
                var e;
                if (!ee || !("options" in ee)) return null != ee ? ee : null;
                let t = (null != (e = ee.options) ? e : []).map(e => ({
                    ...e,
                    childSections: [],
                    childQuestions: []
                }));
                return {
                    ...ee,
                    options: t
                }
            }, [ee]),
            ei = (0, r.useMemo)(() => {
                var e;
                if (!ee) return null;
                let t = D.find(e => e.questionId === ee.id);
                return t && null != (e = nO(t.value)[0]) ? e : null
            }, [ee, D]),
            eo = (0, r.useMemo)(() => {
                var e;
                let t;
                if (!J || !ee || !("options" in ee)) return null;
                let a = ee.options.find(e => e.id === ei);
                return (null == a ? void 0 : a.childSections) ? (e = a.childSections, t = [], e.forEach(e => {
                    var a, n;
                    e.id && e.name && e.questions && t.push({
                        id: e.id,
                        name: e.name,
                        description: null != (a = e.description) ? a : null,
                        questions: ta(e.questions),
                        metadata: null != (n = e.metadata) ? n : {}
                    })
                }), t) : null
            }, [ee, ei, J]),
            es = (0, r.useMemo)(() => {
                if (!Q) return null;
                if (!J) return Q;
                let e = Q.sections.slice(1),
                    t = null != eo ? eo : e;
                return {
                    ...Q,
                    sections: t
                }
            }, [Q, eo, J]);
        (0, r.useEffect)(() => {
            null === k && H && L(H)
        }, [H, k]);
        let eu = (0, r.useCallback)((e, t) => {
                if (L(t), M("unsaved"), N[e]) {
                    let {
                        [e]: t, ...a
                    } = N;
                    I(a)
                }
            }, [N]),
            ed = (0, r.useCallback)(async e => {
                if (!U) return w(eB, e_), !1;
                try {
                    return R(!0), await j({
                        questionnaireId: U,
                        answers: null != e ? e : D
                    }), M("saved"), !0
                } catch (e) {
                    return tU.handleNetworkRequestFailure(e, w, S), !1
                } finally {
                    R(!1)
                }
            }, [U, w, j, D, S]),
            ec = (0, r.useCallback)(async () => {
                if (!U) return void w(eB, e_);
                try {
                    R(!0);
                    let a = await K({
                        questionnaireId: U,
                        answers: D
                    });
                    if (!1 === a.isValid) {
                        var e, t;
                        let n = (null != (e = a.failures) ? e : []).map(e => e.questionId).filter(e => !!e),
                            l = nk(null != (t = null == es ? void 0 : es.sections) ? t : [], n);
                        _(l), null == T || T(!0, l);
                        return
                    }
                    b(U)
                } catch (e) {
                    tU.handleNetworkRequestFailure(e, w, S)
                } finally {
                    R(!1)
                }
            }, [U, w, D, S, K, b, es, T]),
            em = !!ee && D.some(e => e.questionId === ee.id),
            ep = (0, r.useMemo)(() => !!es && es.sections.every(e => eJ(e, D)), [es, D]),
            ef = (0, r.useMemo)(() => es ? es.sections.filter(e => eJ(e, D)).length : 0, [es, D]),
            eg = null != (a = null == es ? void 0 : es.sections.length) ? a : 0,
            ey = A ? C("Progress.Saving") : "saved" === k ? C("Label.Saved") : "unsaved" === k ? C("Label.UnsavedChanges") : null,
            eE = e => x ? (0, eT.createPortal)(r.default.createElement("div", {
                className: "flex justify-between items-center gap-medium padding-top-medium"
            }, r.default.createElement("div", {
                className: "flex items-center gap-medium"
            }, r.default.createElement(et.Button, {
                variant: "Utility",
                size: "Medium",
                onClick: v
            }, C("Button.Cancel")), ey && r.default.createElement("span", {
                className: "flex items-center gap-xsmall text-body-small content-muted"
            }, "saved" === k && r.default.createElement(F.CheckIcon, {
                fontSize: "small"
            }), ey)), r.default.createElement("div", {
                className: "flex gap-small"
            }, e)), x) : null,
            ev = V || null === k && W;
        return z || ev || !Q || !es ? r.default.createElement(ar, null) : r.default.createElement(f.Grid, {
            container: !0,
            flexDirection: "column",
            gap: "var(--gap-xxlarge)"
        }, $ && ee && r.default.createElement(r.default.Fragment, null, r.default.createElement(tw, {
            validatedAnswers: D,
            errors: N,
            question: null != er ? er : ee,
            updateAnswer: async (e, t) => {
                let a = D.find(t => t.questionId === e),
                    n = a ? nO(a.value) : [],
                    l = nO(t),
                    r = n.filter(e => !l.includes(e)),
                    i = ee && "options" in ee ? ee.options.filter(e => {
                        var t;
                        return r.includes(null != (t = e.id) ? t : "")
                    }) : [],
                    o = ta(i.flatMap(e => {
                        var t;
                        return null != (t = e.childQuestions) ? t : []
                    })),
                    s = te(i.flatMap(e => {
                        var t;
                        return null != (t = e.childSections) ? t : []
                    })),
                    u = [...Y(o), ...X(s)],
                    d = [...D.filter(t => t.questionId !== e).filter(e => !u.includes(e.questionId)), {
                        questionId: e,
                        value: t
                    }];
                eu(e, d), await ed(d)
            }
        }), eE(r.default.createElement(et.Button, {
            variant: "Emphasis",
            size: "Medium",
            onClick: y,
            isDisabled: !em || A
        }, C("Button.Continue")))), Z && r.default.createElement(r.default.Fragment, null, C("Progress.SectionsCompleted", {
            completed: ef.toString(),
            total: eg.toString()
        }), r.default.createElement(e3, {
            value: G
        }, r.default.createElement(tR, {
            questionnaire: es,
            answers: D,
            errors: N,
            isSaving: A,
            setAnswers: eu,
            send: nq,
            save: ed,
            goToLanding: nq,
            omitActionBar: !0,
            onExpandedSectionChange: h,
            violatedSectionIds: B
        })), eE(r.default.createElement(r.default.Fragment, null, r.default.createElement(et.Button, {
            variant: "Utility",
            size: "Medium",
            onClick: E
        }, C("Button.Back")), r.default.createElement(et.Button, {
            variant: "Emphasis",
            size: "Medium",
            onClick: ec,
            isDisabled: !ep || A,
            isLoading: A
        }, C("Button.Continue"))))))
    }, [eA.Navigation, eA.DeveloperQuestionnaire, eA.Error]);
    let nU = {
            display: "grid",
            gridTemplateColumns: "minmax(0, 1fr)",
            gap: "var(--gap-large)"
        },
        nG = {
            overflowX: "auto",
            maxWidth: "100%"
        },
        nF = e => {
            let {
                children: t
            } = e;
            return r.default.createElement(q.TableCell, null, r.default.createElement("div", {
                className: "flex items-center gap-small"
            }, r.default.createElement("span", {
                className: "text-label-medium"
            }, t)))
        },
        nQ = e => {
            let {
                children: t,
                className: a
            } = e;
            return r.default.createElement("div", {
                style: nG
            }, r.default.createElement(L.Table, {
                className: a
            }, t))
        },
        nz = (0, s.makeStyles)()(e => ({
            accordionRoot: {
                border: "unset",
                borderBottom: "1px solid ".concat(e.palette.components.divider),
                "&.Mui-expanded": {
                    margin: 0
                },
                "::before": {
                    content: "none"
                }
            },
            accordionSummaryContent: {
                justifyContent: "space-between",
                alignItems: "center",
                paddingRight: "var(--padding-small)",
                display: "flex",
                gap: "var(--gap-medium)"
            }
        }));
    var nH = (0, i.withTranslation)(e => {
            var t, a, n, l, o, s, d, c, m, p, g, y, E, v;
            let {
                universeId: b,
                mainQuestionnaireId: x,
                additionalQuestionnaireId: C,
                onPublish: w,
                onBack: N,
                onCancel: I,
                actionBarContainer: A,
                isOverEighteenQuestionnaire: R
            } = e, [k, M] = (0, r.useState)(0), {
                showToastNetworkError: D
            } = tO(), {
                locale: L
            } = (0, i.useLocalization)(), {
                translate: P,
                translateHTML: U,
                translateWithNamespace: F
            } = (0, i.useTranslation)(), {
                mutateAsync: Q,
                data: z,
                isPending: H,
                isError: V
            } = function(e) {
                let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {};
                return (0, j.useMutation)({
                    mutationKey: ["experienceQuestionnaireV2", "previewMultiQuestionnaire", e],
                    mutationFn: t => {
                        let a, n, {
                            questionnaireIds: l,
                            localeCode: r
                        } = t;
                        return a = {
                            universeId: e,
                            questionnaireIds: l
                        }, n = null != r ? r : null, tT().responsesApiV2.responsesPreviewMultiQuestionnaire({
                            previewSubmissionsRequestBody: a,
                            localeCode: n
                        })
                    },
                    ...t
                })
            }(b), W = (0, r.useRef)(!1);
            (0, r.useEffect)(() => {
                x && C && !W.current && (W.current = !0, Q({
                    questionnaireIds: [x, C],
                    localeCode: L
                }).catch(() => {
                    D(500)
                }))
            }, [L, Q, x, C, D]);
            let K = null != (t = null == z || null == (c = z.referencedContentDescriptors) ? void 0 : c.filter(e => e.complianceApiSupported).map(e => {
                    var t, a;
                    return {
                        id: null != (t = e.displayName) ? t : "",
                        label: null != (a = e.displayName) ? a : ""
                    }
                })) ? t : [],
                Y = (e => {
                    let t = e.length,
                        a = 2 ** t,
                        n = [];
                    for (let t = 0; t < a; t += 1) {
                        let a = {};
                        e.forEach((e, n) => {
                            let l = Math.floor(t / 2 ** n) % 2;
                            a[e.id] = 1 === l
                        }), n.push(a)
                    }
                    return n
                })(K),
                X = null != (a = null == z || null == (m = z.ageRecommendationDetails) ? void 0 : m.descriptorUsages) ? a : [],
                J = null == z || null == (g = z.ageRecommendationDetails) || null == (p = g.summary) ? void 0 : p.ageRecommendation,
                $ = null != (n = null == J ? void 0 : J.displayName) ? n : "",
                Z = (null != (l = null == J ? void 0 : J.minimumAge) ? l : 0) >= 18,
                ee = null != (o = null == z ? void 0 : z.restrictedCountries) ? o : [],
                ea = null != (s = null == z || null == (E = z.ageRecommendationDetails) || null == (y = E.descriptorUsages) ? void 0 : y.map(e => {
                    var t;
                    return null == (t = e.descriptor) ? void 0 : t.displayName
                }).filter(e => !!e)) ? s : [],
                en = [...null != (d = null == z || null == (v = z.robloxProducts) ? void 0 : v.flatMap(e => {
                    var t, a, n;
                    return null != (t = null == (n = e.iarcProduct) || null == (a = n.ratingList) ? void 0 : a.map(e => {
                        var t, a, n, l, r, i, o, s, u, d;
                        let c = null != (t = null == (u = e.interactiveElementList) ? void 0 : u.map(e => e.localizedDisplayText).filter(Boolean).join(", ")) ? t : "",
                            m = null != (a = null == (d = e.descriptorList) ? void 0 : d.map(e => e.localizedDisplayText).filter(Boolean).join(", ")) ? a : "";
                        return {
                            systemName: null != (n = e.ratingAuthorityShortText) ? n : "",
                            systemLabel: null != (l = e.ratingAuthorityShortText) ? l : "",
                            regionName: null != (r = e.localizedRegionText) ? r : "",
                            ratingCode: null != (i = e.ageRatingShortText) ? i : "",
                            ratingLabel: null != (o = e.localizedDisplayText) ? o : "",
                            ageRatingIconUrl: null != (s = e.ageRatingIconUrl) ? s : "",
                            interactiveElements: c,
                            iarcDescriptors: m,
                            robloxDescriptors: ea
                        }
                    })) ? t : []
                })) ? d : []].sort((e, t) => e.systemName.localeCompare(t.systemName)),
                {
                    mutateAsync: el,
                    isPending: er
                } = function(e) {
                    let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {};
                    return (0, j.useMutation)({
                        mutationKey: ["experienceQuestionnaireV2", "publishQuestionnaires", e],
                        mutationFn: t => {
                            let a;
                            return a = {
                                universeId: e,
                                questionnaireIds: [t.mainQuestionnaireId, t.additionalQuestionnaireId]
                            }, tT().responsesApiV2.responsesPublish({
                                publishRequestBody: a,
                                localeCode: null
                            })
                        },
                        ...t
                    })
                }(b),
                {
                    classes: {
                        accordionRoot: ei,
                        accordionSummaryContent: es
                    }
                } = nz(),
                {
                    classes: {
                        borderedTable: eu
                    }
                } = aw(),
                ed = async () => {
                    if (!x || !C) return void D(500);
                    try {
                        await el({
                            mainQuestionnaireId: x,
                            additionalQuestionnaireId: C
                        }), w()
                    } catch (e) {
                        D(500)
                    }
                }, ec = K.length > 0, em = ec && 0 === k;
            if (H) return r.default.createElement(ar, null);
            if (V) return r.default.createElement(aC, {
                message: P("Message.FailedToLoadPage"),
                onReload: () => window.location.reload()
            });
            let ep = r.default.createElement("div", {
                className: "flex justify-between items-center gap-medium padding-top-medium"
            }, r.default.createElement("div", {
                className: "flex items-center gap-medium"
            }, r.default.createElement(et.Button, {
                variant: "Utility",
                size: "Medium",
                onClick: I
            }, P("Button.Cancel")), !em && er && r.default.createElement("span", {
                className: "text-body-small content-muted"
            }, P("Progress.Publishing"))), r.default.createElement("div", {
                className: "flex gap-small"
            }, em ? r.default.createElement(r.default.Fragment, null, r.default.createElement(et.Button, {
                variant: "Utility",
                size: "Medium",
                onClick: N
            }, P("Button.Back")), r.default.createElement(et.Button, {
                variant: "Emphasis",
                size: "Medium",
                onClick: () => {
                    M(1)
                }
            }, P("Button.Continue"))) : r.default.createElement(r.default.Fragment, null, r.default.createElement(et.Button, {
                variant: "Utility",
                size: "Medium",
                onClick: ec ? () => {
                    M(0)
                } : N
            }, P("Button.Back")), r.default.createElement(et.Button, {
                variant: "Emphasis",
                size: "Medium",
                onClick: ed,
                isDisabled: er || !!(null == z ? void 0 : z.disableSubmitButton),
                isLoading: er
            }, P("Action.Send")))));
            return r.default.createElement(r.default.Fragment, null, r.default.createElement(f.Grid, {
                container: !0,
                flexDirection: "column",
                gap: "var(--gap-xxlarge)",
                style: {
                    minWidth: 0,
                    overflow: "hidden"
                }
            }, em ? r.default.createElement(r.default.Fragment, null, r.default.createElement("div", {
                style: nU
            }, r.default.createElement(u.Typography, {
                variant: "h5"
            }, P("Title.ReviewQuestionnaireVersionsMarch")), r.default.createElement(u.Typography, {
                className: "content-muted"
            }, P("Description.ReviewQuestionnaireVersionsMarch"))), r.default.createElement(nQ, {
                className: "".concat(eu, " radius-medium clip")
            }, r.default.createElement(B.TableHead, null, r.default.createElement(_.TableRow, null, r.default.createElement(nF, null, P("Label.QuestionnaireVersionColumn")), K.map(e => r.default.createElement(nF, {
                key: e.id
            }, e.label)))), r.default.createElement(O.TableBody, null, Y.map((e, t) => {
                let a = "version-".concat(t, "-").concat(K.map(t => e[t.id] ? "1" : "0").join(""));
                return r.default.createElement(_.TableRow, {
                    key: a
                }, r.default.createElement(q.TableCell, null, r.default.createElement("span", {
                    className: "text-body-medium"
                }, "".concat(t + 1))), K.map(t => r.default.createElement(q.TableCell, {
                    key: t.id
                }, r.default.createElement("span", {
                    className: "text-body-medium"
                }, e[t.id] ? P("Label.On") : P("Label.Off")))))
            })))) : r.default.createElement("div", {
                className: "flex flex-col gap-medium"
            }, Z && r.default.createElement(eo.SystemBanner, {
                title: "",
                description: P("Description.RestrictedContentPreview"),
                variant: "Standard",
                severity: "Info",
                primaryActionLabel: P("Action.LearnMore"),
                onPrimaryAction: () => window.open("https://en.help.roblox.com/hc/en-us/articles/15869919570708-Restricted-Content-Policy", "_blank")
            }), r.default.createElement(h.Accordion, {
                square: !0,
                variant: "outlined",
                classes: {
                    root: ei
                },
                defaultExpanded: !0
            }, r.default.createElement(T.AccordionSummary, {
                expandIcon: r.default.createElement(G.ExpandMoreIcon, null),
                classes: {
                    content: es
                }
            }, r.default.createElement("span", {
                className: "text-heading-small"
            }, P("Title.PreviewContentMaturityRatings"))), r.default.createElement(S.AccordionDetails, null, r.default.createElement("div", {
                style: nU
            }, r.default.createElement(u.Typography, {
                className: "content-muted"
            }, P("Description.RobloxMaturityLabel")), r.default.createElement(nQ, {
                className: "".concat(eu, " radius-medium clip")
            }, r.default.createElement(B.TableHead, null, r.default.createElement(_.TableRow, null, r.default.createElement(nF, null, P("Label.Rating")), r.default.createElement(nF, null, P("TableHead.Descriptors")))), r.default.createElement(O.TableBody, null, r.default.createElement(_.TableRow, null, r.default.createElement(q.TableCell, null, r.default.createElement("span", {
                className: "text-body-medium"
            }, $ || "—")), r.default.createElement(q.TableCell, null, r.default.createElement("div", {
                className: "flex flex-col"
            }, X.map(e => {
                var t;
                return null == (t = e.descriptor) ? void 0 : t.displayName
            }).filter(Boolean).map(e => r.default.createElement("span", {
                key: e,
                className: "text-body-medium"
            }, e)), 0 === X.length && r.default.createElement("span", {
                className: "text-body-medium"
            }, "—"))))))))), r.default.createElement(h.Accordion, {
                square: !0,
                variant: "outlined",
                classes: {
                    root: ei
                },
                defaultExpanded: !0
            }, r.default.createElement(T.AccordionSummary, {
                expandIcon: r.default.createElement(G.ExpandMoreIcon, null),
                classes: {
                    content: es
                }
            }, r.default.createElement("span", {
                className: "text-heading-small"
            }, P("Title.PreviewIARCRatings"))), r.default.createElement(S.AccordionDetails, null, r.default.createElement("div", {
                style: nU
            }, r.default.createElement(u.Typography, {
                className: "content-muted"
            }, U("Description.ReviewRatingsMarch", [{
                opening: "PolicyServiceApiLinkStart",
                closing: "PolicyServiceApiLinkEnd",
                content: e => r.default.createElement(aS, {
                    href: eY,
                    target: "_blank"
                }, e)
            }])), !R && r.default.createElement(aI, {
                description: F(eA.DeveloperQuestionnaire, "Description.U18IARCUnsupported"),
                linkLabel: P("Action.LearnMore"),
                linkHref: "https://en.help.roblox.com/hc/en-us/articles/15869919570708-Restricted-Content-Policy"
            }), r.default.createElement(nQ, {
                className: "".concat(eu, " radius-medium clip")
            }, r.default.createElement(B.TableHead, null, r.default.createElement(_.TableRow, null, r.default.createElement(nF, null, P("Label.RatingSystem")), r.default.createElement(nF, null, P("Label.Rating")), r.default.createElement(nF, null, P("Label.InteractiveElements")), r.default.createElement(nF, null, P("Label.IARCDescriptors")), r.default.createElement(nF, null, P("Label.RobloxDescriptors")))), r.default.createElement(O.TableBody, null, en.length > 0 ? en.map(e => r.default.createElement(_.TableRow, {
                key: "".concat(e.systemName, "-").concat(e.ratingCode)
            }, r.default.createElement(q.TableCell, null, r.default.createElement("div", {
                className: "flex flex-col gap-xsmall"
            }, r.default.createElement("span", {
                className: "text-body-medium"
            }, e.systemName), e.regionName && r.default.createElement("span", {
                className: "text-body-small content-muted"
            }, e.regionName))), r.default.createElement(q.TableCell, null, r.default.createElement("div", {
                className: "flex items-center gap-small"
            }, e.ageRatingIconUrl && r.default.createElement("img", {
                src: e.ageRatingIconUrl,
                alt: e.ratingCode,
                className: "height-[32px] width-[32px] radius-small"
            }), r.default.createElement("span", {
                className: "text-body-medium"
            }, e.ratingLabel))), r.default.createElement(q.TableCell, null, r.default.createElement("span", {
                className: "text-body-medium"
            }, e.interactiveElements)), r.default.createElement(q.TableCell, null, r.default.createElement("span", {
                className: "text-body-medium"
            }, e.iarcDescriptors)), r.default.createElement(q.TableCell, null, r.default.createElement("div", {
                className: "flex flex-col"
            }, e.robloxDescriptors.map(e => r.default.createElement("span", {
                key: e,
                className: "text-body-medium"
            }, e)), 0 === e.robloxDescriptors.length && r.default.createElement("span", {
                className: "text-body-medium"
            }, "—"))))) : r.default.createElement(_.TableRow, null, r.default.createElement(q.TableCell, null, r.default.createElement("span", {
                className: "text-body-medium"
            }, "—")), r.default.createElement(q.TableCell, null, r.default.createElement("span", {
                className: "text-body-medium"
            }, "—")), r.default.createElement(q.TableCell, null, r.default.createElement("span", {
                className: "text-body-medium"
            }, "—")), r.default.createElement(q.TableCell, null, r.default.createElement("span", {
                className: "text-body-medium"
            }, "—")), r.default.createElement(q.TableCell, null, r.default.createElement("span", {
                className: "text-body-medium"
            }, "—")))))))), r.default.createElement(h.Accordion, {
                square: !0,
                variant: "outlined",
                classes: {
                    root: ei
                },
                defaultExpanded: !0
            }, r.default.createElement(T.AccordionSummary, {
                expandIcon: r.default.createElement(G.ExpandMoreIcon, null),
                classes: {
                    content: es
                }
            }, r.default.createElement("span", {
                className: "text-heading-small"
            }, P("Title.PreviewRegionalLimitations"))), r.default.createElement(S.AccordionDetails, null, r.default.createElement("div", {
                style: nU
            }, r.default.createElement(u.Typography, {
                className: "content-muted"
            }, U("Description.NonCompliantRegions", [{
                opening: "policyApisLinkStart",
                closing: "policyApisLinkEnd",
                content: e => r.default.createElement(aS, {
                    href: "https://create.roblox.com/docs/reference/engine/classes/PolicyService",
                    target: "_blank"
                }, e)
            }])), r.default.createElement(nQ, {
                className: "".concat(eu, " radius-medium clip")
            }, r.default.createElement(B.TableHead, null, r.default.createElement(_.TableRow, null, r.default.createElement(nF, null, P("Title.Location")), r.default.createElement(nF, null, P("TableHead.Descriptors")), r.default.createElement(nF, null, P("Title.GuidelinesAgeRestriction")))), r.default.createElement(O.TableBody, null, ee.length > 0 ? ee.map((e, t) => {
                var a, n, l, i;
                return r.default.createElement(_.TableRow, {
                    key: null != (a = e.countryCode) ? a : t
                }, r.default.createElement(q.TableCell, null, r.default.createElement("span", {
                    className: "text-body-medium"
                }, null != (n = e.displayCountryName) ? n : "—")), r.default.createElement(q.TableCell, null, r.default.createElement("span", {
                    className: "text-body-medium"
                }, null != (l = e.displayDescriptorName) ? l : "—")), r.default.createElement(q.TableCell, null, r.default.createElement("span", {
                    className: "text-body-medium"
                }, null != (i = e.displayAgeRangeName) ? i : "—")))
            }) : r.default.createElement(_.TableRow, null, r.default.createElement(q.TableCell, null, r.default.createElement("span", {
                className: "text-body-medium"
            }, "—")), r.default.createElement(q.TableCell, null, r.default.createElement("span", {
                className: "text-body-medium"
            }, "—")), r.default.createElement(q.TableCell, null, r.default.createElement("span", {
                className: "text-body-medium"
            }, "—")))))))))), A && (0, eT.createPortal)(ep, A))
        }, [eA.Navigation, eA.DeveloperQuestionnaire, eA.Error]),
        nV = (0, i.withTranslation)(e => {
            var t, a, n, l, o, s, u;
            let {
                attemptId: d,
                entryPoint: c,
                universeId: m,
                onComplete: p,
                onCancel: f
            } = e, {
                locale: g
            } = (0, i.useLocalization)(), {
                translate: y
            } = (0, i.useTranslation)(), E = td(), v = aE(g), {
                data: b,
                isLoading: h,
                isError: T
            } = tW(m), x = null == b ? void 0 : b.questionnaireId, C = null == (t = null == b ? void 0 : b.isOverEighteenQuestionnaire) || t, {
                data: S,
                isLoading: w,
                isError: N
            } = tj(x, v), I = (null != (a = null == S || null == (o = S.sections) ? void 0 : o.length) ? a : 0) === 1, A = C ? y("Stepper.IARCQuestions") : y("Stepper.ContentQuestions"), R = (0, r.useMemo)(() => I ? [{
                label: y("Stepper.AppType")
            }, {
                label: A
            }, {
                label: y("Stepper.RobloxQuestions")
            }, {
                label: y("Stepper.Preview")
            }] : [{
                label: A
            }, {
                label: y("Stepper.RobloxQuestions")
            }, {
                label: y("Stepper.Preview")
            }], [I, y, A]), k = I ? 2 : 1, M = I ? 3 : 2, [D, L] = (0, r.useState)(0), [B, _] = (0, r.useState)(null), [q, O] = (0, r.useState)(null), P = (0, Q.useMediaQuery)("(max-width: 600px)"), U = (0, z.useTheme)(), [G, F] = (0, r.useState)(!P), [H, V] = (0, r.useState)(null), [W, j] = (0, r.useState)(null), [K, Y] = (0, r.useState)(!1), [X, J] = (0, r.useState)(new Set), [$, ee] = (0, r.useState)(!1), et = (0, r.useRef)(null);
            (0, r.useEffect)(() => {
                let e = et.current;
                if (!e) return;
                let t = function(e) {
                    let t = e.parentElement;
                    for (; t;) {
                        let {
                            overflowY: e
                        } = window.getComputedStyle(t);
                        if ("auto" === e || "scroll" === e) return t;
                        t = t.parentElement
                    }
                    return null
                }(e);
                if (!t) return;
                let a = () => {
                    let a = t.getBoundingClientRect(),
                        n = e.getBoundingClientRect().top - a.top + t.scrollTop;
                    e.style.minHeight = "".concat(t.clientHeight - n, "px")
                };
                a();
                let n = new ResizeObserver(a);
                return n.observe(t), () => n.disconnect()
            }, []);
            let ea = (0, r.useCallback)(e => {
                    var t;
                    L(e), V(null), Y(!1), J(new Set), ee(!1), null == (t = document.getElementById(E.scrollContainerId)) || t.scrollTo(0, 0)
                }, [E.scrollContainerId]),
                en = (0, r.useMemo)(() => {
                    let e = {};
                    if (!(null == S ? void 0 : S.sections)) return e;
                    let t = a => {
                        a.forEach(a => {
                            var n;
                            a.id && (null == (n = a.metadata) ? void 0 : n.RobloxGuidanceFormatted) && (e[a.id] = a.metadata.RobloxGuidanceFormatted), a.questions && a.questions.forEach(e => {
                                "options" in e && Array.isArray(e.options) && e.options.forEach(e => {
                                    e.childSections && t(e.childSections)
                                })
                            })
                        })
                    };
                    return t(S.sections), e
                }, [S]),
                el = null != (n = null == S || null == (u = S.sections) || null == (s = u[0]) ? void 0 : s.id) ? n : null,
                er = null != H ? H : I && 0 === D ? el : null,
                ei = er && null != (l = en[er]) ? l : "",
                eo = (0, r.useCallback)(e => {
                    V(e), ee(!1)
                }, []),
                es = (0, r.useCallback)((e, t) => {
                    Y(e), J(null != t ? t : new Set), ee(!1), e && F(!0)
                }, []),
                eu = K && !!er && X.has(er) && !$,
                ed = (0, r.useCallback)(() => {
                    ee(!0)
                }, []),
                ec = D < k && !!ei;
            return ((0, r.useEffect)(() => {
                ec ? F(!P) : F(!1)
            }, [er, P, ec]), T || N) ? r.default.createElement(aC, {
                message: y("Message.FailedToLoadPage"),
                onReload: () => window.location.reload()
            }) : h || w || !S ? r.default.createElement(ar, null) : r.default.createElement("div", {
                ref: et,
                className: "flex flex-col"
            }, r.default.createElement("div", {
                className: "flex gap-xlarge fill",
                style: {
                    alignItems: "flex-start"
                }
            }, r.default.createElement("div", {
                className: "flex flex-col gap-xlarge min-width-[0px] fill"
            }, r.default.createElement("div", {
                className: "sticky top-[0px] padding-y-medium",
                style: {
                    zIndex: 10,
                    backgroundColor: U.palette.navigation.default,
                    overflow: "hidden"
                }
            }, r.default.createElement(Z.Stepper, {
                steps: R,
                currentStepIndex: D,
                size: "Medium"
            })), D < k && r.default.createElement(nP, {
                universeId: m,
                attemptId: d,
                entryPoint: c,
                activeStep: D,
                onNext: () => ea(e => e + 1),
                onBack: () => ea(e => e <= 0 ? (f(), 0) : e - 1),
                onCancel: f,
                onComplete: e => {
                    _(e), ea(k)
                },
                onActiveSectionChange: eo,
                onViolation: es,
                actionBarContainer: W
            }), D === k && r.default.createElement(nD, {
                universeId: m,
                attemptId: d,
                entryPoint: c,
                onComplete: e => {
                    O(e), ea(M)
                },
                onBack: () => ea(k - 1),
                onCancel: f,
                onViolation: es,
                actionBarContainer: W
            }), D === M && r.default.createElement(nH, {
                universeId: m,
                mainQuestionnaireId: null != B ? B : "",
                additionalQuestionnaireId: null != q ? q : "",
                onPublish: () => {
                    p()
                },
                onBack: () => ea(k),
                onCancel: f,
                actionBarContainer: W,
                isOverEighteenQuestionnaire: C
            })), ec && G && !P && r.default.createElement(nL, {
                onClose: () => F(!1),
                robloxGuidance: ei,
                showViolationWarning: eu,
                onDismissWarning: ed,
                actionBarContainer: W
            }), ec && P && r.default.createElement(nL, {
                open: G,
                onClose: () => F(!1),
                robloxGuidance: ei,
                showViolationWarning: eu,
                onDismissWarning: ed,
                actionBarContainer: W
            }), ec && !G && r.default.createElement(n_, {
                onClick: () => F(!0),
                actionBarContainer: W
            })), r.default.createElement("div", {
                ref: e => {
                    j(e)
                },
                className: "sticky bottom-[0px] padding-y-large",
                style: {
                    zIndex: 10,
                    backgroundColor: U.palette.navigation.default
                }
            }))
        }, [eA.Navigation, eA.DeveloperQuestionnaire, eA.Error]),
        nW = (0, i.withTranslation)(e => {
            var t;
            let {
                universeId: a
            } = e, n = (0, o.useRouter)(), [l, s] = (0, r.useState)(0), [u, d] = (0, r.useState)(!1), {
                translate: c
            } = (0, i.useTranslation)(), m = td(), {
                locale: p
            } = (0, i.useLocalization)(), f = "string" == typeof n.query.entryPoint ? n.query.entryPoint : void 0, {
                data: g,
                isLoading: y,
                isError: E
            } = tW(a), v = null == g ? void 0 : g.questionnaireId, b = null == (t = null == g ? void 0 : g.isOverEighteenQuestionnaire) || t, {
                attemptId: h,
                completeAttempt: T,
                entryPoint: x,
                startAttempt: C
            } = ag({
                explicitEntryPoint: f,
                locale: p,
                questionnaireId: v,
                universeId: a
            }), {
                isLoading: S,
                isError: w
            } = tj(v, p), {
                isLoading: N
            } = tK(a), {
                isLoading: I
            } = tY(a);
            am(a, v, 1 === l);
            let {
                isLoading: A
            } = tZ(a), {
                isLoading: R
            } = t1(a), {
                isLoading: k
            } = t0(a), M = (0, r.useCallback)(() => {
                C({
                    onStarted: () => {
                        var e;
                        d(!1), s(1), null == (e = document.getElementById(m.scrollContainerId)) || e.scrollTo(0, 0)
                    }
                })
            }, [C, m.scrollContainerId]);
            return y || N || I || S || A || R || k || !m.isHostReady ? r.default.createElement(ar, null) : E || w ? r.default.createElement(aC, {
                message: c("Message.FailedToLoadPage"),
                onReload: () => window.location.reload()
            }) : 1 === l ? r.default.createElement(nV, {
                universeId: a,
                attemptId: h,
                entryPoint: x,
                onComplete: () => {
                    T(), s(0), d(!0)
                },
                onCancel: () => {
                    s(0), d(!1)
                }
            }) : r.default.createElement(nR, {
                universeId: a,
                onStartQuestionnaire: M,
                showSubmissionSuccessAlert: u,
                onDismissSubmissionSuccessAlert: () => d(!1),
                isOverEighteenQuestionnaire: b
            })
        }, [eA.Navigation, eA.DeveloperQuestionnaire, eA.Error]);
    e.s(["QuestionnaireContainer", 0, aT, "QuestionnaireContainerV2", 0, nW, "QuestionnaireHostProvider", 0, e => {
        let {
            children: t,
            ...a
        } = e, n = (0, r.useMemo)(() => ({
            ...ts,
            ...a,
            questionnaireVersion: {
                ...ts.questionnaireVersion,
                ...a.questionnaireVersion
            },
            sectionStepper: {
                ...ts.sectionStepper,
                ...a.sectionStepper
            }
        }), [a]);
        return r.default.createElement(tu.Provider, {
            value: n
        }, t)
    }, "configureQuestionnaireClients", 0, e => {
        t = e.unifiedLogger
    }], 979128)
}]);

//# debugId=cde38926-5a56-c690-5772-29a8a601fe01
//# sourceMappingURL=2d9x6d83tx2ff.js.map