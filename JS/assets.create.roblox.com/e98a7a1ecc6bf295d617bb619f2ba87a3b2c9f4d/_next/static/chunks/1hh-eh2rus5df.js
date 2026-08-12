;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "88e8159b-0650-c006-ac0e-4c97c0bfd91a")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 972455, r => {
    "use strict";
    var e = r.i(273589),
        a = r.i(962560),
        t = r.i(416340),
        i = r.i(42569),
        o = r.i(696180),
        n = r.i(221628),
        g = r.i(963320);

    function b(r) {
        return (0, e.g)("MuiTypography", r)
    }
    var l = (0, o.g)("MuiTypography", ["root", "h1", "h2", "h3", "h4", "h5", "h6", "subtitle1", "subtitle2", "body1", "body2", "inherit", "button", "caption", "overline", "alignLeft", "alignRight", "alignCenter", "alignJustify", "noWrap", "gutterBottom", "paragraph"]);
    let d = ["align", "className", "component", "gutterBottom", "noWrap", "paragraph", "variant", "variantMapping"],
        S = (0, i.s)("span", {
            name: "MuiTypography",
            slot: "Root",
            overridesResolver: (r, a) => {
                let {
                    ownerState: t
                } = r;
                return [a.root, t.variant && a[t.variant], "inherit" !== t.align && a["align".concat((0, e.a)(t.align))], t.noWrap && a.noWrap, t.gutterBottom && a.gutterBottom, t.paragraph && a.paragraph]
            }
        })(r => {
            let {
                theme: e,
                ownerState: t
            } = r;
            return (0, a._)({
                margin: 0
            }, "inherit" === t.variant && {
                font: "inherit"
            }, "inherit" !== t.variant && e.typography[t.variant], "inherit" !== t.align && {
                textAlign: t.align
            }, t.noWrap && {
                overflow: "hidden",
                textOverflow: "ellipsis",
                whiteSpace: "nowrap"
            }, t.gutterBottom && {
                marginBottom: "0.35em"
            }, t.paragraph && {
                marginBottom: 16
            })
        }),
        u = {
            h1: "h1",
            h2: "h2",
            h3: "h3",
            h4: "h4",
            h5: "h5",
            h6: "h6",
            subtitle1: "h6",
            subtitle2: "h6",
            body1: "p",
            body2: "p",
            inherit: "p"
        },
        _ = {
            primary: "primary.main",
            textPrimary: "text.primary",
            secondary: "secondary.main",
            textSecondary: "text.secondary",
            error: "error.main"
        },
        c = t.forwardRef(function(r, t) {
            let o, l = (0, g.u)({
                    props: r,
                    name: "MuiTypography"
                }),
                c = _[o = l.color] || o,
                s = (0, i.e)((0, a._)({}, l, {
                    color: c
                })),
                {
                    align: p = "inherit",
                    className: B,
                    component: h,
                    gutterBottom: F = !1,
                    noWrap: m = !1,
                    paragraph: y = !1,
                    variant: z = "body1",
                    variantMapping: L = u
                } = s,
                k = (0, e._)(s, d),
                C = (0, a._)({}, s, {
                    align: p,
                    color: c,
                    className: B,
                    component: h,
                    gutterBottom: F,
                    noWrap: m,
                    paragraph: y,
                    variant: z,
                    variantMapping: L
                }),
                f = h || (y ? "p" : L[z] || u[z]) || "span",
                T = (r => {
                    let {
                        align: a,
                        gutterBottom: t,
                        noWrap: o,
                        paragraph: n,
                        variant: g,
                        classes: l
                    } = r, d = {
                        root: ["root", g, "inherit" !== r.align && "align".concat((0, e.a)(a)), t && "gutterBottom", o && "noWrap", n && "paragraph"]
                    };
                    return (0, i.a)(d, b, l)
                })(C);
            return (0, n.jsx)(S, (0, a._)({
                as: f,
                ref: t,
                ownerState: C,
                className: (0, i.c)(T.root, B)
            }, k))
        });
    r.s(["T", 0, c, "t", 0, l])
}, 309742, r => {
    "use strict";
    r.i(962560), r.s(["e", 0, function(r) {
        return r
    }])
}, 734094, r => {
    "use strict";
    var e = r.i(178417),
        a = {},
        t = {};
    Object.defineProperty(t, "__esModule", {
        value: !0
    }), t.TokensDark = void 0, t.TokensDark = {
        Color: {
            ActionAlert: {
                Background: "rgba(208, 217, 251, 0.12)",
                Border: "rgba(0, 0, 0, 0)",
                Foreground: "rgb(240, 68, 51)"
            },
            ActionEmphasis: {
                Background: "rgb(51, 95, 255)",
                Border: "rgba(0, 0, 0, 0)",
                Foreground: "rgb(247, 247, 248)"
            },
            ActionLink: {
                Background: "rgba(0, 0, 0, 0)",
                Border: "rgba(0, 0, 0, 0)",
                Foreground: "rgb(247, 247, 248)"
            },
            ActionOverMedia: {
                Background: "rgb(247, 247, 248)",
                Border: "rgba(0, 0, 0, 0)",
                Foreground: "rgb(32, 34, 39)"
            },
            ActionSoftEmphasis: {
                Background: "rgba(51, 95, 255, 0.4)",
                Border: "rgba(0, 0, 0, 0)",
                Foreground: "rgb(235, 241, 255)"
            },
            ActionStandard: {
                Background: "rgba(208, 217, 251, 0.12)",
                Border: "rgba(0, 0, 0, 0)",
                Foreground: "rgb(247, 247, 248)"
            },
            ActionSubEmphasis: {
                Background: "rgb(247, 247, 248)",
                Border: "rgba(0, 0, 0, 0)",
                Foreground: "rgb(32, 34, 39)"
            },
            ActionSubtle: {
                Background: "rgba(0, 0, 0, 0)",
                Border: "rgb(213, 215, 221)",
                Foreground: "rgb(247, 247, 248)"
            },
            ActionUtility: {
                Background: "rgba(0, 0, 0, 0)",
                Border: "rgba(0, 0, 0, 0)",
                Foreground: "rgb(247, 247, 248)"
            },
            Common: {
                Backdrop: "rgba(10, 10, 14, 0.75)",
                HeavyDivider: "rgba(0, 0, 0, 0.5)",
                NavigationBar: "rgb(18, 18, 21)",
                Scrim: "rgba(10, 10, 14, 0.75)",
                Shadow: "rgba(0, 0, 0, 0.5)",
                Shimmer: "rgba(208, 217, 251, 0.12)"
            },
            Content: {
                Default: "rgb(213, 215, 221)",
                Emphasis: "rgb(247, 247, 248)",
                Link: "rgb(82, 139, 255)",
                Muted: "rgb(188, 190, 200)"
            },
            Extended: {
                Black: {
                    Black_0: "rgba(0, 0, 0, 0)",
                    Black_03: "rgba(0, 0, 0, 0.03)",
                    Black_05: "rgba(0, 0, 0, 0.05)",
                    Black_10: "rgba(0, 0, 0, 0.1)",
                    Black_15: "rgba(0, 0, 0, 0.15)",
                    Black_20: "rgba(0, 0, 0, 0.2)",
                    Black_30: "rgba(0, 0, 0, 0.3)",
                    Black_40: "rgba(0, 0, 0, 0.4)",
                    Black_50: "rgba(0, 0, 0, 0.5)",
                    Black_60: "rgba(0, 0, 0, 0.6)",
                    Black_70: "rgba(0, 0, 0, 0.7)",
                    Black_80: "rgba(0, 0, 0, 0.8)",
                    Black_85: "rgba(0, 0, 0, 0.85)",
                    Black_90: "rgba(0, 0, 0, 0.9)",
                    Black_95: "rgba(0, 0, 0, 0.95)",
                    Black_97: "rgba(0, 0, 0, 0.97)",
                    Black_100: "rgb(0, 0, 0)"
                },
                Blue: {
                    Blue_100: "rgb(235, 241, 255)",
                    Blue_200: "rgb(204, 221, 255)",
                    Blue_300: "rgb(173, 201, 255)",
                    Blue_400: "rgb(143, 180, 255)",
                    Blue_500: "rgb(112, 160, 255)",
                    Blue_600: "rgb(82, 139, 255)",
                    Blue_700: "rgb(51, 95, 255)",
                    Blue_800: "rgb(20, 70, 255)",
                    Blue_900: "rgb(0, 53, 245)",
                    Blue_1000: "rgb(0, 45, 214)",
                    Blue_1100: "rgb(0, 39, 184)",
                    Blue_1200: "rgb(0, 34, 153)",
                    Blue_1300: "rgb(0, 27, 122)",
                    Blue_1400: "rgb(0, 20, 92)"
                },
                Gray: {
                    Gray_100: "rgb(247, 247, 248)",
                    Gray_200: "rgb(238, 239, 241)",
                    Gray_300: "rgb(230, 231, 234)",
                    Gray_400: "rgb(213, 215, 221)",
                    Gray_500: "rgb(188, 190, 200)",
                    Gray_600: "rgb(106, 111, 129)",
                    Gray_700: "rgb(73, 77, 90)",
                    Gray_800: "rgb(53, 55, 65)",
                    Gray_900: "rgb(39, 41, 48)",
                    Gray_1000: "rgb(32, 34, 39)",
                    Gray_1100: "rgb(25, 26, 31)",
                    Gray_1200: "rgb(18, 18, 21)"
                },
                Green: {
                    Green_100: "rgb(208, 251, 227)",
                    Green_200: "rgb(176, 246, 208)",
                    Green_300: "rgb(142, 233, 182)",
                    Green_400: "rgb(101, 215, 157)",
                    Green_500: "rgb(57, 197, 130)",
                    Green_600: "rgb(29, 177, 106)",
                    Green_700: "rgb(12, 155, 90)",
                    Green_800: "rgb(1, 133, 75)",
                    Green_900: "rgb(2, 114, 64)",
                    Green_1000: "rgb(1, 95, 53)",
                    Green_1100: "rgb(0, 74, 41)",
                    Green_1200: "rgb(1, 56, 31)",
                    Green_1300: "rgb(10, 38, 18)",
                    Green_1400: "rgb(0, 22, 12)"
                },
                Magenta: {
                    Magenta_100: "rgb(253, 232, 249)",
                    Magenta_200: "rgb(253, 221, 253)",
                    Magenta_300: "rgb(245, 200, 252)",
                    Magenta_400: "rgb(239, 170, 250)",
                    Magenta_500: "rgb(232, 139, 248)",
                    Magenta_600: "rgb(223, 106, 247)",
                    Magenta_700: "rgb(213, 64, 245)",
                    Magenta_800: "rgb(192, 10, 232)",
                    Magenta_900: "rgb(165, 14, 200)",
                    Magenta_1000: "rgb(138, 12, 167)",
                    Magenta_1100: "rgb(110, 7, 133)",
                    Magenta_1200: "rgb(84, 4, 103)",
                    Magenta_1300: "rgb(60, 2, 74)",
                    Magenta_1400: "rgb(35, 4, 42)"
                },
                Orange: {
                    Orange_100: "rgb(253, 232, 216)",
                    Orange_200: "rgb(252, 222, 199)",
                    Orange_300: "rgb(251, 206, 174)",
                    Orange_400: "rgb(251, 178, 134)",
                    Orange_500: "rgb(250, 148, 90)",
                    Orange_600: "rgb(245, 118, 48)",
                    Orange_700: "rgb(220, 100, 35)",
                    Orange_800: "rgb(192, 80, 20)",
                    Orange_900: "rgb(169, 67, 11)",
                    Orange_1000: "rgb(144, 51, 0)",
                    Orange_1100: "rgb(115, 40, 0)",
                    Orange_1200: "rgb(87, 30, 0)",
                    Orange_1300: "rgb(60, 21, 0)",
                    Orange_1400: "rgb(33, 13, 1)"
                },
                Pink: {
                    Pink_100: "rgb(255, 230, 242)",
                    Pink_200: "rgb(254, 220, 236)",
                    Pink_300: "rgb(250, 202, 224)",
                    Pink_400: "rgb(247, 173, 207)",
                    Pink_500: "rgb(243, 143, 184)",
                    Pink_600: "rgb(238, 114, 161)",
                    Pink_700: "rgb(231, 78, 144)",
                    Pink_800: "rgb(205, 55, 123)",
                    Pink_900: "rgb(180, 43, 106)",
                    Pink_1000: "rgb(153, 29, 88)",
                    Pink_1100: "rgb(99, 3, 53)",
                    Pink_1200: "rgb(99, 3, 53)",
                    Pink_1300: "rgb(70, 4, 36)",
                    Pink_1400: "rgb(43, 2, 21)"
                },
                Purple: {
                    Purple_100: "rgb(241, 231, 255)",
                    Purple_200: "rgb(233, 222, 251)",
                    Purple_300: "rgb(226, 206, 253)",
                    Purple_400: "rgb(212, 181, 252)",
                    Purple_500: "rgb(197, 156, 249)",
                    Purple_600: "rgb(182, 130, 247)",
                    Purple_700: "rgb(167, 102, 245)",
                    Purple_800: "rgb(147, 72, 240)",
                    Purple_900: "rgb(130, 46, 231)",
                    Purple_1000: "rgb(108, 33, 198)",
                    Purple_1100: "rgb(86, 20, 165)",
                    Purple_1200: "rgb(65, 8, 134)",
                    Purple_1300: "rgb(45, 4, 96)",
                    Purple_1400: "rgb(28, 2, 59)"
                },
                Red: {
                    Red_100: "rgb(255, 234, 233)",
                    Red_200: "rgb(255, 223, 222)",
                    Red_300: "rgb(247, 205, 203)",
                    Red_400: "rgb(243, 178, 174)",
                    Red_500: "rgb(238, 151, 145)",
                    Red_600: "rgb(235, 121, 115)",
                    Red_700: "rgb(231, 87, 80)",
                    Red_800: "rgb(223, 40, 31)",
                    Red_900: "rgb(197, 18, 10)",
                    Red_1000: "rgb(164, 17, 9)",
                    Red_1100: "rgb(131, 15, 7)",
                    Red_1200: "rgb(100, 12, 5)",
                    Red_1300: "rgb(71, 8, 4)",
                    Red_1400: "rgb(40, 6, 3)"
                },
                Turquoise: {
                    Turquoise_100: "rgb(200, 246, 255)",
                    Turquoise_200: "rgb(163, 239, 254)",
                    Turquoise_300: "rgb(126, 229, 248)",
                    Turquoise_400: "rgb(92, 210, 232)",
                    Turquoise_500: "rgb(57, 189, 216)",
                    Turquoise_600: "rgb(22, 169, 199)",
                    Turquoise_700: "rgb(4, 148, 178)",
                    Turquoise_800: "rgb(18, 125, 152)",
                    Turquoise_900: "rgb(5, 108, 130)",
                    Turquoise_1000: "rgb(5, 90, 106)",
                    Turquoise_1100: "rgb(4, 71, 84)",
                    Turquoise_1200: "rgb(2, 53, 63)",
                    Turquoise_1300: "rgb(2, 37, 44)",
                    Turquoise_1400: "rgb(2, 20, 24)"
                },
                White: {
                    White_0: "rgba(255, 255, 255, 0)",
                    White_03: "rgba(255, 255, 255, 0.03)",
                    White_05: "rgba(255, 255, 255, 0.05)",
                    White_10: "rgba(255, 255, 255, 0.1)",
                    White_15: "rgba(255, 255, 255, 0.15)",
                    White_20: "rgba(255, 255, 255, 0.2)",
                    White_30: "rgba(255, 255, 255, 0.3)",
                    White_40: "rgba(255, 255, 255, 0.4)",
                    White_50: "rgba(255, 255, 255, 0.5)",
                    White_60: "rgba(255, 255, 255, 0.6)",
                    White_70: "rgba(255, 255, 255, 0.7)",
                    White_80: "rgba(255, 255, 255, 0.8)",
                    White_85: "rgba(255, 255, 255, 0.85)",
                    White_90: "rgba(255, 255, 255, 0.9)",
                    White_95: "rgba(255, 255, 255, 0.95)",
                    White_97: "rgba(255, 255, 255, 0.97)",
                    White_100: "rgb(255, 255, 255)"
                },
                Yellow: {
                    Yellow_100: "rgb(253, 236, 193)",
                    Yellow_200: "rgb(250, 228, 170)",
                    Yellow_300: "rgb(247, 210, 115)",
                    Yellow_400: "rgb(242, 186, 42)",
                    Yellow_500: "rgb(219, 166, 31)",
                    Yellow_600: "rgb(196, 147, 21)",
                    Yellow_700: "rgb(174, 128, 11)",
                    Yellow_800: "rgb(151, 108, 0)",
                    Yellow_900: "rgb(129, 93, 0)",
                    Yellow_1000: "rgb(107, 76, 0)",
                    Yellow_1100: "rgb(83, 61, 2)",
                    Yellow_1200: "rgb(63, 45, 1)",
                    Yellow_1300: "rgb(44, 31, 0)",
                    Yellow_1400: "rgb(24, 17, 0)"
                }
            },
            None: "rgba(0, 0, 0, 0)",
            OverMedia: {
                OverMedia_0: "rgba(18, 18, 21, 0.92)",
                OverMedia_100: "rgba(25, 26, 31, 0.92)",
                OverMedia_200: "rgba(32, 34, 39, 0.92)",
                OverMedia_300: "rgba(39, 41, 48, 0.92)"
            },
            Selection: {
                End: "rgb(255, 255, 255)",
                Start: "rgb(255, 255, 255)"
            },
            Shift: {
                Shift_100: "rgba(208, 217, 251, 0.04)",
                Shift_200: "rgba(208, 217, 251, 0.08)",
                Shift_300: "rgba(208, 217, 251, 0.12)",
                Shift_400: "rgba(208, 217, 251, 0.16)"
            },
            State: {
                Hover: "rgba(208, 217, 251, 0.08)",
                Idle: "rgba(255, 255, 255, 0)",
                Press: "rgba(208, 217, 251, 0.12)"
            },
            Stroke: {
                Default: "rgba(208, 217, 251, 0.12)",
                Emphasis: "rgba(208, 217, 251, 0.16)",
                Muted: "rgba(208, 217, 251, 0.08)"
            },
            Surface: {
                Surface_0: "rgb(18, 18, 21)",
                Surface_100: "rgb(25, 26, 31)",
                Surface_200: "rgb(32, 34, 39)",
                Surface_300: "rgb(39, 41, 48)"
            },
            System: {
                Alert: "rgb(223, 40, 31)",
                Contrast: "rgb(247, 247, 248)",
                Emphasis: "rgb(51, 95, 255)",
                Neutral: "rgb(188, 190, 200)",
                Success: "rgb(57, 197, 130)",
                Warning: "rgb(242, 186, 42)"
            }
        },
        Component: {
            BaseMenu: {
                BackgroundColor: "rgb(39, 41, 48)",
                BorderRadius: 8
            },
            ControllerBar: {
                BackgroundColor: "rgba(208, 217, 251, 0.04)",
                BorderRadius: {
                    LeadingBottom: 9999,
                    LeadingTop: 9999,
                    TrailingBottom: 9999,
                    TrailingTop: 9999
                },
                Gap: 16,
                Spacing: {
                    Bottom: 8,
                    Leading: 12,
                    Top: 8,
                    Trailing: 12
                }
            },
            ControllerBarShortcut: {
                Container: {
                    ContentColor: "rgb(247, 247, 248)",
                    Gap: 4
                },
                Icon: {
                    Size: 36
                },
                Label: {
                    Typography: {
                        Font: '600 14/1.4 "Builder Sans"',
                        FontFamily: '"Builder Sans"',
                        FontSize: 14,
                        FontWeight: "600",
                        LetterSpacing: 0,
                        LineHeight: 1.4
                    }
                }
            },
            Facepile: {
                Badge: {
                    BackgroundColor: "rgb(51, 95, 255)",
                    BorderColor: "rgb(39, 41, 48)",
                    BorderRadius: 9999,
                    BorderWidth: 2,
                    ContentColor: "rgb(247, 247, 248)",
                    Height: 16,
                    MinWidth: 16,
                    Spacing: 4,
                    Typography: {
                        Font: '600 10/1.4 "Builder Sans"',
                        FontFamily: '"Builder Sans"',
                        FontSize: 10,
                        FontWeight: "600",
                        LetterSpacing: 0,
                        LineHeight: 1.4
                    }
                },
                Container: {
                    Gap: 4
                },
                Face: {
                    BackgroundColor: "rgb(213, 215, 221)",
                    BorderColor: "rgb(39, 41, 48)",
                    BorderRadius: 9999,
                    BorderWidth: 2,
                    Height: 16,
                    Width: 16
                },
                FaceGroup: {
                    Gap: -6
                },
                Label: {
                    ContentColor: "rgb(188, 190, 200)",
                    Typography: {
                        Font: '400 12/1.4 "Builder Sans"',
                        FontFamily: '"Builder Sans"',
                        FontSize: 12,
                        FontWeight: "400",
                        LetterSpacing: 0,
                        LineHeight: 1.4
                    }
                }
            },
            HelperText: {
                Base: {
                    ContentColor: "rgb(213, 215, 221)",
                    Opacity: 1,
                    Padding: {
                        Top: 4
                    },
                    Typography: {
                        Font: '600 10/1.4 "Builder Sans"',
                        FontFamily: '"Builder Sans"',
                        FontSize: 10,
                        FontWeight: "600",
                        LetterSpacing: 0,
                        LineHeight: 1.4
                    }
                },
                Error: {
                    ContentColor: "rgb(240, 68, 51)"
                }
            },
            InputLabel: {
                Base: {
                    ContentColor: "rgb(213, 215, 221)",
                    Opacity: 1,
                    Spacing: {
                        Bottom: 4
                    },
                    Typography: {
                        Font: '400 12/1.4 "Builder Sans"',
                        FontFamily: '"Builder Sans"',
                        FontSize: 12,
                        FontWeight: "400",
                        LetterSpacing: 0,
                        LineHeight: 1.4
                    }
                },
                Disabled: {
                    Opacity: .32
                }
            },
            MediaTile: {
                Container: {
                    BorderRadius: 8
                },
                Icon: {
                    Size: 36
                }
            },
            MenuCell: {
                Base: {
                    CheckFrame: {
                        Size: 32
                    },
                    Container: {
                        BackgroundColor: "rgb(39, 41, 48)",
                        BorderColor: "rgba(208, 217, 251, 0.16)",
                        BorderRadius: {
                            BottomLeading: 0,
                            BottomTrailing: 0,
                            TopLeading: 0,
                            TopTrailing: 0
                        },
                        BorderWidth: 0,
                        ContentColor: "rgb(247, 247, 248)",
                        Height: 56,
                        Spacing: {
                            Bottom: 0,
                            Leading: 12,
                            Top: 0,
                            Trailing: 12
                        }
                    },
                    IconFrame: {
                        Size: 32
                    },
                    Text: {
                        Typography: {
                            Font: '700 16/1.4 "Builder Sans"',
                            FontFamily: '"Builder Sans"',
                            FontSize: 16,
                            FontWeight: "700",
                            LetterSpacing: 0,
                            LineHeight: 1.4
                        }
                    },
                    TextFrame: {
                        Spacing: {
                            Bottom: 0,
                            Leading: 12,
                            Top: 0,
                            Trailing: 12
                        }
                    }
                },
                Disabled: {
                    Container: {
                        ContentColor: "rgba(247, 247, 248, 0.5)"
                    }
                },
                Divider: {
                    Container: {
                        BorderWidth: 1
                    }
                },
                HasRoundBottom: {
                    Container: {
                        BorderRadius: {
                            BottomLeading: 8,
                            BottomTrailing: 8
                        }
                    }
                },
                HasRoundTop: {
                    Container: {
                        BorderRadius: {
                            TopLeading: 8,
                            TopTrailing: 8
                        }
                    }
                }
            },
            PlayerCount: {
                Container: {
                    BackgroundColor: "rgba(0, 0, 0, 0)",
                    BorderRadius: 0,
                    Spacing: 8
                }
            },
            PlayerTileSmall: {
                Base: {
                    Container: {
                        Gap: 8,
                        Spacing: {
                            Bottom: 8,
                            Leading: 8,
                            Top: 8,
                            Trailing: 8
                        }
                    },
                    Content: {
                        ContentColor: "rgb(247, 247, 248)",
                        Gap: 2,
                        Typography: {
                            Font: '600 14/1.4 "Builder Sans"',
                            FontFamily: '"Builder Sans"',
                            FontSize: 14,
                            FontWeight: "600",
                            LetterSpacing: 0,
                            LineHeight: 1.4
                        }
                    },
                    Icon: {
                        Size: 16
                    },
                    Image: {
                        BackgroundColor: "rgb(39, 41, 48)",
                        BorderColor: "rgba(208, 217, 251, 0.16)",
                        BorderRadius: 9999,
                        BorderWidth: 3,
                        Size: 96
                    },
                    Presence: {
                        ContentColor: "rgb(213, 215, 221)"
                    },
                    Status: {
                        BackgroundColor: "rgb(57, 197, 130)",
                        BorderColor: "rgb(18, 18, 21)",
                        BorderWidth: 2.5,
                        Size: 16
                    }
                }
            },
            RateCount: {
                ButtonGroup: {
                    Gap: 8
                },
                Container: {
                    BackgroundColor: "rgba(208, 217, 251, 0.16)",
                    BorderRadius: 8,
                    Gap: 8,
                    Spacing: 8
                }
            },
            SelectionCursor: {
                BorderWidth: 3,
                Gradient: {
                    End: "rgb(255, 255, 255)",
                    Start: "rgb(255, 255, 255)"
                },
                Inset: 0,
                Offset: 6
            },
            StatGroup: {
                Gap: 8
            },
            StatItem: {
                Container: {
                    ContentColor: "rgb(188, 190, 200)",
                    Gap: 2
                },
                Icon: {
                    Size: 16
                },
                Label: {
                    Typography: {
                        Font: '400 12/1.4 "Builder Sans"',
                        FontFamily: '"Builder Sans"',
                        FontSize: 12,
                        FontWeight: "400",
                        LetterSpacing: 0,
                        LineHeight: 1.4
                    }
                }
            },
            StatWidget: {
                Container: {
                    ContentColor: "rgb(247, 247, 248)",
                    Gap: 8
                },
                Data: {
                    Typography: {
                        Font: '700 28/1.2 "Builder Sans"',
                        FontFamily: '"Builder Sans"',
                        FontSize: 28,
                        FontWeight: "700",
                        LetterSpacing: -.01,
                        LineHeight: 1.2
                    }
                },
                DataGroup: {
                    Gap: 0
                },
                Icon: {
                    Size: 48
                },
                Label: {
                    Typography: {
                        Font: '700 16/1.4 "Builder Sans"',
                        FontFamily: '"Builder Sans"',
                        FontSize: 16,
                        FontWeight: "700",
                        LetterSpacing: 0,
                        LineHeight: 1.4
                    }
                }
            },
            StateLayer: {
                Base: {
                    BorderWidth: 1
                },
                Darken: {
                    Default: {
                        Color: "rgba(0, 0, 0, 0)"
                    },
                    Disabled: {
                        Color: "rgba(0, 0, 0, 0)"
                    },
                    Hover: {
                        Color: "rgba(27, 37, 75, 0.08)"
                    },
                    Initialize: {
                        Color: "rgba(0, 0, 0, 0)"
                    },
                    Pressed: {
                        Color: "rgba(27, 37, 75, 0.12)"
                    },
                    Selected: {
                        Color: "rgba(0, 0, 0, 0)"
                    },
                    SelectedPressed: {
                        Color: "rgba(27, 37, 75, 0.12)"
                    }
                },
                Inverse: {
                    Default: {
                        Color: "rgba(0, 0, 0, 0)"
                    },
                    Disabled: {
                        Color: "rgba(0, 0, 0, 0)"
                    },
                    Hover: {
                        Color: "rgba(27, 37, 75, 0.08)"
                    },
                    Initialize: {
                        Color: "rgba(0, 0, 0, 0)"
                    },
                    Pressed: {
                        Color: "rgba(27, 37, 75, 0.12)"
                    },
                    Selected: {
                        Color: "rgba(0, 0, 0, 0)"
                    },
                    SelectedPressed: {
                        Color: "rgba(27, 37, 75, 0.12)"
                    }
                },
                Lighten: {
                    Default: {
                        Color: "rgba(255, 255, 255, 0)"
                    },
                    Disabled: {
                        Color: "rgba(255, 255, 255, 0)"
                    },
                    Hover: {
                        Color: "rgba(208, 217, 251, 0.08)"
                    },
                    Initialize: {
                        Color: "rgba(255, 255, 255, 0)"
                    },
                    Pressed: {
                        Color: "rgba(208, 217, 251, 0.12)"
                    },
                    Selected: {
                        Color: "rgba(255, 255, 255, 0)"
                    },
                    SelectedPressed: {
                        Color: "rgba(208, 217, 251, 0.12)"
                    }
                },
                Standard: {
                    Default: {
                        Color: "rgba(255, 255, 255, 0)"
                    },
                    Disabled: {
                        Color: "rgba(255, 255, 255, 0)"
                    },
                    Hover: {
                        Color: "rgba(208, 217, 251, 0.08)"
                    },
                    Initialize: {
                        Color: "rgba(255, 255, 255, 0)"
                    },
                    Pressed: {
                        Color: "rgba(208, 217, 251, 0.12)"
                    },
                    Selected: {
                        Color: "rgba(255, 255, 255, 0)"
                    },
                    SelectedPressed: {
                        Color: "rgba(208, 217, 251, 0.12)"
                    }
                }
            },
            TextField: {
                Base: {
                    Field: {
                        BorderColor: "rgba(208, 217, 251, 0.16)",
                        BorderRadius: 8,
                        Gap: 8,
                        Opacity: 1,
                        Spacing: {
                            Leading: 12,
                            Trailing: 12
                        },
                        Typography: {
                            Font: '400 16/1.4 "Builder Sans"',
                            FontFamily: '"Builder Sans"',
                            FontSize: 16,
                            FontWeight: "400",
                            LetterSpacing: 0,
                            LineHeight: 1.4
                        }
                    },
                    FieldValue: {
                        ContentColor: "rgb(247, 247, 248)"
                    },
                    IconLeading: {
                        ContentColor: "rgb(188, 190, 200)",
                        Size: 16
                    },
                    PlaceholderText: {
                        ContentColor: "rgb(188, 190, 200)"
                    }
                },
                Disabled: {
                    Field: {
                        Opacity: .32
                    }
                },
                Error: {
                    Field: {
                        BorderColor: "rgba(0, 0, 0, 0)"
                    }
                }
            },
            VerticalScrollView: {
                Base: {
                    Handle: {
                        BackgroundColor: "rgba(208, 217, 251, 0.16)",
                        BorderRadius: 9999,
                        ContentColor: "rgb(247, 247, 248)"
                    },
                    Icon: {
                        Size: 36
                    },
                    Track: {
                        Opacity: 0,
                        Spacing: {
                            Bottom: 4,
                            Top: 4
                        }
                    }
                },
                Compact: {
                    Handle: {
                        Width: 2
                    },
                    Track: {
                        Width: 12
                    }
                },
                Gamepad: {
                    Handle: {
                        Width: 16
                    },
                    Track: {
                        Width: 16
                    }
                },
                Wide: {
                    Handle: {
                        Width: 8
                    },
                    Track: {
                        Width: 16
                    }
                }
            },
            VerticalTile: {
                Base: {
                    Container: {
                        Background: "rgb(39, 41, 48)",
                        BorderColor: "rgba(208, 217, 251, 0.16)",
                        BorderRadius: {
                            LeadingBottom: 8,
                            LeadingTop: 8,
                            TrailingBottom: 8,
                            TrailingTop: 8
                        },
                        BorderWidth: 1,
                        DropShadow: {
                            Blur: 8,
                            Color: "rgba(10, 10, 14, 0.75)",
                            X: 0,
                            Y: 4
                        }
                    },
                    ContentBottom: {
                        Spacing: {
                            Bottom: 8,
                            Leading: 8,
                            Top: 8,
                            Trailing: 8
                        }
                    },
                    ContentTop: {
                        Spacing: {
                            Bottom: 0,
                            Leading: 0,
                            Top: 0,
                            Trailing: 0
                        }
                    }
                }
            }
        },
        Config: {
            ColorMode: {
                IsDark: "true",
                IsLight: "false",
                Name: "Dark"
            },
            Text: {
                Font: '"Builder Sans"',
                Interval: 4,
                InverseScale: 1,
                NominalScale: 1,
                Scale: 1
            },
            Theme: {
                IsFoundation: "true",
                IsUIBlox: "false",
                Name: "Foundation"
            },
            UI: {
                Interval: 4,
                Scale: 1,
                StrokeBase: 1
            }
        },
        DarkMode: {
            ActionAlert: {
                Background: "rgba(208, 217, 251, 0.12)",
                Border: "rgba(0, 0, 0, 0)",
                Foreground: "rgb(240, 68, 51)"
            },
            ActionEmphasis: {
                Background: "rgb(51, 95, 255)",
                Border: "rgba(0, 0, 0, 0)",
                Foreground: "rgb(247, 247, 248)"
            },
            ActionLink: {
                Background: "rgba(0, 0, 0, 0)",
                Border: "rgba(0, 0, 0, 0)",
                Foreground: "rgb(247, 247, 248)"
            },
            ActionOverMedia: {
                Background: "rgb(247, 247, 248)",
                Border: "rgba(0, 0, 0, 0)",
                Foreground: "rgb(32, 34, 39)"
            },
            ActionSoftEmphasis: {
                Background: "rgba(51, 95, 255, 0.4)",
                Border: "rgba(0, 0, 0, 0)",
                Foreground: "rgb(235, 241, 255)"
            },
            ActionStandard: {
                Background: "rgba(208, 217, 251, 0.12)",
                Border: "rgba(0, 0, 0, 0)",
                Foreground: "rgb(247, 247, 248)"
            },
            ActionSubEmphasis: {
                Background: "rgb(247, 247, 248)",
                Border: "rgba(0, 0, 0, 0)",
                Foreground: "rgb(32, 34, 39)"
            },
            ActionSubtle: {
                Background: "rgba(0, 0, 0, 0)",
                Border: "rgb(213, 215, 221)",
                Foreground: "rgb(247, 247, 248)"
            },
            ActionUtility: {
                Background: "rgba(0, 0, 0, 0)",
                Border: "rgba(0, 0, 0, 0)",
                Foreground: "rgb(247, 247, 248)"
            },
            Common: {
                Backdrop: "rgba(10, 10, 14, 0.75)",
                HeavyDivider: "rgba(0, 0, 0, 0.5)",
                NavigationBar: "rgb(18, 18, 21)",
                Scrim: "rgba(10, 10, 14, 0.75)",
                Shadow: "rgba(0, 0, 0, 0.5)",
                Shimmer: "rgba(208, 217, 251, 0.12)"
            },
            Content: {
                Default: "rgb(213, 215, 221)",
                Emphasis: "rgb(247, 247, 248)",
                Link: "rgb(82, 139, 255)",
                Muted: "rgb(188, 190, 200)"
            },
            None: "rgba(0, 0, 0, 0)",
            OverMedia: {
                OverMedia_0: "rgba(18, 18, 21, 0.92)",
                OverMedia_100: "rgba(25, 26, 31, 0.92)",
                OverMedia_200: "rgba(32, 34, 39, 0.92)",
                OverMedia_300: "rgba(39, 41, 48, 0.92)"
            },
            Selection: {
                End: "rgb(255, 255, 255)",
                Start: "rgb(255, 255, 255)"
            },
            Shift: {
                Shift_100: "rgba(208, 217, 251, 0.04)",
                Shift_200: "rgba(208, 217, 251, 0.08)",
                Shift_300: "rgba(208, 217, 251, 0.12)",
                Shift_400: "rgba(208, 217, 251, 0.16)"
            },
            State: {
                Hover: "rgba(208, 217, 251, 0.08)",
                Idle: "rgba(255, 255, 255, 0)",
                Press: "rgba(208, 217, 251, 0.12)"
            },
            Stroke: {
                Default: "rgba(208, 217, 251, 0.12)",
                Emphasis: "rgba(208, 217, 251, 0.16)",
                Muted: "rgba(208, 217, 251, 0.08)"
            },
            Surface: {
                Surface_0: "rgb(18, 18, 21)",
                Surface_100: "rgb(25, 26, 31)",
                Surface_200: "rgb(32, 34, 39)",
                Surface_300: "rgb(39, 41, 48)"
            },
            System: {
                Alert: "rgb(223, 40, 31)",
                Contrast: "rgb(247, 247, 248)",
                Emphasis: "rgb(51, 95, 255)",
                Neutral: "rgb(188, 190, 200)",
                Success: "rgb(57, 197, 130)",
                Warning: "rgb(242, 186, 42)"
            }
        },
        Ease: {
            ExpressiveIn: {
                Bezier: "cubic-bezier(0.25, 0, 0.5, -1)",
                Raw: [.25, 0, .5, -1]
            },
            ExpressiveOut: {
                Bezier: "cubic-bezier(0.25, 1.5, 0.5, 1)",
                Raw: [.25, 1.5, .5, 1]
            },
            Linear: {
                Bezier: "cubic-bezier(0, 0, 1, 1)",
                Raw: [0, 0, 1, 1]
            },
            StandardIn: {
                Bezier: "cubic-bezier(0.8, 0, 0.4, 1)",
                Raw: [.8, 0, .4, 1]
            },
            StandardOut: {
                Bezier: "cubic-bezier(0.2, 0, 0, 1)",
                Raw: [.2, 0, 0, 1]
            }
        },
        FontSize: {
            FontSize_200: 8,
            FontSize_250: 10,
            FontSize_300: 12,
            FontSize_350: 14,
            FontSize_400: 16,
            FontSize_500: 20,
            FontSize_600: 24,
            FontSize_700: 28,
            FontSize_800: 32,
            FontSize_900: 36,
            FontSize_1000: 40,
            FontSize_1100: 44,
            FontSize_1200: 48,
            FontSize_1300: 52,
            FontSize_1400: 56,
            FontSize_1500: 60,
            FontSize_1600: 64,
            FontSize_1700: 68,
            FontSize_1800: 72,
            FontSize_1900: 76,
            FontSize_2000: 80,
            FontSize_2100: 84,
            FontSize_2200: 88,
            FontSize_2300: 92,
            FontSize_2400: 96,
            FontSize_2500: 100,
            FontSize_2600: 104,
            FontSize_2700: 108,
            FontSize_2800: 112,
            FontSize_2900: 116,
            FontSize_3000: 120
        },
        FontWeight: {
            FontWeight_300: "300",
            FontWeight_400: "400",
            FontWeight_500: "500",
            FontWeight_600: "600",
            FontWeight_700: "700",
            FontWeight_800: "800"
        },
        Gap: {
            Large: 16,
            Medium: 12,
            None: 0,
            Small: 8,
            XLarge: 20,
            XSmall: 4,
            XXLarge: 24,
            XXSmall: 2
        },
        Global: {
            Color: {
                Alabaster: "rgb(247, 247, 248)",
                Ash: "rgb(230, 231, 234)",
                Black: "rgb(0, 0, 0)",
                Blue: "rgb(51, 95, 255)",
                Carbon: "rgb(25, 26, 31)",
                Chalk: "rgb(213, 215, 221)",
                Flint: "rgb(39, 41, 48)",
                Graphite: "rgb(73, 77, 90)",
                Green: "rgb(57, 197, 130)",
                None: "rgba(0, 0, 0, 0)",
                Obsidian: "rgb(18, 18, 21)",
                Pumice: "rgb(188, 190, 200)",
                Red: "rgb(223, 40, 31)",
                Slate: "rgb(32, 34, 39)",
                Smoke: "rgb(53, 55, 65)",
                White: "rgb(255, 255, 255)"
            },
            Family: {
                Standard: '""Builder Sans""'
            },
            FontSize_25: 10,
            FontSize_50: 12,
            FontSize_75: 14,
            FontSize_100: 16,
            FontSize_200: 20,
            FontSize_300: 24,
            FontSize_400: 28,
            FontSize_500: 34,
            FontSize_600: 40,
            FontSize_700: 48,
            FontSize_800: 58,
            FontSize_900: 68,
            FontSize_1000: 82,
            LetterSpacing: {
                Default: 0
            },
            LineHeight_100: 1,
            LineHeight_200: 1.2,
            LineHeight_300: 1.3,
            LineHeight_400: 1.4,
            Opacity_0: 0,
            Opacity_8: .08,
            Opacity_12: .12,
            Opacity_16: .16,
            Opacity_32: .32,
            Opacity_68: .68,
            Opacity_84: .84,
            Opacity_88: .88,
            Opacity_92: .92,
            Opacity_100: 1,
            Size_0: 0,
            Size_25: 2,
            Size_50: 4,
            Size_75: 6,
            Size_100: 8,
            Size_150: 12,
            Size_200: 16,
            Size_250: 20,
            Size_300: 24,
            Size_350: 28,
            Size_400: 32,
            Size_450: 36,
            Size_500: 40,
            Size_600: 48,
            Size_700: 56,
            Size_800: 64,
            Size_900: 72,
            Size_1000: 80,
            Size_1100: 88,
            Size_1200: 96,
            Size_1300: 104,
            Size_1400: 112,
            Space_0: 0,
            Space_25: 2,
            Space_50: 4,
            Space_75: 6,
            Space_100: 8,
            Space_150: 12,
            Space_200: 16,
            Space_250: 20,
            Space_300: 24,
            Space_400: 32,
            Space_500: 40,
            Space_600: 48,
            Space_800: 64,
            Space_1000: 80,
            Stroke_50: .5,
            Stroke_100: 1,
            Stroke_150: 1.5,
            Stroke_200: 2,
            Stroke_250: 2.5,
            Stroke_300: 3,
            Stroke_400: 4,
            Weight_300: "300",
            Weight_400: "400",
            Weight_600: "500",
            Weight_700: "700",
            Weight_900: "800"
        },
        Gutter: {
            Large: 16,
            Medium: 12,
            None: 0,
            Small: 8,
            XLarge: 20,
            XXLarge: 24
        },
        IconSize: {
            Large: 24,
            Medium: 20,
            Small: 16,
            XLarge: 28,
            XSmall: 12
        },
        InputSize: {
            Large: 48,
            Medium: 40,
            Small: 32,
            XSmall: 24
        },
        Inverse: {
            ActionAlert: {
                Background: "rgba(27, 37, 75, 0.12)",
                Border: "rgba(0, 0, 0, 0)",
                Foreground: "rgb(217, 28, 21)"
            },
            ActionEmphasis: {
                Background: "rgb(51, 95, 255)",
                Border: "rgba(0, 0, 0, 0)",
                Foreground: "rgb(247, 247, 248)"
            },
            ActionLink: {
                Background: "rgba(0, 0, 0, 0)",
                Border: "rgba(0, 0, 0, 0)",
                Foreground: "rgb(32, 34, 39)"
            },
            ActionOverMedia: {
                Background: "rgb(32, 34, 39)",
                Border: "rgba(0, 0, 0, 0)",
                Foreground: "rgb(247, 247, 248)"
            },
            ActionSoftEmphasis: {
                Background: "rgba(51, 95, 255, 0.3)",
                Border: "rgba(0, 0, 0, 0)",
                Foreground: "rgb(0, 20, 92)"
            },
            ActionStandard: {
                Background: "rgba(27, 37, 75, 0.12)",
                Border: "rgba(0, 0, 0, 0)",
                Foreground: "rgb(32, 34, 39)"
            },
            ActionSubEmphasis: {
                Background: "rgb(32, 34, 39)",
                Border: "rgba(0, 0, 0, 0)",
                Foreground: "rgb(247, 247, 248)"
            },
            ActionSubtle: {
                Background: "rgba(0, 0, 0, 0)",
                Border: "rgb(73, 77, 90)",
                Foreground: "rgb(32, 34, 39)"
            },
            ActionUtility: {
                Background: "rgba(0, 0, 0, 0)",
                Border: "rgba(0, 0, 0, 0)",
                Foreground: "rgb(32, 34, 39)"
            },
            Common: {
                Backdrop: "rgba(10, 10, 14, 0.5)",
                HeavyDivider: "rgba(27, 37, 75, 0.04)",
                NavigationBar: "rgb(255, 255, 255)",
                Scrim: "rgba(10, 10, 14, 0.5)",
                Shadow: "rgba(0, 0, 0, 0.5)",
                Shimmer: "rgba(27, 37, 75, 0.12)"
            },
            Content: {
                Default: "rgb(73, 77, 90)",
                Emphasis: "rgb(32, 34, 39)",
                Link: "rgb(20, 70, 255)",
                Muted: "rgb(106, 111, 129)"
            },
            None: "rgba(0, 0, 0, 0)",
            OverMedia: {
                OverMedia_0: "rgba(255, 255, 255, 0.92)",
                OverMedia_100: "rgba(247, 247, 248, 0.92)",
                OverMedia_200: "rgba(255, 255, 255, 0.92)",
                OverMedia_300: "rgba(247, 247, 248, 0.92)"
            },
            Selection: {
                End: "rgb(51, 95, 255)",
                Start: "rgb(51, 95, 255)"
            },
            Shift: {
                Shift_100: "rgba(27, 37, 75, 0.04)",
                Shift_200: "rgba(27, 37, 75, 0.08)",
                Shift_300: "rgba(27, 37, 75, 0.12)",
                Shift_400: "rgba(27, 37, 75, 0.16)"
            },
            State: {
                Hover: "rgba(27, 37, 75, 0.08)",
                Idle: "rgba(0, 0, 0, 0)",
                Press: "rgba(27, 37, 75, 0.12)"
            },
            Stroke: {
                Default: "rgba(27, 37, 75, 0.12)",
                Emphasis: "rgba(27, 37, 75, 0.16)",
                Muted: "rgba(27, 37, 75, 0.08)"
            },
            Surface: {
                Surface_0: "rgb(255, 255, 255)",
                Surface_100: "rgb(247, 247, 248)",
                Surface_200: "rgb(255, 255, 255)",
                Surface_300: "rgb(247, 247, 248)"
            },
            System: {
                Alert: "rgb(223, 40, 31)",
                Contrast: "rgb(32, 34, 39)",
                Emphasis: "rgb(51, 95, 255)",
                Neutral: "rgb(73, 77, 90)",
                Success: "rgb(57, 197, 130)",
                Warning: "rgb(242, 186, 42)"
            }
        },
        LetterSpacing: {
            Default: 0,
            Loose: .01,
            Tight: -.01
        },
        LightMode: {
            ActionAlert: {
                Background: "rgba(27, 37, 75, 0.12)",
                Border: "rgba(0, 0, 0, 0)",
                Foreground: "rgb(217, 28, 21)"
            },
            ActionEmphasis: {
                Background: "rgb(51, 95, 255)",
                Border: "rgba(0, 0, 0, 0)",
                Foreground: "rgb(247, 247, 248)"
            },
            ActionLink: {
                Background: "rgba(0, 0, 0, 0)",
                Border: "rgba(0, 0, 0, 0)",
                Foreground: "rgb(32, 34, 39)"
            },
            ActionOverMedia: {
                Background: "rgb(32, 34, 39)",
                Border: "rgba(0, 0, 0, 0)",
                Foreground: "rgb(247, 247, 248)"
            },
            ActionSoftEmphasis: {
                Background: "rgba(51, 95, 255, 0.3)",
                Border: "rgba(0, 0, 0, 0)",
                Foreground: "rgb(0, 20, 92)"
            },
            ActionStandard: {
                Background: "rgba(27, 37, 75, 0.12)",
                Border: "rgba(0, 0, 0, 0)",
                Foreground: "rgb(32, 34, 39)"
            },
            ActionSubEmphasis: {
                Background: "rgb(32, 34, 39)",
                Border: "rgba(0, 0, 0, 0)",
                Foreground: "rgb(247, 247, 248)"
            },
            ActionSubtle: {
                Background: "rgba(0, 0, 0, 0)",
                Border: "rgb(73, 77, 90)",
                Foreground: "rgb(32, 34, 39)"
            },
            ActionUtility: {
                Background: "rgba(0, 0, 0, 0)",
                Border: "rgba(0, 0, 0, 0)",
                Foreground: "rgb(32, 34, 39)"
            },
            Common: {
                Backdrop: "rgba(10, 10, 14, 0.5)",
                HeavyDivider: "rgba(27, 37, 75, 0.04)",
                NavigationBar: "rgb(255, 255, 255)",
                Scrim: "rgba(10, 10, 14, 0.5)",
                Shadow: "rgba(0, 0, 0, 0.5)",
                Shimmer: "rgba(27, 37, 75, 0.12)"
            },
            Content: {
                Default: "rgb(73, 77, 90)",
                Emphasis: "rgb(32, 34, 39)",
                Link: "rgb(20, 70, 255)",
                Muted: "rgb(106, 111, 129)"
            },
            None: "rgba(0, 0, 0, 0)",
            OverMedia: {
                OverMedia_0: "rgba(255, 255, 255, 0.92)",
                OverMedia_100: "rgba(247, 247, 248, 0.92)",
                OverMedia_200: "rgba(255, 255, 255, 0.92)",
                OverMedia_300: "rgba(247, 247, 248, 0.92)"
            },
            Selection: {
                End: "rgb(51, 95, 255)",
                Start: "rgb(51, 95, 255)"
            },
            Shift: {
                Shift_100: "rgba(27, 37, 75, 0.04)",
                Shift_200: "rgba(27, 37, 75, 0.08)",
                Shift_300: "rgba(27, 37, 75, 0.12)",
                Shift_400: "rgba(27, 37, 75, 0.16)"
            },
            State: {
                Hover: "rgba(27, 37, 75, 0.08)",
                Idle: "rgba(0, 0, 0, 0)",
                Press: "rgba(27, 37, 75, 0.12)"
            },
            Stroke: {
                Default: "rgba(27, 37, 75, 0.12)",
                Emphasis: "rgba(27, 37, 75, 0.16)",
                Muted: "rgba(27, 37, 75, 0.08)"
            },
            Surface: {
                Surface_0: "rgb(255, 255, 255)",
                Surface_100: "rgb(247, 247, 248)",
                Surface_200: "rgb(255, 255, 255)",
                Surface_300: "rgb(247, 247, 248)"
            },
            System: {
                Alert: "rgb(223, 40, 31)",
                Contrast: "rgb(32, 34, 39)",
                Emphasis: "rgb(51, 95, 255)",
                Neutral: "rgb(73, 77, 90)",
                Success: "rgb(57, 197, 130)",
                Warning: "rgb(242, 186, 42)"
            }
        },
        LineHeight: {
            LineHeight_100: 1,
            LineHeight_120: 1.2,
            LineHeight_130: 1.3,
            LineHeight_140: 1.4
        },
        Margin: {
            Large: 48,
            Medium: 24,
            None: 0,
            Small: 20
        },
        Padding: {
            Large: 16,
            Medium: 12,
            None: 0,
            Small: 8,
            XLarge: 20,
            XSmall: 4,
            XXLarge: 24,
            XXSmall: 2
        },
        Platform: {
            Base: 4,
            Rem: 8,
            Scale: 1
        },
        Radius: {
            Circle: 9999,
            Large: 16,
            Medium: 8,
            None: 0,
            Small: 4,
            XSmall: 2
        },
        Semantic: {
            Color: {
                Action: {
                    Alert: {
                        Background: "rgba(208, 217, 251, 0.12)",
                        Border: "rgba(0, 0, 0, 0)",
                        Content: "rgb(240, 68, 51)"
                    },
                    Primary: {
                        Background: "rgb(247, 247, 248)",
                        Border: "rgba(0, 0, 0, 0)",
                        Content: "rgb(32, 34, 39)"
                    },
                    PrimaryBrand: {
                        Background: "rgb(51, 95, 255)",
                        Border: "rgba(0, 0, 0, 0)",
                        Content: "rgb(247, 247, 248)"
                    },
                    Secondary: {
                        Background: "rgba(0, 0, 0, 0)",
                        Border: "rgb(213, 215, 221)",
                        Content: "rgb(247, 247, 248)"
                    },
                    Subtle: {
                        Background: "rgba(0, 0, 0, 0)",
                        Border: "rgba(0, 0, 0, 0)",
                        Content: "rgb(247, 247, 248)"
                    }
                },
                Background: {
                    Contrast: "rgb(25, 26, 31)",
                    Default: "rgb(18, 18, 21)",
                    Muted: "rgb(32, 34, 39)",
                    OnHover: "rgba(208, 217, 251, 0.08)",
                    OnPress: "rgba(208, 217, 251, 0.12)"
                },
                BackgroundUi: {
                    Contrast: "rgba(18, 18, 21, 0.92)",
                    Default: "rgb(39, 41, 48)"
                },
                Common: {
                    Alert: "rgb(223, 40, 31)",
                    Badge: "rgb(247, 247, 248)",
                    BadgeContent: "rgb(32, 34, 39)",
                    Divider: "rgba(208, 217, 251, 0.16)",
                    DropShadow: "rgba(0, 0, 0, 0.5)",
                    NavigationBar: "rgb(18, 18, 21)",
                    Offline: "rgb(188, 190, 200)",
                    Online: "rgb(57, 197, 130)",
                    Overlay: "rgba(10, 10, 14, 0.75)",
                    Placeholder: "rgba(208, 217, 251, 0.12)",
                    Success: "rgb(57, 197, 130)"
                },
                Focus: {
                    End: "rgb(255, 255, 255)",
                    Gradient: "rgb(255, 255, 255)",
                    Start: "rgb(255, 255, 255)"
                },
                Icon: {
                    Default: "rgb(213, 215, 221)",
                    Emphasis: "rgb(247, 247, 248)",
                    OnHover: "rgb(247, 247, 248)"
                },
                State: {
                    Darken: {
                        Default: "rgba(0, 0, 0, 0)",
                        Hover: "rgba(27, 37, 75, 0.08)",
                        Pressed: "rgba(27, 37, 75, 0.12)"
                    },
                    Inverse: {
                        Default: "rgba(0, 0, 0, 0)",
                        Hover: "rgba(27, 37, 75, 0.08)",
                        Pressed: "rgba(27, 37, 75, 0.12)"
                    },
                    Lighten: {
                        Default: "rgba(255, 255, 255, 0)",
                        Hover: "rgba(208, 217, 251, 0.08)",
                        Pressed: "rgba(208, 217, 251, 0.12)"
                    },
                    Standard: {
                        Default: "rgba(255, 255, 255, 0)",
                        Hover: "rgba(208, 217, 251, 0.08)",
                        Pressed: "rgba(208, 217, 251, 0.12)"
                    }
                },
                Text: {
                    Default: "rgb(213, 215, 221)",
                    Emphasis: "rgb(247, 247, 248)",
                    Inverse: "rgb(73, 77, 90)",
                    Link: "rgb(82, 139, 255)",
                    Muted: "rgb(188, 190, 200)"
                },
                Ui: {
                    Default: "rgba(208, 217, 251, 0.08)",
                    Emphasis: "rgba(208, 217, 251, 0.16)",
                    Muted: "rgba(208, 217, 251, 0.04)"
                }
            },
            Icon: {
                Size: {
                    Large: 48,
                    Medium: 36,
                    Small: 16,
                    XLarge: 96,
                    XXLarge: 192
                }
            },
            Offset: {
                Focus: {
                    Inset: 0,
                    Standard: 6
                }
            },
            Opacity: {
                State: {
                    Darken: {
                        Hover: .12,
                        Pressed: .2
                    },
                    Lighten: {
                        Hover: .12,
                        Pressed: .2
                    }
                }
            },
            Radius: {
                Circle: 9999,
                Large: 12,
                Medium: 8,
                None: 0,
                Small: 4,
                XLarge: 16
            },
            Stroke: {
                Focus: 3,
                Input: 1
            },
            Typography: {
                Body: {
                    Font: '400 16/1.4 "Builder Sans"',
                    FontFamily: '"Builder Sans"',
                    FontSize: 16,
                    FontWeight: "400",
                    LetterSpacing: 0,
                    LineHeight: 1.4
                },
                CaptionBody: {
                    Font: '400 12/1.4 "Builder Sans"',
                    FontFamily: '"Builder Sans"',
                    FontSize: 12,
                    FontWeight: "400",
                    LetterSpacing: 0,
                    LineHeight: 1.4
                },
                CaptionHeader: {
                    Font: '600 14/1.4 "Builder Sans"',
                    FontFamily: '"Builder Sans"',
                    FontSize: 14,
                    FontWeight: "600",
                    LetterSpacing: 0,
                    LineHeight: 1.4
                },
                Footer: {
                    Font: '600 10/1.4 "Builder Sans"',
                    FontFamily: '"Builder Sans"',
                    FontSize: 10,
                    FontWeight: "600",
                    LetterSpacing: 0,
                    LineHeight: 1.4
                },
                Header: {
                    Font: '700 20/1.2 "Builder Sans"',
                    FontFamily: '"Builder Sans"',
                    FontSize: 20,
                    FontWeight: "700",
                    LetterSpacing: -.01,
                    LineHeight: 1.2
                },
                Subheader: {
                    Font: '700 16/1.4 "Builder Sans"',
                    FontFamily: '"Builder Sans"',
                    FontSize: 16,
                    FontWeight: "700",
                    LetterSpacing: 0,
                    LineHeight: 1.4
                },
                Title: {
                    Font: '700 28/1.2 "Builder Sans"',
                    FontFamily: '"Builder Sans"',
                    FontSize: 28,
                    FontWeight: "700",
                    LetterSpacing: -.01,
                    LineHeight: 1.2
                }
            }
        },
        Size: {
            Size_0: 0,
            Size_50: 2,
            Size_100: 4,
            Size_150: 6,
            Size_200: 8,
            Size_250: 10,
            Size_300: 12,
            Size_350: 14,
            Size_400: 16,
            Size_500: 20,
            Size_600: 24,
            Size_700: 28,
            Size_800: 32,
            Size_900: 36,
            Size_1000: 40,
            Size_1100: 44,
            Size_1200: 48,
            Size_1300: 52,
            Size_1400: 56,
            Size_1500: 60,
            Size_1600: 64,
            Size_1700: 68,
            Size_1800: 72,
            Size_1900: 76,
            Size_2000: 80,
            Size_2100: 84,
            Size_2200: 88,
            Size_2300: 92,
            Size_2400: 96,
            Size_2500: 100,
            Size_2600: 104,
            Size_2700: 108,
            Size_2800: 112,
            Size_2900: 116,
            Size_3000: 120
        },
        Stroke: {
            None: 0,
            Standard: 1,
            Thick: 1.5,
            Thicker: 3,
            Thin: .5
        },
        Time: {
            Time_50: .05,
            Time_100: .1,
            Time_200: .2,
            Time_300: .3,
            Time_400: .4,
            Time_500: .5,
            Time_600: .6,
            Time_700: .7,
            Time_800: .8,
            Time_900: .9,
            Time_1000: 1
        },
        ToggleSize: {
            Large: 28,
            Medium: 24,
            Small: 20,
            XSmall: 16
        },
        Typography: {
            BodyLarge: {
                Font: '400 16/1.4 "Builder Sans"',
                FontFamily: '"Builder Sans"',
                FontSize: 16,
                FontWeight: "400",
                LetterSpacing: 0,
                LineHeight: 1.4
            },
            BodyMedium: {
                Font: '400 14/1.4 "Builder Sans"',
                FontFamily: '"Builder Sans"',
                FontSize: 14,
                FontWeight: "400",
                LetterSpacing: 0,
                LineHeight: 1.4
            },
            BodySmall: {
                Font: '400 12/1.4 "Builder Sans"',
                FontFamily: '"Builder Sans"',
                FontSize: 12,
                FontWeight: "400",
                LetterSpacing: 0,
                LineHeight: 1.4
            },
            CaptionLarge: {
                Font: '600 14/1.4 "Builder Sans"',
                FontFamily: '"Builder Sans"',
                FontSize: 14,
                FontWeight: "600",
                LetterSpacing: 0,
                LineHeight: 1.4
            },
            CaptionMedium: {
                Font: '600 12/1.4 "Builder Sans"',
                FontFamily: '"Builder Sans"',
                FontSize: 12,
                FontWeight: "600",
                LetterSpacing: 0,
                LineHeight: 1.4
            },
            CaptionSmall: {
                Font: '600 10/1.4 "Builder Sans"',
                FontFamily: '"Builder Sans"',
                FontSize: 10,
                FontWeight: "600",
                LetterSpacing: 0,
                LineHeight: 1.4
            },
            DisplayLarge: {
                Font: '700 80/1.2 "Builder Sans"',
                FontFamily: '"Builder Sans"',
                FontSize: 80,
                FontWeight: "700",
                LetterSpacing: -.01,
                LineHeight: 1.2
            },
            DisplayMedium: {
                Font: '700 56/1.2 "Builder Sans"',
                FontFamily: '"Builder Sans"',
                FontSize: 56,
                FontWeight: "700",
                LetterSpacing: -.01,
                LineHeight: 1.2
            },
            DisplaySmall: {
                Font: '700 40/1.2 "Builder Sans"',
                FontFamily: '"Builder Sans"',
                FontSize: 40,
                FontWeight: "700",
                LetterSpacing: -.01,
                LineHeight: 1.2
            },
            HeadingLarge: {
                Font: '700 28/1.2 "Builder Sans"',
                FontFamily: '"Builder Sans"',
                FontSize: 28,
                FontWeight: "700",
                LetterSpacing: -.01,
                LineHeight: 1.2
            },
            HeadingMedium: {
                Font: '700 24/1.2 "Builder Sans"',
                FontFamily: '"Builder Sans"',
                FontSize: 24,
                FontWeight: "700",
                LetterSpacing: -.01,
                LineHeight: 1.2
            },
            HeadingSmall: {
                Font: '700 20/1.2 "Builder Sans"',
                FontFamily: '"Builder Sans"',
                FontSize: 20,
                FontWeight: "700",
                LetterSpacing: -.01,
                LineHeight: 1.2
            },
            LabelLarge: {
                Font: '600 16/1 "Builder Sans"',
                FontFamily: '"Builder Sans"',
                FontSize: 16,
                FontWeight: "600",
                LetterSpacing: 0,
                LineHeight: 1
            },
            LabelMedium: {
                Font: '600 14/1 "Builder Sans"',
                FontFamily: '"Builder Sans"',
                FontSize: 14,
                FontWeight: "600",
                LetterSpacing: 0,
                LineHeight: 1
            },
            LabelSmall: {
                Font: '600 12/1 "Builder Sans"',
                FontFamily: '"Builder Sans"',
                FontSize: 12,
                FontWeight: "600",
                LetterSpacing: 0,
                LineHeight: 1
            },
            TitleLarge: {
                Font: '700 16/1.4 "Builder Sans"',
                FontFamily: '"Builder Sans"',
                FontSize: 16,
                FontWeight: "700",
                LetterSpacing: 0,
                LineHeight: 1.4
            },
            TitleMedium: {
                Font: '700 14/1.4 "Builder Sans"',
                FontFamily: '"Builder Sans"',
                FontSize: 14,
                FontWeight: "700",
                LetterSpacing: 0,
                LineHeight: 1.4
            },
            TitleSmall: {
                Font: '700 12/1.4 "Builder Sans"',
                FontFamily: '"Builder Sans"',
                FontSize: 12,
                FontWeight: "700",
                LetterSpacing: 0,
                LineHeight: 1.4
            }
        }
    };
    var i, o, n = {};
    Object.defineProperty(n, "__esModule", {
        value: !0
    }), n.TokensLight = void 0, n.TokensLight = {
        Color: {
            ActionAlert: {
                Background: "rgba(27, 37, 75, 0.12)",
                Border: "rgba(0, 0, 0, 0)",
                Foreground: "rgb(217, 28, 21)"
            },
            ActionEmphasis: {
                Background: "rgb(51, 95, 255)",
                Border: "rgba(0, 0, 0, 0)",
                Foreground: "rgb(247, 247, 248)"
            },
            ActionLink: {
                Background: "rgba(0, 0, 0, 0)",
                Border: "rgba(0, 0, 0, 0)",
                Foreground: "rgb(32, 34, 39)"
            },
            ActionOverMedia: {
                Background: "rgb(32, 34, 39)",
                Border: "rgba(0, 0, 0, 0)",
                Foreground: "rgb(247, 247, 248)"
            },
            ActionSoftEmphasis: {
                Background: "rgba(51, 95, 255, 0.3)",
                Border: "rgba(0, 0, 0, 0)",
                Foreground: "rgb(0, 20, 92)"
            },
            ActionStandard: {
                Background: "rgba(27, 37, 75, 0.12)",
                Border: "rgba(0, 0, 0, 0)",
                Foreground: "rgb(32, 34, 39)"
            },
            ActionSubEmphasis: {
                Background: "rgb(32, 34, 39)",
                Border: "rgba(0, 0, 0, 0)",
                Foreground: "rgb(247, 247, 248)"
            },
            ActionSubtle: {
                Background: "rgba(0, 0, 0, 0)",
                Border: "rgb(73, 77, 90)",
                Foreground: "rgb(32, 34, 39)"
            },
            ActionUtility: {
                Background: "rgba(0, 0, 0, 0)",
                Border: "rgba(0, 0, 0, 0)",
                Foreground: "rgb(32, 34, 39)"
            },
            Common: {
                Backdrop: "rgba(10, 10, 14, 0.5)",
                HeavyDivider: "rgba(27, 37, 75, 0.04)",
                NavigationBar: "rgb(255, 255, 255)",
                Scrim: "rgba(10, 10, 14, 0.5)",
                Shadow: "rgba(0, 0, 0, 0.5)",
                Shimmer: "rgba(27, 37, 75, 0.12)"
            },
            Content: {
                Default: "rgb(73, 77, 90)",
                Emphasis: "rgb(32, 34, 39)",
                Link: "rgb(20, 70, 255)",
                Muted: "rgb(106, 111, 129)"
            },
            Extended: {
                Black: {
                    Black_0: "rgba(0, 0, 0, 0)",
                    Black_03: "rgba(0, 0, 0, 0.03)",
                    Black_05: "rgba(0, 0, 0, 0.05)",
                    Black_10: "rgba(0, 0, 0, 0.1)",
                    Black_15: "rgba(0, 0, 0, 0.15)",
                    Black_20: "rgba(0, 0, 0, 0.2)",
                    Black_30: "rgba(0, 0, 0, 0.3)",
                    Black_40: "rgba(0, 0, 0, 0.4)",
                    Black_50: "rgba(0, 0, 0, 0.5)",
                    Black_60: "rgba(0, 0, 0, 0.6)",
                    Black_70: "rgba(0, 0, 0, 0.7)",
                    Black_80: "rgba(0, 0, 0, 0.8)",
                    Black_85: "rgba(0, 0, 0, 0.85)",
                    Black_90: "rgba(0, 0, 0, 0.9)",
                    Black_95: "rgba(0, 0, 0, 0.95)",
                    Black_97: "rgba(0, 0, 0, 0.97)",
                    Black_100: "rgb(0, 0, 0)"
                },
                Blue: {
                    Blue_100: "rgb(235, 241, 255)",
                    Blue_200: "rgb(204, 221, 255)",
                    Blue_300: "rgb(173, 201, 255)",
                    Blue_400: "rgb(143, 180, 255)",
                    Blue_500: "rgb(112, 160, 255)",
                    Blue_600: "rgb(82, 139, 255)",
                    Blue_700: "rgb(51, 95, 255)",
                    Blue_800: "rgb(20, 70, 255)",
                    Blue_900: "rgb(0, 53, 245)",
                    Blue_1000: "rgb(0, 45, 214)",
                    Blue_1100: "rgb(0, 39, 184)",
                    Blue_1200: "rgb(0, 34, 153)",
                    Blue_1300: "rgb(0, 27, 122)",
                    Blue_1400: "rgb(0, 20, 92)"
                },
                Gray: {
                    Gray_100: "rgb(247, 247, 248)",
                    Gray_200: "rgb(238, 239, 241)",
                    Gray_300: "rgb(230, 231, 234)",
                    Gray_400: "rgb(213, 215, 221)",
                    Gray_500: "rgb(188, 190, 200)",
                    Gray_600: "rgb(106, 111, 129)",
                    Gray_700: "rgb(73, 77, 90)",
                    Gray_800: "rgb(53, 55, 65)",
                    Gray_900: "rgb(39, 41, 48)",
                    Gray_1000: "rgb(32, 34, 39)",
                    Gray_1100: "rgb(25, 26, 31)",
                    Gray_1200: "rgb(18, 18, 21)"
                },
                Green: {
                    Green_100: "rgb(208, 251, 227)",
                    Green_200: "rgb(176, 246, 208)",
                    Green_300: "rgb(142, 233, 182)",
                    Green_400: "rgb(101, 215, 157)",
                    Green_500: "rgb(57, 197, 130)",
                    Green_600: "rgb(29, 177, 106)",
                    Green_700: "rgb(12, 155, 90)",
                    Green_800: "rgb(1, 133, 75)",
                    Green_900: "rgb(2, 114, 64)",
                    Green_1000: "rgb(1, 95, 53)",
                    Green_1100: "rgb(0, 74, 41)",
                    Green_1200: "rgb(1, 56, 31)",
                    Green_1300: "rgb(10, 38, 18)",
                    Green_1400: "rgb(0, 22, 12)"
                },
                Magenta: {
                    Magenta_100: "rgb(253, 232, 249)",
                    Magenta_200: "rgb(253, 221, 253)",
                    Magenta_300: "rgb(245, 200, 252)",
                    Magenta_400: "rgb(239, 170, 250)",
                    Magenta_500: "rgb(232, 139, 248)",
                    Magenta_600: "rgb(223, 106, 247)",
                    Magenta_700: "rgb(213, 64, 245)",
                    Magenta_800: "rgb(192, 10, 232)",
                    Magenta_900: "rgb(165, 14, 200)",
                    Magenta_1000: "rgb(138, 12, 167)",
                    Magenta_1100: "rgb(110, 7, 133)",
                    Magenta_1200: "rgb(84, 4, 103)",
                    Magenta_1300: "rgb(60, 2, 74)",
                    Magenta_1400: "rgb(35, 4, 42)"
                },
                Orange: {
                    Orange_100: "rgb(253, 232, 216)",
                    Orange_200: "rgb(252, 222, 199)",
                    Orange_300: "rgb(251, 206, 174)",
                    Orange_400: "rgb(251, 178, 134)",
                    Orange_500: "rgb(250, 148, 90)",
                    Orange_600: "rgb(245, 118, 48)",
                    Orange_700: "rgb(220, 100, 35)",
                    Orange_800: "rgb(192, 80, 20)",
                    Orange_900: "rgb(169, 67, 11)",
                    Orange_1000: "rgb(144, 51, 0)",
                    Orange_1100: "rgb(115, 40, 0)",
                    Orange_1200: "rgb(87, 30, 0)",
                    Orange_1300: "rgb(60, 21, 0)",
                    Orange_1400: "rgb(33, 13, 1)"
                },
                Pink: {
                    Pink_100: "rgb(255, 230, 242)",
                    Pink_200: "rgb(254, 220, 236)",
                    Pink_300: "rgb(250, 202, 224)",
                    Pink_400: "rgb(247, 173, 207)",
                    Pink_500: "rgb(243, 143, 184)",
                    Pink_600: "rgb(238, 114, 161)",
                    Pink_700: "rgb(231, 78, 144)",
                    Pink_800: "rgb(205, 55, 123)",
                    Pink_900: "rgb(180, 43, 106)",
                    Pink_1000: "rgb(153, 29, 88)",
                    Pink_1100: "rgb(99, 3, 53)",
                    Pink_1200: "rgb(99, 3, 53)",
                    Pink_1300: "rgb(70, 4, 36)",
                    Pink_1400: "rgb(43, 2, 21)"
                },
                Purple: {
                    Purple_100: "rgb(241, 231, 255)",
                    Purple_200: "rgb(233, 222, 251)",
                    Purple_300: "rgb(226, 206, 253)",
                    Purple_400: "rgb(212, 181, 252)",
                    Purple_500: "rgb(197, 156, 249)",
                    Purple_600: "rgb(182, 130, 247)",
                    Purple_700: "rgb(167, 102, 245)",
                    Purple_800: "rgb(147, 72, 240)",
                    Purple_900: "rgb(130, 46, 231)",
                    Purple_1000: "rgb(108, 33, 198)",
                    Purple_1100: "rgb(86, 20, 165)",
                    Purple_1200: "rgb(65, 8, 134)",
                    Purple_1300: "rgb(45, 4, 96)",
                    Purple_1400: "rgb(28, 2, 59)"
                },
                Red: {
                    Red_100: "rgb(255, 234, 233)",
                    Red_200: "rgb(255, 223, 222)",
                    Red_300: "rgb(247, 205, 203)",
                    Red_400: "rgb(243, 178, 174)",
                    Red_500: "rgb(238, 151, 145)",
                    Red_600: "rgb(235, 121, 115)",
                    Red_700: "rgb(231, 87, 80)",
                    Red_800: "rgb(223, 40, 31)",
                    Red_900: "rgb(197, 18, 10)",
                    Red_1000: "rgb(164, 17, 9)",
                    Red_1100: "rgb(131, 15, 7)",
                    Red_1200: "rgb(100, 12, 5)",
                    Red_1300: "rgb(71, 8, 4)",
                    Red_1400: "rgb(40, 6, 3)"
                },
                Turquoise: {
                    Turquoise_100: "rgb(200, 246, 255)",
                    Turquoise_200: "rgb(163, 239, 254)",
                    Turquoise_300: "rgb(126, 229, 248)",
                    Turquoise_400: "rgb(92, 210, 232)",
                    Turquoise_500: "rgb(57, 189, 216)",
                    Turquoise_600: "rgb(22, 169, 199)",
                    Turquoise_700: "rgb(4, 148, 178)",
                    Turquoise_800: "rgb(18, 125, 152)",
                    Turquoise_900: "rgb(5, 108, 130)",
                    Turquoise_1000: "rgb(5, 90, 106)",
                    Turquoise_1100: "rgb(4, 71, 84)",
                    Turquoise_1200: "rgb(2, 53, 63)",
                    Turquoise_1300: "rgb(2, 37, 44)",
                    Turquoise_1400: "rgb(2, 20, 24)"
                },
                White: {
                    White_0: "rgba(255, 255, 255, 0)",
                    White_03: "rgba(255, 255, 255, 0.03)",
                    White_05: "rgba(255, 255, 255, 0.05)",
                    White_10: "rgba(255, 255, 255, 0.1)",
                    White_15: "rgba(255, 255, 255, 0.15)",
                    White_20: "rgba(255, 255, 255, 0.2)",
                    White_30: "rgba(255, 255, 255, 0.3)",
                    White_40: "rgba(255, 255, 255, 0.4)",
                    White_50: "rgba(255, 255, 255, 0.5)",
                    White_60: "rgba(255, 255, 255, 0.6)",
                    White_70: "rgba(255, 255, 255, 0.7)",
                    White_80: "rgba(255, 255, 255, 0.8)",
                    White_85: "rgba(255, 255, 255, 0.85)",
                    White_90: "rgba(255, 255, 255, 0.9)",
                    White_95: "rgba(255, 255, 255, 0.95)",
                    White_97: "rgba(255, 255, 255, 0.97)",
                    White_100: "rgb(255, 255, 255)"
                },
                Yellow: {
                    Yellow_100: "rgb(253, 236, 193)",
                    Yellow_200: "rgb(250, 228, 170)",
                    Yellow_300: "rgb(247, 210, 115)",
                    Yellow_400: "rgb(242, 186, 42)",
                    Yellow_500: "rgb(219, 166, 31)",
                    Yellow_600: "rgb(196, 147, 21)",
                    Yellow_700: "rgb(174, 128, 11)",
                    Yellow_800: "rgb(151, 108, 0)",
                    Yellow_900: "rgb(129, 93, 0)",
                    Yellow_1000: "rgb(107, 76, 0)",
                    Yellow_1100: "rgb(83, 61, 2)",
                    Yellow_1200: "rgb(63, 45, 1)",
                    Yellow_1300: "rgb(44, 31, 0)",
                    Yellow_1400: "rgb(24, 17, 0)"
                }
            },
            None: "rgba(0, 0, 0, 0)",
            OverMedia: {
                OverMedia_0: "rgba(255, 255, 255, 0.92)",
                OverMedia_100: "rgba(247, 247, 248, 0.92)",
                OverMedia_200: "rgba(255, 255, 255, 0.92)",
                OverMedia_300: "rgba(247, 247, 248, 0.92)"
            },
            Selection: {
                End: "rgb(51, 95, 255)",
                Start: "rgb(51, 95, 255)"
            },
            Shift: {
                Shift_100: "rgba(27, 37, 75, 0.04)",
                Shift_200: "rgba(27, 37, 75, 0.08)",
                Shift_300: "rgba(27, 37, 75, 0.12)",
                Shift_400: "rgba(27, 37, 75, 0.16)"
            },
            State: {
                Hover: "rgba(27, 37, 75, 0.08)",
                Idle: "rgba(0, 0, 0, 0)",
                Press: "rgba(27, 37, 75, 0.12)"
            },
            Stroke: {
                Default: "rgba(27, 37, 75, 0.12)",
                Emphasis: "rgba(27, 37, 75, 0.16)",
                Muted: "rgba(27, 37, 75, 0.08)"
            },
            Surface: {
                Surface_0: "rgb(255, 255, 255)",
                Surface_100: "rgb(247, 247, 248)",
                Surface_200: "rgb(255, 255, 255)",
                Surface_300: "rgb(247, 247, 248)"
            },
            System: {
                Alert: "rgb(223, 40, 31)",
                Contrast: "rgb(32, 34, 39)",
                Emphasis: "rgb(51, 95, 255)",
                Neutral: "rgb(73, 77, 90)",
                Success: "rgb(57, 197, 130)",
                Warning: "rgb(242, 186, 42)"
            }
        },
        Component: {
            BaseMenu: {
                BackgroundColor: "rgb(247, 247, 248)",
                BorderRadius: 8
            },
            ControllerBar: {
                BackgroundColor: "rgba(27, 37, 75, 0.04)",
                BorderRadius: {
                    LeadingBottom: 9999,
                    LeadingTop: 9999,
                    TrailingBottom: 9999,
                    TrailingTop: 9999
                },
                Gap: 16,
                Spacing: {
                    Bottom: 8,
                    Leading: 12,
                    Top: 8,
                    Trailing: 12
                }
            },
            ControllerBarShortcut: {
                Container: {
                    ContentColor: "rgb(32, 34, 39)",
                    Gap: 4
                },
                Icon: {
                    Size: 36
                },
                Label: {
                    Typography: {
                        Font: '600 14/1.4 "Builder Sans"',
                        FontFamily: '"Builder Sans"',
                        FontSize: 14,
                        FontWeight: "600",
                        LetterSpacing: 0,
                        LineHeight: 1.4
                    }
                }
            },
            Facepile: {
                Badge: {
                    BackgroundColor: "rgb(51, 95, 255)",
                    BorderColor: "rgb(247, 247, 248)",
                    BorderRadius: 9999,
                    BorderWidth: 2,
                    ContentColor: "rgb(247, 247, 248)",
                    Height: 16,
                    MinWidth: 16,
                    Spacing: 4,
                    Typography: {
                        Font: '600 10/1.4 "Builder Sans"',
                        FontFamily: '"Builder Sans"',
                        FontSize: 10,
                        FontWeight: "600",
                        LetterSpacing: 0,
                        LineHeight: 1.4
                    }
                },
                Container: {
                    Gap: 4
                },
                Face: {
                    BackgroundColor: "rgb(73, 77, 90)",
                    BorderColor: "rgb(247, 247, 248)",
                    BorderRadius: 9999,
                    BorderWidth: 2,
                    Height: 16,
                    Width: 16
                },
                FaceGroup: {
                    Gap: -6
                },
                Label: {
                    ContentColor: "rgb(106, 111, 129)",
                    Typography: {
                        Font: '400 12/1.4 "Builder Sans"',
                        FontFamily: '"Builder Sans"',
                        FontSize: 12,
                        FontWeight: "400",
                        LetterSpacing: 0,
                        LineHeight: 1.4
                    }
                }
            },
            HelperText: {
                Base: {
                    ContentColor: "rgb(73, 77, 90)",
                    Opacity: 1,
                    Padding: {
                        Top: 4
                    },
                    Typography: {
                        Font: '600 10/1.4 "Builder Sans"',
                        FontFamily: '"Builder Sans"',
                        FontSize: 10,
                        FontWeight: "600",
                        LetterSpacing: 0,
                        LineHeight: 1.4
                    }
                },
                Error: {
                    ContentColor: "rgb(217, 28, 21)"
                }
            },
            InputLabel: {
                Base: {
                    ContentColor: "rgb(73, 77, 90)",
                    Opacity: 1,
                    Spacing: {
                        Bottom: 4
                    },
                    Typography: {
                        Font: '400 12/1.4 "Builder Sans"',
                        FontFamily: '"Builder Sans"',
                        FontSize: 12,
                        FontWeight: "400",
                        LetterSpacing: 0,
                        LineHeight: 1.4
                    }
                },
                Disabled: {
                    Opacity: .32
                }
            },
            MediaTile: {
                Container: {
                    BorderRadius: 8
                },
                Icon: {
                    Size: 36
                }
            },
            MenuCell: {
                Base: {
                    CheckFrame: {
                        Size: 32
                    },
                    Container: {
                        BackgroundColor: "rgb(247, 247, 248)",
                        BorderColor: "rgba(27, 37, 75, 0.16)",
                        BorderRadius: {
                            BottomLeading: 0,
                            BottomTrailing: 0,
                            TopLeading: 0,
                            TopTrailing: 0
                        },
                        BorderWidth: 0,
                        ContentColor: "rgb(32, 34, 39)",
                        Height: 56,
                        Spacing: {
                            Bottom: 0,
                            Leading: 12,
                            Top: 0,
                            Trailing: 12
                        }
                    },
                    IconFrame: {
                        Size: 32
                    },
                    Text: {
                        Typography: {
                            Font: '700 16/1.4 "Builder Sans"',
                            FontFamily: '"Builder Sans"',
                            FontSize: 16,
                            FontWeight: "700",
                            LetterSpacing: 0,
                            LineHeight: 1.4
                        }
                    },
                    TextFrame: {
                        Spacing: {
                            Bottom: 0,
                            Leading: 12,
                            Top: 0,
                            Trailing: 12
                        }
                    }
                },
                Disabled: {
                    Container: {
                        ContentColor: "rgba(32, 34, 39, 0.5)"
                    }
                },
                Divider: {
                    Container: {
                        BorderWidth: 1
                    }
                },
                HasRoundBottom: {
                    Container: {
                        BorderRadius: {
                            BottomLeading: 8,
                            BottomTrailing: 8
                        }
                    }
                },
                HasRoundTop: {
                    Container: {
                        BorderRadius: {
                            TopLeading: 8,
                            TopTrailing: 8
                        }
                    }
                }
            },
            PlayerCount: {
                Container: {
                    BackgroundColor: "rgba(0, 0, 0, 0)",
                    BorderRadius: 0,
                    Spacing: 8
                }
            },
            PlayerTileSmall: {
                Base: {
                    Container: {
                        Gap: 8,
                        Spacing: {
                            Bottom: 8,
                            Leading: 8,
                            Top: 8,
                            Trailing: 8
                        }
                    },
                    Content: {
                        ContentColor: "rgb(32, 34, 39)",
                        Gap: 2,
                        Typography: {
                            Font: '600 14/1.4 "Builder Sans"',
                            FontFamily: '"Builder Sans"',
                            FontSize: 14,
                            FontWeight: "600",
                            LetterSpacing: 0,
                            LineHeight: 1.4
                        }
                    },
                    Icon: {
                        Size: 16
                    },
                    Image: {
                        BackgroundColor: "rgb(247, 247, 248)",
                        BorderColor: "rgba(27, 37, 75, 0.16)",
                        BorderRadius: 9999,
                        BorderWidth: 3,
                        Size: 96
                    },
                    Presence: {
                        ContentColor: "rgb(73, 77, 90)"
                    },
                    Status: {
                        BackgroundColor: "rgb(57, 197, 130)",
                        BorderColor: "rgb(255, 255, 255)",
                        BorderWidth: 2.5,
                        Size: 16
                    }
                }
            },
            RateCount: {
                ButtonGroup: {
                    Gap: 8
                },
                Container: {
                    BackgroundColor: "rgba(27, 37, 75, 0.16)",
                    BorderRadius: 8,
                    Gap: 8,
                    Spacing: 8
                }
            },
            SelectionCursor: {
                BorderWidth: 3,
                Gradient: {
                    End: "rgb(51, 95, 255)",
                    Start: "rgb(51, 95, 255)"
                },
                Inset: 0,
                Offset: 6
            },
            StatGroup: {
                Gap: 8
            },
            StatItem: {
                Container: {
                    ContentColor: "rgb(106, 111, 129)",
                    Gap: 2
                },
                Icon: {
                    Size: 16
                },
                Label: {
                    Typography: {
                        Font: '400 12/1.4 "Builder Sans"',
                        FontFamily: '"Builder Sans"',
                        FontSize: 12,
                        FontWeight: "400",
                        LetterSpacing: 0,
                        LineHeight: 1.4
                    }
                }
            },
            StatWidget: {
                Container: {
                    ContentColor: "rgb(32, 34, 39)",
                    Gap: 8
                },
                Data: {
                    Typography: {
                        Font: '700 28/1.2 "Builder Sans"',
                        FontFamily: '"Builder Sans"',
                        FontSize: 28,
                        FontWeight: "700",
                        LetterSpacing: -.01,
                        LineHeight: 1.2
                    }
                },
                DataGroup: {
                    Gap: 0
                },
                Icon: {
                    Size: 48
                },
                Label: {
                    Typography: {
                        Font: '700 16/1.4 "Builder Sans"',
                        FontFamily: '"Builder Sans"',
                        FontSize: 16,
                        FontWeight: "700",
                        LetterSpacing: 0,
                        LineHeight: 1.4
                    }
                }
            },
            StateLayer: {
                Base: {
                    BorderWidth: 1
                },
                Darken: {
                    Default: {
                        Color: "rgba(0, 0, 0, 0)"
                    },
                    Disabled: {
                        Color: "rgba(0, 0, 0, 0)"
                    },
                    Hover: {
                        Color: "rgba(27, 37, 75, 0.08)"
                    },
                    Initialize: {
                        Color: "rgba(0, 0, 0, 0)"
                    },
                    Pressed: {
                        Color: "rgba(27, 37, 75, 0.12)"
                    },
                    Selected: {
                        Color: "rgba(0, 0, 0, 0)"
                    },
                    SelectedPressed: {
                        Color: "rgba(27, 37, 75, 0.12)"
                    }
                },
                Inverse: {
                    Default: {
                        Color: "rgba(255, 255, 255, 0)"
                    },
                    Disabled: {
                        Color: "rgba(255, 255, 255, 0)"
                    },
                    Hover: {
                        Color: "rgba(208, 217, 251, 0.08)"
                    },
                    Initialize: {
                        Color: "rgba(255, 255, 255, 0)"
                    },
                    Pressed: {
                        Color: "rgba(208, 217, 251, 0.12)"
                    },
                    Selected: {
                        Color: "rgba(255, 255, 255, 0)"
                    },
                    SelectedPressed: {
                        Color: "rgba(208, 217, 251, 0.12)"
                    }
                },
                Lighten: {
                    Default: {
                        Color: "rgba(255, 255, 255, 0)"
                    },
                    Disabled: {
                        Color: "rgba(255, 255, 255, 0)"
                    },
                    Hover: {
                        Color: "rgba(208, 217, 251, 0.08)"
                    },
                    Initialize: {
                        Color: "rgba(255, 255, 255, 0)"
                    },
                    Pressed: {
                        Color: "rgba(208, 217, 251, 0.12)"
                    },
                    Selected: {
                        Color: "rgba(255, 255, 255, 0)"
                    },
                    SelectedPressed: {
                        Color: "rgba(208, 217, 251, 0.12)"
                    }
                },
                Standard: {
                    Default: {
                        Color: "rgba(0, 0, 0, 0)"
                    },
                    Disabled: {
                        Color: "rgba(0, 0, 0, 0)"
                    },
                    Hover: {
                        Color: "rgba(27, 37, 75, 0.08)"
                    },
                    Initialize: {
                        Color: "rgba(0, 0, 0, 0)"
                    },
                    Pressed: {
                        Color: "rgba(27, 37, 75, 0.12)"
                    },
                    Selected: {
                        Color: "rgba(0, 0, 0, 0)"
                    },
                    SelectedPressed: {
                        Color: "rgba(27, 37, 75, 0.12)"
                    }
                }
            },
            TextField: {
                Base: {
                    Field: {
                        BorderColor: "rgba(27, 37, 75, 0.16)",
                        BorderRadius: 8,
                        Gap: 8,
                        Opacity: 1,
                        Spacing: {
                            Leading: 12,
                            Trailing: 12
                        },
                        Typography: {
                            Font: '400 16/1.4 "Builder Sans"',
                            FontFamily: '"Builder Sans"',
                            FontSize: 16,
                            FontWeight: "400",
                            LetterSpacing: 0,
                            LineHeight: 1.4
                        }
                    },
                    FieldValue: {
                        ContentColor: "rgb(32, 34, 39)"
                    },
                    IconLeading: {
                        ContentColor: "rgb(106, 111, 129)",
                        Size: 16
                    },
                    PlaceholderText: {
                        ContentColor: "rgb(106, 111, 129)"
                    }
                },
                Disabled: {
                    Field: {
                        Opacity: .32
                    }
                },
                Error: {
                    Field: {
                        BorderColor: "rgba(0, 0, 0, 0)"
                    }
                }
            },
            VerticalScrollView: {
                Base: {
                    Handle: {
                        BackgroundColor: "rgba(27, 37, 75, 0.16)",
                        BorderRadius: 9999,
                        ContentColor: "rgb(32, 34, 39)"
                    },
                    Icon: {
                        Size: 36
                    },
                    Track: {
                        Opacity: 0,
                        Spacing: {
                            Bottom: 4,
                            Top: 4
                        }
                    }
                },
                Compact: {
                    Handle: {
                        Width: 2
                    },
                    Track: {
                        Width: 12
                    }
                },
                Gamepad: {
                    Handle: {
                        Width: 16
                    },
                    Track: {
                        Width: 16
                    }
                },
                Wide: {
                    Handle: {
                        Width: 8
                    },
                    Track: {
                        Width: 16
                    }
                }
            },
            VerticalTile: {
                Base: {
                    Container: {
                        Background: "rgb(247, 247, 248)",
                        BorderColor: "rgba(27, 37, 75, 0.16)",
                        BorderRadius: {
                            LeadingBottom: 8,
                            LeadingTop: 8,
                            TrailingBottom: 8,
                            TrailingTop: 8
                        },
                        BorderWidth: 1,
                        DropShadow: {
                            Blur: 8,
                            Color: "rgba(10, 10, 14, 0.5)",
                            X: 0,
                            Y: 4
                        }
                    },
                    ContentBottom: {
                        Spacing: {
                            Bottom: 8,
                            Leading: 8,
                            Top: 8,
                            Trailing: 8
                        }
                    },
                    ContentTop: {
                        Spacing: {
                            Bottom: 0,
                            Leading: 0,
                            Top: 0,
                            Trailing: 0
                        }
                    }
                }
            }
        },
        Config: {
            ColorMode: {
                IsDark: "false",
                IsLight: "true",
                Name: "Light"
            },
            Text: {
                Font: '"Builder Sans"',
                Interval: 4,
                InverseScale: 1,
                NominalScale: 1,
                Scale: 1
            },
            Theme: {
                IsFoundation: "true",
                IsUIBlox: "false",
                Name: "Foundation"
            },
            UI: {
                Interval: 4,
                Scale: 1,
                StrokeBase: 1
            }
        },
        DarkMode: {
            ActionAlert: {
                Background: "rgba(208, 217, 251, 0.12)",
                Border: "rgba(0, 0, 0, 0)",
                Foreground: "rgb(240, 68, 51)"
            },
            ActionEmphasis: {
                Background: "rgb(51, 95, 255)",
                Border: "rgba(0, 0, 0, 0)",
                Foreground: "rgb(247, 247, 248)"
            },
            ActionLink: {
                Background: "rgba(0, 0, 0, 0)",
                Border: "rgba(0, 0, 0, 0)",
                Foreground: "rgb(247, 247, 248)"
            },
            ActionOverMedia: {
                Background: "rgb(247, 247, 248)",
                Border: "rgba(0, 0, 0, 0)",
                Foreground: "rgb(32, 34, 39)"
            },
            ActionSoftEmphasis: {
                Background: "rgba(51, 95, 255, 0.4)",
                Border: "rgba(0, 0, 0, 0)",
                Foreground: "rgb(235, 241, 255)"
            },
            ActionStandard: {
                Background: "rgba(208, 217, 251, 0.12)",
                Border: "rgba(0, 0, 0, 0)",
                Foreground: "rgb(247, 247, 248)"
            },
            ActionSubEmphasis: {
                Background: "rgb(247, 247, 248)",
                Border: "rgba(0, 0, 0, 0)",
                Foreground: "rgb(32, 34, 39)"
            },
            ActionSubtle: {
                Background: "rgba(0, 0, 0, 0)",
                Border: "rgb(213, 215, 221)",
                Foreground: "rgb(247, 247, 248)"
            },
            ActionUtility: {
                Background: "rgba(0, 0, 0, 0)",
                Border: "rgba(0, 0, 0, 0)",
                Foreground: "rgb(247, 247, 248)"
            },
            Common: {
                Backdrop: "rgba(10, 10, 14, 0.75)",
                HeavyDivider: "rgba(0, 0, 0, 0.5)",
                NavigationBar: "rgb(18, 18, 21)",
                Scrim: "rgba(10, 10, 14, 0.75)",
                Shadow: "rgba(0, 0, 0, 0.5)",
                Shimmer: "rgba(208, 217, 251, 0.12)"
            },
            Content: {
                Default: "rgb(213, 215, 221)",
                Emphasis: "rgb(247, 247, 248)",
                Link: "rgb(82, 139, 255)",
                Muted: "rgb(188, 190, 200)"
            },
            None: "rgba(0, 0, 0, 0)",
            OverMedia: {
                OverMedia_0: "rgba(18, 18, 21, 0.92)",
                OverMedia_100: "rgba(25, 26, 31, 0.92)",
                OverMedia_200: "rgba(32, 34, 39, 0.92)",
                OverMedia_300: "rgba(39, 41, 48, 0.92)"
            },
            Selection: {
                End: "rgb(255, 255, 255)",
                Start: "rgb(255, 255, 255)"
            },
            Shift: {
                Shift_100: "rgba(208, 217, 251, 0.04)",
                Shift_200: "rgba(208, 217, 251, 0.08)",
                Shift_300: "rgba(208, 217, 251, 0.12)",
                Shift_400: "rgba(208, 217, 251, 0.16)"
            },
            State: {
                Hover: "rgba(208, 217, 251, 0.08)",
                Idle: "rgba(255, 255, 255, 0)",
                Press: "rgba(208, 217, 251, 0.12)"
            },
            Stroke: {
                Default: "rgba(208, 217, 251, 0.12)",
                Emphasis: "rgba(208, 217, 251, 0.16)",
                Muted: "rgba(208, 217, 251, 0.08)"
            },
            Surface: {
                Surface_0: "rgb(18, 18, 21)",
                Surface_100: "rgb(25, 26, 31)",
                Surface_200: "rgb(32, 34, 39)",
                Surface_300: "rgb(39, 41, 48)"
            },
            System: {
                Alert: "rgb(223, 40, 31)",
                Contrast: "rgb(247, 247, 248)",
                Emphasis: "rgb(51, 95, 255)",
                Neutral: "rgb(188, 190, 200)",
                Success: "rgb(57, 197, 130)",
                Warning: "rgb(242, 186, 42)"
            }
        },
        Ease: {
            ExpressiveIn: {
                Bezier: "cubic-bezier(0.25, 0, 0.5, -1)",
                Raw: [.25, 0, .5, -1]
            },
            ExpressiveOut: {
                Bezier: "cubic-bezier(0.25, 1.5, 0.5, 1)",
                Raw: [.25, 1.5, .5, 1]
            },
            Linear: {
                Bezier: "cubic-bezier(0, 0, 1, 1)",
                Raw: [0, 0, 1, 1]
            },
            StandardIn: {
                Bezier: "cubic-bezier(0.8, 0, 0.4, 1)",
                Raw: [.8, 0, .4, 1]
            },
            StandardOut: {
                Bezier: "cubic-bezier(0.2, 0, 0, 1)",
                Raw: [.2, 0, 0, 1]
            }
        },
        FontSize: {
            FontSize_200: 8,
            FontSize_250: 10,
            FontSize_300: 12,
            FontSize_350: 14,
            FontSize_400: 16,
            FontSize_500: 20,
            FontSize_600: 24,
            FontSize_700: 28,
            FontSize_800: 32,
            FontSize_900: 36,
            FontSize_1000: 40,
            FontSize_1100: 44,
            FontSize_1200: 48,
            FontSize_1300: 52,
            FontSize_1400: 56,
            FontSize_1500: 60,
            FontSize_1600: 64,
            FontSize_1700: 68,
            FontSize_1800: 72,
            FontSize_1900: 76,
            FontSize_2000: 80,
            FontSize_2100: 84,
            FontSize_2200: 88,
            FontSize_2300: 92,
            FontSize_2400: 96,
            FontSize_2500: 100,
            FontSize_2600: 104,
            FontSize_2700: 108,
            FontSize_2800: 112,
            FontSize_2900: 116,
            FontSize_3000: 120
        },
        FontWeight: {
            FontWeight_300: "300",
            FontWeight_400: "400",
            FontWeight_500: "500",
            FontWeight_600: "600",
            FontWeight_700: "700",
            FontWeight_800: "800"
        },
        Gap: {
            Large: 16,
            Medium: 12,
            None: 0,
            Small: 8,
            XLarge: 20,
            XSmall: 4,
            XXLarge: 24,
            XXSmall: 2
        },
        Global: {
            Color: {
                Alabaster: "rgb(247, 247, 248)",
                Ash: "rgb(230, 231, 234)",
                Black: "rgb(0, 0, 0)",
                Blue: "rgb(51, 95, 255)",
                Carbon: "rgb(25, 26, 31)",
                Chalk: "rgb(213, 215, 221)",
                Flint: "rgb(39, 41, 48)",
                Graphite: "rgb(73, 77, 90)",
                Green: "rgb(57, 197, 130)",
                None: "rgba(0, 0, 0, 0)",
                Obsidian: "rgb(18, 18, 21)",
                Pumice: "rgb(188, 190, 200)",
                Red: "rgb(223, 40, 31)",
                Slate: "rgb(32, 34, 39)",
                Smoke: "rgb(53, 55, 65)",
                White: "rgb(255, 255, 255)"
            },
            Family: {
                Standard: '""Builder Sans""'
            },
            FontSize_25: 10,
            FontSize_50: 12,
            FontSize_75: 14,
            FontSize_100: 16,
            FontSize_200: 20,
            FontSize_300: 24,
            FontSize_400: 28,
            FontSize_500: 34,
            FontSize_600: 40,
            FontSize_700: 48,
            FontSize_800: 58,
            FontSize_900: 68,
            FontSize_1000: 82,
            LetterSpacing: {
                Default: 0
            },
            LineHeight_100: 1,
            LineHeight_200: 1.2,
            LineHeight_300: 1.3,
            LineHeight_400: 1.4,
            Opacity_0: 0,
            Opacity_8: .08,
            Opacity_12: .12,
            Opacity_16: .16,
            Opacity_32: .32,
            Opacity_68: .68,
            Opacity_84: .84,
            Opacity_88: .88,
            Opacity_92: .92,
            Opacity_100: 1,
            Size_0: 0,
            Size_25: 2,
            Size_50: 4,
            Size_75: 6,
            Size_100: 8,
            Size_150: 12,
            Size_200: 16,
            Size_250: 20,
            Size_300: 24,
            Size_350: 28,
            Size_400: 32,
            Size_450: 36,
            Size_500: 40,
            Size_600: 48,
            Size_700: 56,
            Size_800: 64,
            Size_900: 72,
            Size_1000: 80,
            Size_1100: 88,
            Size_1200: 96,
            Size_1300: 104,
            Size_1400: 112,
            Space_0: 0,
            Space_25: 2,
            Space_50: 4,
            Space_75: 6,
            Space_100: 8,
            Space_150: 12,
            Space_200: 16,
            Space_250: 20,
            Space_300: 24,
            Space_400: 32,
            Space_500: 40,
            Space_600: 48,
            Space_800: 64,
            Space_1000: 80,
            Stroke_50: .5,
            Stroke_100: 1,
            Stroke_150: 1.5,
            Stroke_200: 2,
            Stroke_250: 2.5,
            Stroke_300: 3,
            Stroke_400: 4,
            Weight_300: "300",
            Weight_400: "400",
            Weight_600: "500",
            Weight_700: "700",
            Weight_900: "800"
        },
        Gutter: {
            Large: 16,
            Medium: 12,
            None: 0,
            Small: 8,
            XLarge: 20,
            XXLarge: 24
        },
        IconSize: {
            Large: 24,
            Medium: 20,
            Small: 16,
            XLarge: 28,
            XSmall: 12
        },
        InputSize: {
            Large: 48,
            Medium: 40,
            Small: 32,
            XSmall: 24
        },
        Inverse: {
            ActionAlert: {
                Background: "rgba(208, 217, 251, 0.12)",
                Border: "rgba(0, 0, 0, 0)",
                Foreground: "rgb(240, 68, 51)"
            },
            ActionEmphasis: {
                Background: "rgb(51, 95, 255)",
                Border: "rgba(0, 0, 0, 0)",
                Foreground: "rgb(247, 247, 248)"
            },
            ActionLink: {
                Background: "rgba(0, 0, 0, 0)",
                Border: "rgba(0, 0, 0, 0)",
                Foreground: "rgb(247, 247, 248)"
            },
            ActionOverMedia: {
                Background: "rgb(247, 247, 248)",
                Border: "rgba(0, 0, 0, 0)",
                Foreground: "rgb(32, 34, 39)"
            },
            ActionSoftEmphasis: {
                Background: "rgba(51, 95, 255, 0.4)",
                Border: "rgba(0, 0, 0, 0)",
                Foreground: "rgb(235, 241, 255)"
            },
            ActionStandard: {
                Background: "rgba(208, 217, 251, 0.12)",
                Border: "rgba(0, 0, 0, 0)",
                Foreground: "rgb(247, 247, 248)"
            },
            ActionSubEmphasis: {
                Background: "rgb(247, 247, 248)",
                Border: "rgba(0, 0, 0, 0)",
                Foreground: "rgb(32, 34, 39)"
            },
            ActionSubtle: {
                Background: "rgba(0, 0, 0, 0)",
                Border: "rgb(213, 215, 221)",
                Foreground: "rgb(247, 247, 248)"
            },
            ActionUtility: {
                Background: "rgba(0, 0, 0, 0)",
                Border: "rgba(0, 0, 0, 0)",
                Foreground: "rgb(247, 247, 248)"
            },
            Common: {
                Backdrop: "rgba(10, 10, 14, 0.75)",
                HeavyDivider: "rgba(0, 0, 0, 0.5)",
                NavigationBar: "rgb(18, 18, 21)",
                Scrim: "rgba(10, 10, 14, 0.75)",
                Shadow: "rgba(0, 0, 0, 0.5)",
                Shimmer: "rgba(208, 217, 251, 0.12)"
            },
            Content: {
                Default: "rgb(213, 215, 221)",
                Emphasis: "rgb(247, 247, 248)",
                Link: "rgb(82, 139, 255)",
                Muted: "rgb(188, 190, 200)"
            },
            None: "rgba(0, 0, 0, 0)",
            OverMedia: {
                OverMedia_0: "rgba(18, 18, 21, 0.92)",
                OverMedia_100: "rgba(25, 26, 31, 0.92)",
                OverMedia_200: "rgba(32, 34, 39, 0.92)",
                OverMedia_300: "rgba(39, 41, 48, 0.92)"
            },
            Selection: {
                End: "rgb(255, 255, 255)",
                Start: "rgb(255, 255, 255)"
            },
            Shift: {
                Shift_100: "rgba(208, 217, 251, 0.04)",
                Shift_200: "rgba(208, 217, 251, 0.08)",
                Shift_300: "rgba(208, 217, 251, 0.12)",
                Shift_400: "rgba(208, 217, 251, 0.16)"
            },
            State: {
                Hover: "rgba(208, 217, 251, 0.08)",
                Idle: "rgba(255, 255, 255, 0)",
                Press: "rgba(208, 217, 251, 0.12)"
            },
            Stroke: {
                Default: "rgba(208, 217, 251, 0.12)",
                Emphasis: "rgba(208, 217, 251, 0.16)",
                Muted: "rgba(208, 217, 251, 0.08)"
            },
            Surface: {
                Surface_0: "rgb(18, 18, 21)",
                Surface_100: "rgb(25, 26, 31)",
                Surface_200: "rgb(32, 34, 39)",
                Surface_300: "rgb(39, 41, 48)"
            },
            System: {
                Alert: "rgb(223, 40, 31)",
                Contrast: "rgb(247, 247, 248)",
                Emphasis: "rgb(51, 95, 255)",
                Neutral: "rgb(188, 190, 200)",
                Success: "rgb(57, 197, 130)",
                Warning: "rgb(242, 186, 42)"
            }
        },
        LetterSpacing: {
            Default: 0,
            Loose: .01,
            Tight: -.01
        },
        LightMode: {
            ActionAlert: {
                Background: "rgba(27, 37, 75, 0.12)",
                Border: "rgba(0, 0, 0, 0)",
                Foreground: "rgb(217, 28, 21)"
            },
            ActionEmphasis: {
                Background: "rgb(51, 95, 255)",
                Border: "rgba(0, 0, 0, 0)",
                Foreground: "rgb(247, 247, 248)"
            },
            ActionLink: {
                Background: "rgba(0, 0, 0, 0)",
                Border: "rgba(0, 0, 0, 0)",
                Foreground: "rgb(32, 34, 39)"
            },
            ActionOverMedia: {
                Background: "rgb(32, 34, 39)",
                Border: "rgba(0, 0, 0, 0)",
                Foreground: "rgb(247, 247, 248)"
            },
            ActionSoftEmphasis: {
                Background: "rgba(51, 95, 255, 0.3)",
                Border: "rgba(0, 0, 0, 0)",
                Foreground: "rgb(0, 20, 92)"
            },
            ActionStandard: {
                Background: "rgba(27, 37, 75, 0.12)",
                Border: "rgba(0, 0, 0, 0)",
                Foreground: "rgb(32, 34, 39)"
            },
            ActionSubEmphasis: {
                Background: "rgb(32, 34, 39)",
                Border: "rgba(0, 0, 0, 0)",
                Foreground: "rgb(247, 247, 248)"
            },
            ActionSubtle: {
                Background: "rgba(0, 0, 0, 0)",
                Border: "rgb(73, 77, 90)",
                Foreground: "rgb(32, 34, 39)"
            },
            ActionUtility: {
                Background: "rgba(0, 0, 0, 0)",
                Border: "rgba(0, 0, 0, 0)",
                Foreground: "rgb(32, 34, 39)"
            },
            Common: {
                Backdrop: "rgba(10, 10, 14, 0.5)",
                HeavyDivider: "rgba(27, 37, 75, 0.04)",
                NavigationBar: "rgb(255, 255, 255)",
                Scrim: "rgba(10, 10, 14, 0.5)",
                Shadow: "rgba(0, 0, 0, 0.5)",
                Shimmer: "rgba(27, 37, 75, 0.12)"
            },
            Content: {
                Default: "rgb(73, 77, 90)",
                Emphasis: "rgb(32, 34, 39)",
                Link: "rgb(20, 70, 255)",
                Muted: "rgb(106, 111, 129)"
            },
            None: "rgba(0, 0, 0, 0)",
            OverMedia: {
                OverMedia_0: "rgba(255, 255, 255, 0.92)",
                OverMedia_100: "rgba(247, 247, 248, 0.92)",
                OverMedia_200: "rgba(255, 255, 255, 0.92)",
                OverMedia_300: "rgba(247, 247, 248, 0.92)"
            },
            Selection: {
                End: "rgb(51, 95, 255)",
                Start: "rgb(51, 95, 255)"
            },
            Shift: {
                Shift_100: "rgba(27, 37, 75, 0.04)",
                Shift_200: "rgba(27, 37, 75, 0.08)",
                Shift_300: "rgba(27, 37, 75, 0.12)",
                Shift_400: "rgba(27, 37, 75, 0.16)"
            },
            State: {
                Hover: "rgba(27, 37, 75, 0.08)",
                Idle: "rgba(0, 0, 0, 0)",
                Press: "rgba(27, 37, 75, 0.12)"
            },
            Stroke: {
                Default: "rgba(27, 37, 75, 0.12)",
                Emphasis: "rgba(27, 37, 75, 0.16)",
                Muted: "rgba(27, 37, 75, 0.08)"
            },
            Surface: {
                Surface_0: "rgb(255, 255, 255)",
                Surface_100: "rgb(247, 247, 248)",
                Surface_200: "rgb(255, 255, 255)",
                Surface_300: "rgb(247, 247, 248)"
            },
            System: {
                Alert: "rgb(223, 40, 31)",
                Contrast: "rgb(32, 34, 39)",
                Emphasis: "rgb(51, 95, 255)",
                Neutral: "rgb(73, 77, 90)",
                Success: "rgb(57, 197, 130)",
                Warning: "rgb(242, 186, 42)"
            }
        },
        LineHeight: {
            LineHeight_100: 1,
            LineHeight_120: 1.2,
            LineHeight_130: 1.3,
            LineHeight_140: 1.4
        },
        Margin: {
            Large: 48,
            Medium: 24,
            None: 0,
            Small: 20
        },
        Padding: {
            Large: 16,
            Medium: 12,
            None: 0,
            Small: 8,
            XLarge: 20,
            XSmall: 4,
            XXLarge: 24,
            XXSmall: 2
        },
        Platform: {
            Base: 4,
            Rem: 8,
            Scale: 1
        },
        Radius: {
            Circle: 9999,
            Large: 16,
            Medium: 8,
            None: 0,
            Small: 4,
            XSmall: 2
        },
        Semantic: {
            Color: {
                Action: {
                    Alert: {
                        Background: "rgba(27, 37, 75, 0.12)",
                        Border: "rgba(0, 0, 0, 0)",
                        Content: "rgb(217, 28, 21)"
                    },
                    Primary: {
                        Background: "rgb(32, 34, 39)",
                        Border: "rgba(0, 0, 0, 0)",
                        Content: "rgb(247, 247, 248)"
                    },
                    PrimaryBrand: {
                        Background: "rgb(51, 95, 255)",
                        Border: "rgba(0, 0, 0, 0)",
                        Content: "rgb(247, 247, 248)"
                    },
                    Secondary: {
                        Background: "rgba(0, 0, 0, 0)",
                        Border: "rgb(73, 77, 90)",
                        Content: "rgb(32, 34, 39)"
                    },
                    Subtle: {
                        Background: "rgba(0, 0, 0, 0)",
                        Border: "rgba(0, 0, 0, 0)",
                        Content: "rgb(32, 34, 39)"
                    }
                },
                Background: {
                    Contrast: "rgb(247, 247, 248)",
                    Default: "rgb(255, 255, 255)",
                    Muted: "rgb(255, 255, 255)",
                    OnHover: "rgba(27, 37, 75, 0.08)",
                    OnPress: "rgba(27, 37, 75, 0.12)"
                },
                BackgroundUi: {
                    Contrast: "rgba(255, 255, 255, 0.92)",
                    Default: "rgb(247, 247, 248)"
                },
                Common: {
                    Alert: "rgb(223, 40, 31)",
                    Badge: "rgb(32, 34, 39)",
                    BadgeContent: "rgb(247, 247, 248)",
                    Divider: "rgba(27, 37, 75, 0.16)",
                    DropShadow: "rgba(0, 0, 0, 0.5)",
                    NavigationBar: "rgb(255, 255, 255)",
                    Offline: "rgb(73, 77, 90)",
                    Online: "rgb(57, 197, 130)",
                    Overlay: "rgba(10, 10, 14, 0.5)",
                    Placeholder: "rgba(27, 37, 75, 0.12)",
                    Success: "rgb(57, 197, 130)"
                },
                Focus: {
                    End: "rgb(51, 95, 255)",
                    Gradient: "rgb(51, 95, 255)",
                    Start: "rgb(51, 95, 255)"
                },
                Icon: {
                    Default: "rgb(73, 77, 90)",
                    Emphasis: "rgb(32, 34, 39)",
                    OnHover: "rgb(32, 34, 39)"
                },
                State: {
                    Darken: {
                        Default: "rgba(0, 0, 0, 0)",
                        Hover: "rgba(27, 37, 75, 0.08)",
                        Pressed: "rgba(27, 37, 75, 0.12)"
                    },
                    Inverse: {
                        Default: "rgba(255, 255, 255, 0)",
                        Hover: "rgba(208, 217, 251, 0.08)",
                        Pressed: "rgba(208, 217, 251, 0.12)"
                    },
                    Lighten: {
                        Default: "rgba(255, 255, 255, 0)",
                        Hover: "rgba(208, 217, 251, 0.08)",
                        Pressed: "rgba(208, 217, 251, 0.12)"
                    },
                    Standard: {
                        Default: "rgba(0, 0, 0, 0)",
                        Hover: "rgba(27, 37, 75, 0.08)",
                        Pressed: "rgba(27, 37, 75, 0.12)"
                    }
                },
                Text: {
                    Default: "rgb(73, 77, 90)",
                    Emphasis: "rgb(32, 34, 39)",
                    Inverse: "rgb(213, 215, 221)",
                    Link: "rgb(20, 70, 255)",
                    Muted: "rgb(106, 111, 129)"
                },
                Ui: {
                    Default: "rgba(27, 37, 75, 0.08)",
                    Emphasis: "rgba(27, 37, 75, 0.16)",
                    Muted: "rgba(27, 37, 75, 0.04)"
                }
            },
            Icon: {
                Size: {
                    Large: 48,
                    Medium: 36,
                    Small: 16,
                    XLarge: 96,
                    XXLarge: 192
                }
            },
            Offset: {
                Focus: {
                    Inset: 0,
                    Standard: 6
                }
            },
            Opacity: {
                State: {
                    Darken: {
                        Hover: .12,
                        Pressed: .2
                    },
                    Lighten: {
                        Hover: .12,
                        Pressed: .2
                    }
                }
            },
            Radius: {
                Circle: 9999,
                Large: 12,
                Medium: 8,
                None: 0,
                Small: 4,
                XLarge: 16
            },
            Stroke: {
                Focus: 3,
                Input: 1
            },
            Typography: {
                Body: {
                    Font: '400 16/1.4 "Builder Sans"',
                    FontFamily: '"Builder Sans"',
                    FontSize: 16,
                    FontWeight: "400",
                    LetterSpacing: 0,
                    LineHeight: 1.4
                },
                CaptionBody: {
                    Font: '400 12/1.4 "Builder Sans"',
                    FontFamily: '"Builder Sans"',
                    FontSize: 12,
                    FontWeight: "400",
                    LetterSpacing: 0,
                    LineHeight: 1.4
                },
                CaptionHeader: {
                    Font: '600 14/1.4 "Builder Sans"',
                    FontFamily: '"Builder Sans"',
                    FontSize: 14,
                    FontWeight: "600",
                    LetterSpacing: 0,
                    LineHeight: 1.4
                },
                Footer: {
                    Font: '600 10/1.4 "Builder Sans"',
                    FontFamily: '"Builder Sans"',
                    FontSize: 10,
                    FontWeight: "600",
                    LetterSpacing: 0,
                    LineHeight: 1.4
                },
                Header: {
                    Font: '700 20/1.2 "Builder Sans"',
                    FontFamily: '"Builder Sans"',
                    FontSize: 20,
                    FontWeight: "700",
                    LetterSpacing: -.01,
                    LineHeight: 1.2
                },
                Subheader: {
                    Font: '700 16/1.4 "Builder Sans"',
                    FontFamily: '"Builder Sans"',
                    FontSize: 16,
                    FontWeight: "700",
                    LetterSpacing: 0,
                    LineHeight: 1.4
                },
                Title: {
                    Font: '700 28/1.2 "Builder Sans"',
                    FontFamily: '"Builder Sans"',
                    FontSize: 28,
                    FontWeight: "700",
                    LetterSpacing: -.01,
                    LineHeight: 1.2
                }
            }
        },
        Size: {
            Size_0: 0,
            Size_50: 2,
            Size_100: 4,
            Size_150: 6,
            Size_200: 8,
            Size_250: 10,
            Size_300: 12,
            Size_350: 14,
            Size_400: 16,
            Size_500: 20,
            Size_600: 24,
            Size_700: 28,
            Size_800: 32,
            Size_900: 36,
            Size_1000: 40,
            Size_1100: 44,
            Size_1200: 48,
            Size_1300: 52,
            Size_1400: 56,
            Size_1500: 60,
            Size_1600: 64,
            Size_1700: 68,
            Size_1800: 72,
            Size_1900: 76,
            Size_2000: 80,
            Size_2100: 84,
            Size_2200: 88,
            Size_2300: 92,
            Size_2400: 96,
            Size_2500: 100,
            Size_2600: 104,
            Size_2700: 108,
            Size_2800: 112,
            Size_2900: 116,
            Size_3000: 120
        },
        Stroke: {
            None: 0,
            Standard: 1,
            Thick: 1.5,
            Thicker: 3,
            Thin: .5
        },
        Time: {
            Time_50: .05,
            Time_100: .1,
            Time_200: .2,
            Time_300: .3,
            Time_400: .4,
            Time_500: .5,
            Time_600: .6,
            Time_700: .7,
            Time_800: .8,
            Time_900: .9,
            Time_1000: 1
        },
        ToggleSize: {
            Large: 28,
            Medium: 24,
            Small: 20,
            XSmall: 16
        },
        Typography: {
            BodyLarge: {
                Font: '400 16/1.4 "Builder Sans"',
                FontFamily: '"Builder Sans"',
                FontSize: 16,
                FontWeight: "400",
                LetterSpacing: 0,
                LineHeight: 1.4
            },
            BodyMedium: {
                Font: '400 14/1.4 "Builder Sans"',
                FontFamily: '"Builder Sans"',
                FontSize: 14,
                FontWeight: "400",
                LetterSpacing: 0,
                LineHeight: 1.4
            },
            BodySmall: {
                Font: '400 12/1.4 "Builder Sans"',
                FontFamily: '"Builder Sans"',
                FontSize: 12,
                FontWeight: "400",
                LetterSpacing: 0,
                LineHeight: 1.4
            },
            CaptionLarge: {
                Font: '600 14/1.4 "Builder Sans"',
                FontFamily: '"Builder Sans"',
                FontSize: 14,
                FontWeight: "600",
                LetterSpacing: 0,
                LineHeight: 1.4
            },
            CaptionMedium: {
                Font: '600 12/1.4 "Builder Sans"',
                FontFamily: '"Builder Sans"',
                FontSize: 12,
                FontWeight: "600",
                LetterSpacing: 0,
                LineHeight: 1.4
            },
            CaptionSmall: {
                Font: '600 10/1.4 "Builder Sans"',
                FontFamily: '"Builder Sans"',
                FontSize: 10,
                FontWeight: "600",
                LetterSpacing: 0,
                LineHeight: 1.4
            },
            DisplayLarge: {
                Font: '700 80/1.2 "Builder Sans"',
                FontFamily: '"Builder Sans"',
                FontSize: 80,
                FontWeight: "700",
                LetterSpacing: -.01,
                LineHeight: 1.2
            },
            DisplayMedium: {
                Font: '700 56/1.2 "Builder Sans"',
                FontFamily: '"Builder Sans"',
                FontSize: 56,
                FontWeight: "700",
                LetterSpacing: -.01,
                LineHeight: 1.2
            },
            DisplaySmall: {
                Font: '700 40/1.2 "Builder Sans"',
                FontFamily: '"Builder Sans"',
                FontSize: 40,
                FontWeight: "700",
                LetterSpacing: -.01,
                LineHeight: 1.2
            },
            HeadingLarge: {
                Font: '700 28/1.2 "Builder Sans"',
                FontFamily: '"Builder Sans"',
                FontSize: 28,
                FontWeight: "700",
                LetterSpacing: -.01,
                LineHeight: 1.2
            },
            HeadingMedium: {
                Font: '700 24/1.2 "Builder Sans"',
                FontFamily: '"Builder Sans"',
                FontSize: 24,
                FontWeight: "700",
                LetterSpacing: -.01,
                LineHeight: 1.2
            },
            HeadingSmall: {
                Font: '700 20/1.2 "Builder Sans"',
                FontFamily: '"Builder Sans"',
                FontSize: 20,
                FontWeight: "700",
                LetterSpacing: -.01,
                LineHeight: 1.2
            },
            LabelLarge: {
                Font: '600 16/1 "Builder Sans"',
                FontFamily: '"Builder Sans"',
                FontSize: 16,
                FontWeight: "600",
                LetterSpacing: 0,
                LineHeight: 1
            },
            LabelMedium: {
                Font: '600 14/1 "Builder Sans"',
                FontFamily: '"Builder Sans"',
                FontSize: 14,
                FontWeight: "600",
                LetterSpacing: 0,
                LineHeight: 1
            },
            LabelSmall: {
                Font: '600 12/1 "Builder Sans"',
                FontFamily: '"Builder Sans"',
                FontSize: 12,
                FontWeight: "600",
                LetterSpacing: 0,
                LineHeight: 1
            },
            TitleLarge: {
                Font: '700 16/1.4 "Builder Sans"',
                FontFamily: '"Builder Sans"',
                FontSize: 16,
                FontWeight: "700",
                LetterSpacing: 0,
                LineHeight: 1.4
            },
            TitleMedium: {
                Font: '700 14/1.4 "Builder Sans"',
                FontFamily: '"Builder Sans"',
                FontSize: 14,
                FontWeight: "700",
                LetterSpacing: 0,
                LineHeight: 1.4
            },
            TitleSmall: {
                Font: '700 12/1.4 "Builder Sans"',
                FontFamily: '"Builder Sans"',
                FontSize: 12,
                FontWeight: "700",
                LetterSpacing: 0,
                LineHeight: 1.4
            }
        }
    }, i = e.c && e.c.__createBinding || (Object.create ? function(r, e, a, t) {
        void 0 === t && (t = a), Object.defineProperty(r, t, {
            enumerable: !0,
            get: function() {
                return e[a]
            }
        })
    } : function(r, e, a, t) {
        void 0 === t && (t = a), r[t] = e[a]
    }), o = e.c && e.c.__exportStar || function(r, e) {
        for (var a in r) "default" === a || Object.prototype.hasOwnProperty.call(e, a) || i(e, r, a)
    }, Object.defineProperty(a, "__esModule", {
        value: !0
    }), o(t, a), o(n, a), r.s(["l", 0, a])
}, 199834, 363194, r => {
    "use strict";
    var e = r.i(865800),
        a = r.i(416340),
        t = r.i(734094),
        i = r.i(431346),
        o = r.i(614515),
        n = r.i(993807),
        g = r.i(972455);
    r.i(221628);
    var b = (0, o.default)({
            name: "Typography"
        })(function(r) {
            return {
                root: {
                    textDecoration: "none",
                    fontStyle: "normal"
                },
                h1: r.typography.h1,
                h2: r.typography.h2,
                h3: r.typography.h3,
                h4: r.typography.h4,
                h5: r.typography.h5,
                h6: r.typography.h6,
                subtitle1: r.typography.subtitle1,
                subtitle2: r.typography.subtitle2,
                body1: r.typography.body1,
                body2: r.typography.body2,
                caption: r.typography.caption,
                captionHeader: r.typography.captionHeader,
                captionBody: r.typography.captionBody,
                captionSmall: r.typography.captionSmall,
                button: r.typography.button,
                overline: r.typography.overline,
                footer: r.typography.footer,
                code: r.typography.code,
                codeDense: r.typography.codeDense,
                chip: r.typography.chip,
                largeLabel1: r.typography.largeLabel1,
                largeLabel2: r.typography.largeLabel2,
                legalDisclaimer: r.typography.legalDisclaimer,
                smallLabel1: r.typography.smallLabel1,
                smallLabel2: r.typography.smallLabel2,
                buttonLarge: r.typography.buttonLarge,
                buttonMedium: r.typography.buttonMedium,
                buttonSmall: r.typography.buttonSmall,
                tooltip: r.typography.tooltip,
                alertTitle: r.typography.alertTitle,
                tableHead: r.typography.tableHead,
                avatarLetter: r.typography.avatarLetter,
                hero: r.typography.hero,
                italics: {
                    fontStyle: "italic"
                },
                underline: {
                    textDecoration: "underline"
                },
                colorPrimary: {
                    color: r.palette.content.standard
                },
                colorSecondary: {
                    color: r.palette.content.muted
                },
                colorDisabled: {
                    color: r.palette.content.disabled
                },
                colorError: {
                    color: "dark" === r.palette.mode ? t.l.TokensDark.Color.Extended.Red.Red_700 : r.palette.content.alert.important
                },
                colorInfo: {
                    color: "dark" === r.palette.mode ? t.l.TokensDark.Color.Extended.Blue.Blue_600 : t.l.TokensDark.Color.Extended.Blue.Blue_800
                },
                colorWarning: {
                    color: "dark" === r.palette.mode ? r.palette.actionV2.notice.fill : t.l.TokensLight.Color.Extended.Yellow.Yellow_800
                },
                colorSuccess: {
                    color: "dark" === r.palette.mode ? r.palette.actionV2.active.fill : t.l.TokensLight.Color.Extended.Green.Green_800
                }
            }
        }),
        l = (0, a.forwardRef)(function(r, t) {
            var o, l = r.classes,
                d = r.children,
                S = r.paragraph,
                u = void 0 !== S && S,
                _ = r.component,
                c = r.color,
                s = r.variant,
                p = r.italics,
                B = r.underline,
                h = r.className,
                F = (0, e.a)(r, ["classes", "children", "paragraph", "component", "color", "variant", "italics", "underline", "className"]),
                m = b(void 0, {
                    props: {
                        classes: (0, n.default)(l, h)
                    }
                }),
                y = m.classes,
                z = m.cx;
            return a.default.createElement(g.T, (0, e._)({}, F, {
                classes: (0, e._)((0, e._)({}, y), {
                    root: z(y[void 0 === s ? "body1" : s], y["color".concat((0, i.capitalize)(void 0 === c ? "inherit" : c))], ((o = {})[y.italics] = void 0 !== p && p, o[y.underline] = void 0 !== B && B, o), y.root)
                }),
                ref: t,
                paragraph: u,
                component: void 0 === _ ? u ? "p" : "span" : _,
                color: "inherit",
                variant: "inherit"
            }), d)
        });
    r.s(["default", 0, l], 363194), r.s(["Typography", 0, l], 199834)
}, 969708, r => {
    "use strict";
    var e = r.i(416340),
        a = "u" > typeof window ? e.useLayoutEffect : e.useEffect;
    r.s(["u", 0, a])
}, 431346, 896729, 371927, r => {
    "use strict";
    var e = r.i(652199),
        a = r.i(962560),
        t = r.i(273589),
        i = r.i(416340),
        o = r.i(221628),
        n = r.i(42569),
        g = r.i(519618);

    function b(r) {
        let {
            theme: e,
            name: a,
            props: t
        } = r;
        return e && e.components && e.components[a] && e.components[a].defaultProps ? (0, g.r)(e.components[a].defaultProps, t) : t
    }
    r.s(["g", 0, b], 896729);
    var l = r.i(969708),
        d = r.i(687636);
    let S = i.useSyncExternalStore;

    function u(r) {
        let e = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {},
            a = (0, d.u)(),
            t = "u" > typeof window && void 0 !== window.matchMedia,
            {
                defaultMatches: o = !1,
                matchMedia: n = t ? window.matchMedia : null,
                ssrMatchMedia: g = null,
                noSsr: u = !1
            } = b({
                name: "MuiUseMediaQuery",
                props: e,
                theme: a
            }),
            _ = "function" == typeof r ? r(a) : r;
        return (void 0 !== S ? function(r, e, a, t, o) {
            let n = i.useCallback(() => e, [e]),
                g = i.useMemo(() => {
                    if (o && a) return () => a(r).matches;
                    if (null !== t) {
                        let {
                            matches: e
                        } = t(r);
                        return () => e
                    }
                    return n
                }, [n, r, t, o, a]),
                [b, l] = i.useMemo(() => {
                    if (null === a) return [n, () => () => {}];
                    let e = a(r);
                    return [() => e.matches, r => (e.addListener(r), () => {
                        e.removeListener(r)
                    })]
                }, [n, a, r]);
            return S(l, b, g)
        } : function(r, e, a, t, o) {
            let [n, g] = i.useState(() => o && a ? a(r).matches : t ? t(r).matches : e);
            return (0, l.u)(() => {
                let e = !0;
                if (!a) return;
                let t = a(r),
                    i = () => {
                        e && g(t.matches)
                    };
                return i(), t.addListener(i), () => {
                    e = !1, t.removeListener(i)
                }
            }, [r, a]), n
        })(_ = _.replace(/^@media( ?)/m, ""), o, n, g, u)
    }
    r.s(["u", 0, u], 371927), r.i(309742);
    var _ = r.i(696180);
    let c = ["initialWidth", "width"],
        s = ["xs", "sm", "md", "lg", "xl"],
        p = function(r, e) {
            let a = !(arguments.length > 2) || void 0 === arguments[2] || arguments[2];
            return a ? s.indexOf(r) <= s.indexOf(e) : s.indexOf(r) < s.indexOf(e)
        },
        B = function(r, e) {
            let a = arguments.length > 2 && void 0 !== arguments[2] && arguments[2];
            return a ? s.indexOf(e) <= s.indexOf(r) : s.indexOf(e) < s.indexOf(r)
        };
    (function() {
        let r = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {};
        return n => {
            let {
                withTheme: g = !1,
                noSSR: d = !1,
                initialWidth: S
            } = r;
            return function(r) {
                let _ = (0, e.u)(),
                    s = r.theme || _,
                    p = b({
                        theme: s,
                        name: "MuiWithWidth",
                        props: r
                    }),
                    {
                        initialWidth: B,
                        width: h
                    } = p,
                    F = (0, t._)(p, c),
                    [m, y] = i.useState(!1);
                (0, l.u)(() => {
                    y(!0)
                }, []);
                let z = s.breakpoints.keys.slice().reverse().reduce((r, e) => {
                        let a = u(s.breakpoints.up(e));
                        return !r && a ? e : r
                    }, null),
                    L = (0, a._)({
                        width: h || (m || d ? z : void 0) || B || S
                    }, g ? {
                        theme: s
                    } : {}, F);
                return void 0 === L.width ? null : (0, o.jsx)(n, (0, a._)({}, L))
            }
        }
    })()(function(r) {
        let {
            children: a,
            only: t,
            width: n
        } = r, g = (0, e.u)(), b = !0;
        if (t)
            if (Array.isArray(t)) {
                for (let r = 0; r < t.length; r += 1)
                    if (n === t[r]) {
                        b = !1;
                        break
                    }
            } else t && n === t && (b = !1);
        if (b)
            for (let e = 0; e < g.breakpoints.keys.length; e += 1) {
                let a = g.breakpoints.keys[e],
                    t = r["".concat(a, "Up")],
                    i = r["".concat(a, "Down")];
                if (t && p(a, n) || i && B(a, n)) {
                    b = !1;
                    break
                }
            }
        return b ? (0, o.jsx)(i.Fragment, {
            children: a
        }) : null
    }), (0, _.g)("PrivateHiddenCss", ["root", "xlDown", "xlUp", "onlyXl", "lgDown", "lgUp", "onlyLg", "mdDown", "mdUp", "onlyMd", "smDown", "smUp", "onlySm", "xsDown", "xsUp", "onlyXs"]);
    (0, n.s)("div", {
        name: "PrivateHiddenCss",
        slot: "Root"
    })(r => {
        let {
            theme: e,
            ownerState: t
        } = r, i = {
            display: "none"
        };
        return (0, a._)({}, t.breakpoints.map(r => {
            let {
                breakpoint: a,
                dir: t
            } = r;
            return "only" === t ? {
                [e.breakpoints.only(a)]: i
            } : "up" === t ? {
                [e.breakpoints.up(a)]: i
            } : {
                [e.breakpoints.down(a)]: i
            }
        }).reduce((r, e) => (Object.keys(e).forEach(a => {
            r[a] = e[a]
        }), r), {}))
    });
    var h = e.u;
    r.s(["alpha", 0, function(r, e) {
        return e < 16 ? "".concat(r, "0").concat(e.toString(16)) : "".concat(r).concat(e.toString(16))
    }, "capitalize", 0, function(r) {
        return r.charAt(0).toUpperCase() + r.slice(1)
    }, "useTheme", 0, h], 431346)
}]);

//# debugId=88e8159b-0650-c006-ac0e-4c97c0bfd91a
//# sourceMappingURL=3464t2orc3iqf.js.map