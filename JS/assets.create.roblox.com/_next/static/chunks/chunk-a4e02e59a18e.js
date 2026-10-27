;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "0b7e1919-aa52-1351-480c-64269391fd5d")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 578717, e => {
    "use strict";
    var r = e.i(416340),
        o = e.i(30941),
        a = e.i(393885);

    function t() {
        for (var e = [], r = 0; r < arguments.length; r++) e[r] = arguments[r];
        return ["".concat(e[0], "px ").concat(e[1], "px ").concat(e[2], "px ").concat(e[3], "px rgba(0, 0, 0, ").concat(.2, ")"), "".concat(e[4], "px ").concat(e[5], "px ").concat(e[6], "px ").concat(e[7], "px rgba(0, 0, 0, ").concat(.14, ")"), "".concat(e[8], "px ").concat(e[9], "px ").concat(e[10], "px ").concat(e[11], "px rgba(0, 0, 0, ").concat(.12, ")")].join(",")
    }
    var n = ["none", t(0, 1, 3, 0, 0, 1, 1, 0, 0, 2, 1, -1), t(0, 1, 5, 0, 0, 2, 2, 0, 0, 3, 1, -2), t(0, 1, 8, 0, 0, 3, 4, 0, 0, 3, 3, -2), t(0, 2, 4, -1, 0, 4, 5, 0, 0, 1, 10, 0), t(0, 3, 5, -1, 0, 5, 8, 0, 0, 1, 14, 0), t(0, 3, 5, -1, 0, 6, 10, 0, 0, 1, 18, 0), t(0, 4, 5, -2, 0, 7, 10, 1, 0, 2, 16, 1), t(0, 5, 5, -3, 0, 8, 10, 1, 0, 3, 14, 2), t(0, 5, 6, -3, 0, 9, 12, 1, 0, 3, 16, 2), t(0, 6, 6, -3, 0, 10, 14, 1, 0, 4, 18, 3), t(0, 6, 7, -4, 0, 11, 15, 1, 0, 4, 20, 3), t(0, 7, 8, -4, 0, 12, 17, 2, 0, 5, 22, 4), t(0, 7, 8, -4, 0, 13, 19, 2, 0, 5, 24, 4), t(0, 7, 9, -4, 0, 14, 21, 2, 0, 5, 26, 4), t(0, 8, 9, -5, 0, 15, 22, 2, 0, 6, 28, 5), t(0, 8, 10, -5, 0, 16, 24, 2, 0, 6, 30, 5), t(0, 8, 11, -5, 0, 17, 26, 2, 0, 6, 32, 5), t(0, 9, 11, -5, 0, 18, 28, 2, 0, 7, 34, 6), t(0, 9, 12, -6, 0, 19, 29, 2, 0, 7, 36, 6), t(0, 10, 13, -6, 0, 20, 31, 3, 0, 8, 38, 7), t(0, 10, 13, -6, 0, 21, 33, 3, 0, 8, 40, 7), t(0, 10, 14, -6, 0, 22, 35, 3, 0, 8, 42, 7), t(0, 11, 14, -7, 0, 23, 36, 3, 0, 9, 44, 8), t(0, 11, 15, -7, 0, 24, 38, 3, 0, 9, 46, 8)];
    (z = D || (D = {})).BottomLeft = "borderBottomLeftRadius", z.BottomRight = "borderBottomRightRadius", z.TopLeft = "borderTopLeftRadius", z.TopRight = "borderTopRightRadius", z.All = "borderRadius";
    var i = function(e, r) {
            var o;
            return (o = {})[r] = e, o
        },
        g = function(e) {
            return {
                none: i(0, e),
                xsmall: i("4px", e),
                small: i("6px", e),
                medium: i("8px", e),
                large: i("12px", e),
                circle: i("50%", e)
            }
        },
        d = {
            radius: (0, o._)((0, o._)({}, g(D.All)), {
                bottomLeft: g(D.BottomLeft),
                bottomRight: g(D.BottomRight),
                topLeft: g(D.TopLeft),
                topRight: g(D.TopRight)
            })
        },
        l = function(e) {
            return e.split("").map(function(e, r) {
                return e.toUpperCase() === e ? "".concat(0 !== r ? "-" : "").concat(e.toLowerCase()) : e
            }).join("")
        },
        b = function() {
            for (var e = [], r = 0; r < arguments.length; r++) e[r] = arguments[r];
            return e.reduce(function(e, r) {
                return "".concat(e).concat(r)
            }, "")
        },
        s = e.i(41758),
        c = e.i(438365),
        u = "#000000",
        S = "#FFFFFF",
        m = {
            1200: .96,
            1100: .88,
            1e3: .8,
            900: .72,
            800: .64,
            700: .56,
            600: .48,
            500: .4,
            400: .32,
            300: .24,
            250: .2,
            200: .16,
            150: .12,
            125: .1,
            100: .08,
            75: .06,
            50: .04,
            0: 0
        },
        _ = function(e) {
            return Object.fromEntries(Object.entries(m).map(function(r) {
                var o = r[0],
                    a = r[1];
                return [o, (0, c.a)(e, a)]
            }))
        },
        h = {
            black: u,
            1200: "#111216",
            1100: "#18191D",
            1e3: "#1F2024",
            900: "#25272C",
            800: "#2B2D33",
            700: "#313339",
            650: "#696A6D",
            600: "#A1A2A5",
            500: "#BBBCBE",
            400: "#D5D5D7",
            300: "#E5E5E6",
            200: "#F2F2F3",
            100: "#F9F9F9",
            white: S
        },
        k = {
            1200: "#270402",
            1100: "#3B0703",
            1e3: "#580A04",
            900: "#881007",
            800: "#B0140C",
            700: "#D5241A",
            600: "#EF2F25",
            500: "#F45B52",
            400: "#F57E75",
            300: "#F89C95",
            200: "#FAB4AF",
            100: "#FCD0CD"
        },
        B = {
            1200: "#291D00",
            1100: "#3D2C00",
            1e3: "#634700",
            900: "#946A00",
            800: "#B28410",
            700: "#D4A121",
            600: "#F3BA2B",
            500: "#F5C73D",
            400: "#F7D469",
            300: "#FADE89",
            200: "#FBE6AD",
            100: "#FDF0CE"
        },
        F = {
            1200: "#022716",
            1100: "#02311B",
            1e3: "#044E2C",
            900: "#036D3D",
            800: "#06844B",
            700: "#0F995B",
            600: "#0FB369",
            500: "#27C473",
            400: "#44DA87",
            300: "#60E6A1",
            200: "#8FEAB7",
            100: "#C3F4DA"
        },
        p = {
            1400: "#00145C",
            1300: "#001B7A",
            1200: "#002299",
            1100: "#0027B8",
            1e3: "#002DD6",
            900: "#0035F5",
            800: "#1446FF",
            700: "#335FFF",
            600: "#528BFF",
            500: "#70A0FF",
            400: "#8FB4FF",
            300: "#ADC9FF",
            200: "#CCDDFF",
            100: "#EBF1FF"
        },
        C = {
            black: _(u),
            white: _(S),
            mutedBlue: {
                dark: _("#333B4C"),
                light: _("#BBC2D1")
            }
        },
        v = "#009E57",
        f = "#CF2017",
        L = "#DEA517",
        y = {},
        T = {};
    Object.defineProperty(T, "__esModule", {
        value: !0
    }), T.TokensDark = void 0, T.TokensDark = {
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
    var z, D, M, H, W = {};
    Object.defineProperty(W, "__esModule", {
        value: !0
    }), W.TokensLight = void 0, W.TokensLight = {
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
    }, M = s.c && s.c.__createBinding || (Object.create ? function(e, r, o, a) {
        void 0 === a && (a = o), Object.defineProperty(e, a, {
            enumerable: !0,
            get: function() {
                return r[o]
            }
        })
    } : function(e, r, o, a) {
        void 0 === a && (a = o), e[a] = r[o]
    }), H = s.c && s.c.__exportStar || function(e, r) {
        for (var o in e) "default" === o || Object.prototype.hasOwnProperty.call(r, o) || M(r, e, o)
    }, Object.defineProperty(y, "__esModule", {
        value: !0
    }), H(T, y), H(W, y);
    var O = {
            primary: {
                main: p[800],
                light: p[300],
                dark: p[700],
                contrastText: h[1200]
            },
            statePrimary: {
                containedHoverBackground: "#3C87B3",
                outlinedHoverBackground: "#292D2F",
                outlinedRestingBorder: "#4E768E"
            },
            secondary: {
                main: h[300],
                light: h[100],
                dark: h[500],
                contrastText: (0, c.a)(h.black, .87)
            },
            stateSecondary: {
                containedHoverBackground: "#898989",
                outlinedHoverBackground: (0, c.a)(h[100], .16),
                outlinedRestingBorder: h[600]
            },
            error: {
                main: k[500],
                dark: k[700],
                light: k[300],
                contrastText: h[1200]
            },
            stateError: {
                containedHoverBackground: "#AB2F26",
                outlinedHoverBackground: (0, c.a)("#F44336", .08),
                outlinedRestingBorder: (0, c.a)("#F44336", .5)
            },
            alertError: {
                content: k[300],
                background: k[1100]
            },
            info: {
                main: p[500],
                dark: p[700],
                light: p[300],
                contrastText: h[1200]
            },
            stateInfo: {
                containedHoverBackground: "#0071B3",
                outlinedHoverBackground: (0, c.a)(p[600], .5),
                outlinedRestingBorder: (0, c.a)(p[600], .16)
            },
            alertInfo: {
                content: p[300],
                background: p[1100]
            },
            warning: {
                main: B[500],
                dark: B[700],
                light: B[300],
                contrastText: (0, c.a)(h[1200], .87)
            },
            stateWarning: {
                containedHoverBackground: "#AD8B30",
                outlinedHoverBackground: (0, c.a)(B[600], .5),
                outlinedRestingBorder: (0, c.a)(B[600], .16)
            },
            alertWarning: {
                content: B[300],
                background: B[1100]
            },
            success: {
                main: F[500],
                dark: F[700],
                light: F[300],
                contrastText: h[1200]
            },
            stateSuccess: {
                containedHoverBackground: "#008146",
                outlinedHoverBackground: (0, c.a)(F[500], .5),
                outlinedRestingBorder: (0, c.a)(F[500], .16)
            },
            alertSuccess: {
                content: F[300],
                background: F[1100]
            },
            text: {
                primary: h.white,
                secondary: h[500],
                disabled: h[600]
            },
            action: {
                active: h[100],
                hover: C.white[100],
                selected: C.white[150],
                disabled: h[600],
                disabledBackground: h[800],
                focus: (0, c.a)(h.white, .12)
            },
            background: {
                default: y.TokensDark.Color.Surface.Surface_0,
                tooltips: h[700],
                media: h[900],
                snackbar: h[900],
                paper: h[1e3]
            },
            foreground: {
                paper: h[900],
                main: h[700],
                secondary: h[600]
            },
            media: {
                secondaryBackground: h[1e3],
                toolbar: h[800],
                divider: h[700],
                bottomOverlay: "linear-gradient(0deg, rgba(29, 29, 29, 0.6), rgba(29, 29, 29, 0))",
                inlineCodeBackground: h[800],
                topOverlay: "linear-gradient(180deg, rgba(29, 29, 29, 0.6), rgba(29, 29, 29, 0))"
            },
            layout: {
                divider: h.black
            },
            stickyFooter: {
                defaultFill: (0, c.a)(h[1200], .8)
            },
            divider: h[700],
            outlineBorder: h[700],
            standardInputLine: (0, c.a)(h.white, .42),
            backdropOverlay: (0, c.a)(h[1e3], .5),
            activeRating: B[700],
            filledInputBackground: (0, c.a)(h.white, .09)
        },
        x = {
            primary: {
                main: p[800],
                light: p[500],
                dark: p[700],
                contrastText: h.white
            },
            statePrimary: {
                containedHoverBackground: p[800],
                outlinedHoverBackground: C.mutedBlue.dark[75],
                outlinedRestingBorder: C.black[150]
            },
            secondary: {
                main: h[1200],
                light: h[100],
                dark: h[1200],
                contrastText: h.white
            },
            stateSecondary: {
                containedHoverBackground: h[800],
                outlinedHoverBackground: C.mutedBlue.dark[75],
                outlinedRestingBorder: C.black[150]
            },
            error: {
                main: f,
                dark: f,
                light: f,
                contrastText: h.white
            },
            stateError: {
                containedHoverBackground: k[800],
                outlinedHoverBackground: C.mutedBlue.dark[75],
                outlinedRestingBorder: C.black[150]
            },
            alertError: {
                content: k[1e3],
                background: k[100]
            },
            info: {
                main: p[700],
                light: p[500],
                dark: p[700],
                contrastText: h.white
            },
            stateInfo: {
                containedHoverBackground: p[800],
                outlinedHoverBackground: C.mutedBlue.dark[75],
                outlinedRestingBorder: C.black[150]
            },
            alertInfo: {
                content: p[1e3],
                background: p[100]
            },
            warning: {
                main: L,
                dark: L,
                light: L,
                contrastText: h[1200]
            },
            stateWarning: {
                containedHoverBackground: B[500],
                outlinedHoverBackground: C.mutedBlue.dark[75],
                outlinedRestingBorder: C.black[150]
            },
            alertWarning: {
                content: B[1e3],
                background: B[100]
            },
            success: {
                main: v,
                dark: v,
                light: v,
                contrastText: h[1200]
            },
            stateSuccess: {
                containedHoverBackground: F[500],
                outlinedHoverBackground: C.mutedBlue.dark[75],
                outlinedRestingBorder: C.black[150]
            },
            alertSuccess: {
                content: F[1e3],
                background: F[100]
            },
            text: {
                primary: h[1200],
                secondary: h[700],
                disabled: h[600]
            },
            action: {
                active: h[700],
                hover: C.mutedBlue.dark[75],
                selected: C.mutedBlue.dark[150],
                disabled: h[600],
                disabledBackground: C.mutedBlue.dark[75],
                focus: C.mutedBlue.dark[150]
            },
            background: {
                default: y.TokensLight.Color.Surface.Surface_0,
                tooltips: h[300],
                media: h[300],
                snackbar: h.white,
                paper: h.white
            },
            foreground: {
                paper: h.white,
                main: h[200],
                secondary: h[300]
            },
            media: {
                secondaryBackground: h.white,
                toolbar: h[300],
                divider: C.black[150],
                bottomOverlay: "linear-gradient(0deg, rgba(29, 29, 29, 0.6), rgba(29, 29, 29, 0))",
                inlineCodeBackground: h[300],
                topOverlay: "linear-gradient(180deg, rgba(29, 29, 29, 0.6), rgba(29, 29, 29, 0))"
            },
            layout: {
                divider: C.black[150]
            },
            stickyFooter: {
                defaultFill: (0, c.a)("#F9F9F9", .8)
            },
            divider: C.black[150],
            outlineBorder: C.black[150],
            standardInputLine: y.TokensLight.Color.Stroke.Default,
            backdropOverlay: C.black[600],
            activeRating: B[600],
            filledInputBackground: C.mutedBlue.dark[100]
        },
        E = {
            active: y.TokensDark.Color.System.Neutral,
            disabled: y.TokensDark.Color.Extended.Gray.Gray_600,
            dragged: y.TokensDark.Color.Shift.Shift_100,
            disabledBackground: y.TokensDark.Color.State.Hover,
            focusVisible: y.TokensDark.Color.Shift.Shift_300,
            focus: y.TokensDark.Color.State.Press,
            selected: y.TokensDark.Color.State.Press,
            hover: y.TokensDark.Color.State.Hover
        },
        P = {
            outline: y.TokensDark.Color.Stroke.Emphasis,
            400: y.TokensDark.Color.Shift.Shift_100,
            300: y.TokensDark.Color.Surface.Surface_300,
            200: y.TokensDark.Color.Surface.Surface_200,
            100: y.TokensDark.Color.Surface.Surface_100,
            0: y.TokensDark.Color.Surface.Surface_0
        },
        A = {
            primaryBrand: {
                fill: y.TokensDark.Color.System.Emphasis,
                containedHoverFocus: y.TokensDark.Color.Extended.Blue.Blue_600
            },
            primary: {
                fill: y.TokensDark.Color.Content.Default,
                containedHoverFocus: y.TokensDark.Color.Content.Emphasis
            },
            secondary: {
                fill: y.TokensDark.Color.ActionStandard.Background,
                containedHoverFocus: y.TokensDark.Color.Shift.Shift_400
            },
            important: {
                fill: y.TokensDark.Color.System.Alert,
                containedHoverFocus: y.TokensDark.Color.Extended.Red.Red_700
            },
            notice: {
                fill: y.TokensDark.Color.System.Warning,
                containedHoverFocus: y.TokensDark.Color.Extended.Yellow.Yellow_300
            },
            active: {
                fill: y.TokensDark.Color.System.Success,
                containedHoverFocus: y.TokensDark.Color.Extended.Green.Green_400
            }
        },
        w = {
            standard: y.TokensDark.Color.Content.Emphasis,
            muted: y.TokensDark.Color.Content.Default,
            disabled: y.TokensDark.Color.Content.Muted,
            inverse: y.TokensDark.Inverse.Content.Emphasis,
            action: y.TokensDark.Color.Content.Link,
            static: {
                light: y.TokensDark.LightMode.Surface.Surface_0,
                dark: y.TokensDark.DarkMode.Surface.Surface_0
            },
            alert: {
                inform: y.TokensDark.Color.System.Emphasis,
                important: y.TokensDark.Color.System.Alert,
                active: y.TokensDark.Color.System.Success,
                notice: y.TokensDark.Color.System.Warning
            }
        },
        R = {
            divider: y.TokensDark.Color.Stroke.Default,
            input: {
                filled: {
                    enableFill: y.TokensDark.Color.Surface.Surface_200,
                    hoverFill: y.TokensDark.Color.Surface.Surface_300
                },
                outlined: {
                    enabledBorder: y.TokensDark.Color.Stroke.Default,
                    hoverBorder: y.TokensDark.Color.Content.Default,
                    focusBorder: y.TokensDark.Color.Content.Default,
                    errorBorder: y.TokensDark.Color.System.Alert
                }
            },
            alert: {
                importantContent: y.TokensDark.DarkMode.Content.Emphasis,
                importantFill: "rgba(223, 40, 31, 0.16)",
                noticeContent: y.TokensDark.DarkMode.Content.Emphasis,
                noticeFill: "rgba(242, 186, 42, 0.16)",
                informContent: y.TokensDark.DarkMode.Content.Emphasis,
                informFill: "rgba(51, 95, 255, 0.16)",
                activeContent: y.TokensDark.DarkMode.Content.Emphasis,
                activeFill: "rgba(57, 197, 130, 0.16)"
            },
            backdrop: {
                fill: y.TokensDark.Color.Common.Scrim
            },
            button: {
                disabled: y.TokensDark.Color.Content.Muted,
                destructiveContainedContent: y.TokensDark.Color.Content.Emphasis
            },
            label: {
                warningText: y.TokensDark.Color.System.Warning,
                importantContent: k[300],
                importantFill: k[1100],
                noticeContent: B[300],
                noticeFill: B[1100],
                informContent: p[300],
                informFill: p[1100],
                activeContent: F[300],
                activeFill: F[1100]
            },
            rating: {
                enabledBorder: y.TokensDark.Color.System.Warning,
                activeFill: y.TokensDark.Color.ActionStandard.Foreground
            },
            stickyFooter: {
                fill: y.TokensDark.Color.Common.Scrim
            },
            media: {
                fill: y.TokensDark.Color.OverMedia.OverMedia_300,
                toolbar: y.TokensDark.Color.Common.NavigationBar,
                overlay: y.TokensDark.DarkMode.OverMedia.OverMedia_200
            },
            mediaButtons: {
                onMediaLight: {
                    fill: y.TokensDark.DarkMode.Common.Shadow,
                    hover: y.TokensDark.DarkMode.Common.Scrim,
                    focus: y.TokensDark.DarkMode.Common.Scrim
                },
                onMediaDark: {
                    fill: y.TokensDark.Color.OverMedia.OverMedia_0,
                    hover: y.TokensDark.Color.OverMedia.OverMedia_300,
                    focus: y.TokensDark.Color.OverMedia.OverMedia_300
                },
                outlined: {
                    enabledBorder: P.outline,
                    hoverBorder: y.TokensDark.Color.Stroke.Emphasis,
                    focusBorder: y.TokensDark.Color.Stroke.Emphasis,
                    errorBorder: y.TokensDark.Color.System.Alert
                }
            },
            avatar: {
                fill: y.TokensDark.Color.Shift.Shift_400
            },
            slider: {
                trackInvertedBackground: (0, c.l)(w.disabled, .62),
                trackInvertedBorder: (0, c.l)(w.disabled, .62)
            },
            switch: {
                slideFill: y.TokensDark.Inverse.Content.Muted,
                knobFill: y.TokensDark.Color.Content.Emphasis,
                disabledKnob: y.TokensDark.Inverse.Content.Muted
            },
            inlineCode: {
                asText: {
                    fill: y.TokensDark.Color.Shift.Shift_400,
                    color: w.standard
                },
                asLink: {
                    fill: y.TokensDark.Color.Shift.Shift_400,
                    color: y.TokensDark.Color.Content.Link
                }
            },
            linearProgress: {
                backgroundSecondary: y.TokensDark.Inverse.Content.Muted
            },
            typography: {
                errorContent: y.TokensDark.Color.Extended.Red.Red_700,
                infoContent: y.TokensDark.Color.Extended.Blue.Blue_600,
                warningContent: A.notice.fill,
                successContent: A.active.fill
            }
        },
        G = {
            global: y.TokensDark.Color.Common.NavigationBar,
            default: y.TokensDark.Color.Common.NavigationBar
        },
        I = (0, o._)({
            mode: "dark",
            common: {
                black: y.TokensDark.DarkMode.Surface.Surface_0,
                white: y.TokensDark.LightMode.Surface.Surface_0
            },
            actionV2: A,
            content: w,
            states: E,
            surface: P,
            navigation: G,
            components: R
        }, O),
        N = {
            active: y.TokensLight.Color.System.Neutral,
            disabled: y.TokensLight.Color.Extended.Gray.Gray_200,
            dragged: y.TokensLight.Color.Shift.Shift_100,
            disabledBackground: y.TokensLight.Color.State.Hover,
            focusVisible: y.TokensLight.Color.Shift.Shift_300,
            focus: y.TokensLight.Color.State.Press,
            selected: y.TokensLight.Color.State.Press,
            hover: y.TokensLight.Color.State.Hover
        },
        X = {
            outline: y.TokensLight.Color.Stroke.Emphasis,
            400: y.TokensLight.Color.Shift.Shift_100,
            300: y.TokensLight.Color.Surface.Surface_300,
            200: y.TokensLight.Color.Surface.Surface_200,
            100: y.TokensLight.Color.Surface.Surface_100,
            0: y.TokensLight.Color.Surface.Surface_0
        },
        Y = {
            primaryBrand: {
                fill: y.TokensLight.Color.System.Emphasis,
                containedHoverFocus: y.TokensLight.Color.Extended.Blue.Blue_800
            },
            primary: {
                fill: y.TokensLight.Color.Content.Default,
                containedHoverFocus: y.TokensLight.Color.Content.Emphasis
            },
            secondary: {
                fill: y.TokensLight.Color.ActionStandard.Background,
                containedHoverFocus: y.TokensLight.Color.Shift.Shift_400
            },
            important: {
                fill: y.TokensLight.Color.System.Alert,
                containedHoverFocus: y.TokensLight.Color.Extended.Red.Red_900
            },
            notice: {
                fill: y.TokensLight.Color.System.Warning,
                containedHoverFocus: y.TokensLight.Color.Extended.Yellow.Yellow_500
            },
            active: {
                fill: y.TokensLight.Color.System.Success,
                containedHoverFocus: y.TokensLight.Color.Extended.Green.Green_600
            }
        },
        q = {
            standard: y.TokensLight.Color.Content.Emphasis,
            muted: y.TokensLight.Color.Content.Default,
            disabled: y.TokensLight.Color.Content.Muted,
            inverse: y.TokensLight.Inverse.Content.Emphasis,
            action: y.TokensLight.Color.Content.Link,
            static: {
                light: y.TokensLight.LightMode.Surface.Surface_0,
                dark: y.TokensLight.DarkMode.Surface.Surface_0
            },
            alert: {
                inform: y.TokensLight.Color.System.Emphasis,
                important: y.TokensLight.Color.System.Alert,
                active: y.TokensLight.Color.System.Success,
                notice: y.TokensLight.Color.System.Warning
            }
        },
        j = {
            divider: y.TokensLight.Color.Stroke.Default,
            input: {
                filled: {
                    enableFill: y.TokensLight.Color.Surface.Surface_200,
                    hoverFill: y.TokensLight.Color.Surface.Surface_300
                },
                outlined: {
                    enabledBorder: y.TokensLight.Color.Stroke.Default,
                    hoverBorder: y.TokensLight.Color.Content.Default,
                    focusBorder: y.TokensLight.Color.Content.Default,
                    errorBorder: y.TokensLight.Color.System.Alert
                }
            },
            alert: {
                importantContent: y.TokensLight.LightMode.Content.Emphasis,
                importantFill: "rgba(223, 40, 31, 0.16)",
                noticeContent: y.TokensLight.LightMode.Content.Emphasis,
                noticeFill: "rgba(242, 186, 42, 0.16)",
                informContent: y.TokensLight.LightMode.Content.Emphasis,
                informFill: "rgba(51, 95, 255, 0.16)",
                activeContent: y.TokensLight.LightMode.Content.Emphasis,
                activeFill: "rgba(57, 197, 130, 0.16)"
            },
            backdrop: {
                fill: y.TokensLight.Color.Common.Scrim
            },
            label: {
                warningText: y.TokensLight.Color.Extended.Yellow.Yellow_800,
                importantContent: k[1e3],
                importantFill: k[100],
                noticeContent: B[1e3],
                noticeFill: B[100],
                informContent: p[1e3],
                informFill: p[100],
                activeContent: F[1e3],
                activeFill: F[100]
            },
            button: {
                disabled: y.TokensLight.Color.Content.Muted,
                destructiveContainedContent: y.TokensDark.Color.Content.Emphasis
            },
            rating: {
                enabledBorder: y.TokensLight.Color.System.Warning,
                activeFill: y.TokensLight.Color.ActionStandard.Foreground
            },
            stickyFooter: {
                fill: y.TokensLight.Color.Common.Scrim
            },
            media: {
                fill: y.TokensLight.Color.OverMedia.OverMedia_300,
                toolbar: y.TokensLight.Color.Common.NavigationBar,
                overlay: y.TokensLight.DarkMode.OverMedia.OverMedia_200
            },
            mediaButtons: {
                onMediaLight: {
                    fill: y.TokensLight.DarkMode.Common.Shadow,
                    hover: y.TokensLight.DarkMode.Common.Scrim,
                    focus: y.TokensLight.DarkMode.Common.Scrim
                },
                onMediaDark: {
                    fill: y.TokensLight.Color.OverMedia.OverMedia_0,
                    hover: y.TokensLight.Color.OverMedia.OverMedia_300,
                    focus: y.TokensLight.Color.OverMedia.OverMedia_300
                },
                outlined: {
                    enabledBorder: X.outline,
                    hoverBorder: y.TokensLight.Color.Stroke.Emphasis,
                    focusBorder: y.TokensLight.Color.Stroke.Emphasis,
                    errorBorder: y.TokensLight.Color.System.Alert
                }
            },
            avatar: {
                fill: y.TokensLight.Color.Shift.Shift_400
            },
            slider: {
                trackInvertedBackground: (0, c.l)(q.disabled, .62),
                trackInvertedBorder: (0, c.l)(q.disabled, .62)
            },
            switch: {
                slideFill: y.TokensLight.Inverse.Content.Muted,
                knobFill: y.TokensLight.Color.Content.Emphasis,
                disabledKnob: y.TokensLight.Inverse.Content.Muted
            },
            inlineCode: {
                asText: {
                    fill: y.TokensLight.Color.Shift.Shift_400,
                    color: q.standard
                },
                asLink: {
                    fill: y.TokensLight.Color.Shift.Shift_400,
                    color: y.TokensLight.Color.Content.Link
                }
            },
            linearProgress: {
                backgroundSecondary: y.TokensLight.Inverse.Content.Muted
            },
            typography: {
                errorContent: q.alert.important,
                infoContent: y.TokensLight.Color.Extended.Blue.Blue_800,
                warningContent: y.TokensLight.Color.Extended.Yellow.Yellow_800,
                successContent: y.TokensLight.Color.Extended.Green.Green_800
            }
        },
        U = {
            global: y.TokensLight.Color.Common.NavigationBar,
            default: y.TokensLight.Color.Common.NavigationBar
        },
        V = (0, o._)({
            mode: "light",
            common: {
                black: y.TokensLight.DarkMode.Surface.Surface_0,
                white: y.TokensLight.LightMode.Surface.Surface_0
            },
            actionV2: Y,
            content: q,
            states: N,
            surface: X,
            navigation: U,
            components: j
        }, x),
        K = {
            outline: "var(--dark-mode-stroke-emphasis)",
            400: "var(--dark-mode-shift-100)",
            300: "var(--dark-mode-surface-300)",
            200: "var(--dark-mode-surface-200)",
            100: "var(--dark-mode-surface-100)",
            0: "var(--dark-mode-surface-0)"
        },
        J = {
            primaryBrand: {
                fill: "var(--dark-mode-system-emphasis)",
                containedHoverFocus: "var(--color-extended-blue-600)"
            },
            primary: {
                fill: "var(--dark-mode-content-default)",
                containedHoverFocus: "var(--dark-mode-content-emphasis)"
            },
            secondary: {
                fill: "var(--dark-mode-action-standard-background)",
                containedHoverFocus: "var(--dark-mode-shift-400)"
            },
            important: {
                fill: "var(--dark-mode-system-alert)",
                containedHoverFocus: "var(--color-extended-red-700)"
            },
            notice: {
                fill: "var(--dark-mode-system-warning)",
                containedHoverFocus: "var(--color-extended-yellow-300)"
            },
            active: {
                fill: "var(--dark-mode-system-success)",
                containedHoverFocus: "var(--color-extended-green-400)"
            }
        },
        Q = {
            standard: "var(--dark-mode-content-emphasis)",
            muted: "var(--dark-mode-content-default)",
            disabled: "var(--dark-mode-content-muted)",
            inverse: "var(--light-mode-content-emphasis)",
            action: "var(--dark-mode-content-link)",
            static: {
                light: "var(--light-mode-surface-0)",
                dark: "var(--dark-mode-surface-0)"
            },
            alert: {
                inform: "var(--dark-mode-system-emphasis)",
                important: "var(--dark-mode-system-alert)",
                active: "var(--dark-mode-system-success)",
                notice: "var(--dark-mode-system-warning)"
            }
        },
        Z = (0, o._)({
            mode: "dark",
            common: {
                black: "var(--dark-mode-surface-0)",
                white: "var(--light-mode-surface-0)"
            },
            actionV2: J,
            content: Q,
            states: {
                active: "var(--dark-mode-system-neutral)",
                disabled: "var(--color-extended-gray-600)",
                dragged: "var(--dark-mode-shift-100)",
                disabledBackground: "var(--dark-mode-state-hover)",
                focusVisible: "var(--dark-mode-shift-300)",
                focus: "var(--dark-mode-state-press)",
                selected: "var(--dark-mode-state-press)",
                hover: "var(--dark-mode-state-hover)"
            },
            surface: K,
            navigation: {
                global: "var(--dark-mode-common-navigation-bar)",
                default: "var(--dark-mode-common-navigation-bar)"
            },
            components: {
                divider: "var(--dark-mode-stroke-default)",
                input: {
                    filled: {
                        enableFill: "var(--dark-mode-surface-200)",
                        hoverFill: "var(--dark-mode-surface-300)"
                    },
                    outlined: {
                        enabledBorder: "var(--dark-mode-stroke-default)",
                        hoverBorder: "var(--dark-mode-content-default)",
                        focusBorder: "var(--dark-mode-content-default)",
                        errorBorder: "var(--dark-mode-system-alert)"
                    }
                },
                alert: {
                    importantContent: "var(--dark-mode-content-emphasis)",
                    importantFill: "rgba(223, 40, 31, 0.16)",
                    noticeContent: "var(--dark-mode-content-emphasis)",
                    noticeFill: "rgba(242, 186, 42, 0.16)",
                    informContent: "var(--dark-mode-content-emphasis)",
                    informFill: "rgba(51, 95, 255, 0.16)",
                    activeContent: "var(--dark-mode-content-emphasis)",
                    activeFill: "rgba(57, 197, 130, 0.16)"
                },
                backdrop: {
                    fill: "var(--dark-mode-common-scrim)"
                },
                button: {
                    disabled: "var(--dark-mode-content-muted)",
                    destructiveContainedContent: "var(--dark-mode-content-emphasis)"
                },
                label: {
                    warningText: "var(--dark-mode-system-warning)",
                    importantContent: k[300],
                    importantFill: k[1100],
                    noticeContent: B[300],
                    noticeFill: B[1100],
                    informContent: p[300],
                    informFill: p[1100],
                    activeContent: F[300],
                    activeFill: F[1100]
                },
                rating: {
                    enabledBorder: "var(--dark-mode-system-warning)",
                    activeFill: "var(--dark-mode-action-standard-foreground)"
                },
                stickyFooter: {
                    fill: "var(--dark-mode-common-scrim)"
                },
                media: {
                    fill: "var(--dark-mode-over-media-300)",
                    toolbar: "var(--dark-mode-common-navigation-bar)",
                    overlay: "var(--dark-mode-over-media-200)"
                },
                mediaButtons: {
                    onMediaLight: {
                        fill: "var(--dark-mode-common-shadow)",
                        hover: "var(--dark-mode-common-scrim)",
                        focus: "var(--dark-mode-common-scrim)"
                    },
                    onMediaDark: {
                        fill: "var(--dark-mode-over-media-0)",
                        hover: "var(--dark-mode-over-media-300)",
                        focus: "var(--dark-mode-over-media-300)"
                    },
                    outlined: {
                        enabledBorder: K.outline,
                        hoverBorder: "var(--dark-mode-stroke-emphasis)",
                        focusBorder: "var(--dark-mode-stroke-emphasis)",
                        errorBorder: "var(--dark-mode-system-alert)"
                    }
                },
                avatar: {
                    fill: "var(--dark-mode-shift-400)"
                },
                slider: {
                    trackInvertedBackground: "color-mix(in srgb, white 62%, var(--dark-mode-content-muted))",
                    trackInvertedBorder: "color-mix(in srgb, white 62%, var(--dark-mode-content-muted))"
                },
                switch: {
                    slideFill: "var(--light-mode-content-muted)",
                    knobFill: "var(--dark-mode-content-emphasis)",
                    disabledKnob: "var(--light-mode-content-muted)"
                },
                inlineCode: {
                    asText: {
                        fill: "var(--dark-mode-shift-400)",
                        color: Q.standard
                    },
                    asLink: {
                        fill: "var(--dark-mode-shift-400)",
                        color: "var(--dark-mode-content-link)"
                    }
                },
                linearProgress: {
                    backgroundSecondary: "var(--light-mode-content-muted)"
                },
                typography: {
                    errorContent: "var(--color-extended-red-700)",
                    infoContent: "var(--color-extended-blue-600)",
                    warningContent: J.notice.fill,
                    successContent: J.active.fill
                }
            }
        }, O),
        $ = {
            outline: "var(--light-mode-stroke-emphasis)",
            400: "var(--light-mode-shift-100)",
            300: "var(--light-mode-surface-300)",
            200: "var(--light-mode-surface-200)",
            100: "var(--light-mode-surface-100)",
            0: "var(--light-mode-surface-0)"
        },
        ee = {
            standard: "var(--light-mode-content-emphasis)",
            muted: "var(--light-mode-content-default)",
            disabled: "var(--light-mode-content-muted)",
            inverse: "var(--dark-mode-content-emphasis)",
            action: "var(--light-mode-content-link)",
            static: {
                light: "var(--light-mode-surface-0)",
                dark: "var(--dark-mode-surface-0)"
            },
            alert: {
                inform: "var(--light-mode-system-emphasis)",
                important: "var(--light-mode-system-alert)",
                active: "var(--light-mode-system-success)",
                notice: "var(--light-mode-system-warning)"
            }
        },
        er = (0, o._)({
            mode: "light",
            common: {
                black: "var(--dark-mode-surface-0)",
                white: "var(--light-mode-surface-0)"
            },
            actionV2: {
                primaryBrand: {
                    fill: "var(--light-mode-system-emphasis)",
                    containedHoverFocus: "var(--color-extended-blue-800)"
                },
                primary: {
                    fill: "var(--light-mode-content-default)",
                    containedHoverFocus: "var(--light-mode-content-emphasis)"
                },
                secondary: {
                    fill: "var(--light-mode-action-standard-background)",
                    containedHoverFocus: "var(--light-mode-shift-400)"
                },
                important: {
                    fill: "var(--light-mode-system-alert)",
                    containedHoverFocus: "var(--color-extended-red-900)"
                },
                notice: {
                    fill: "var(--light-mode-system-warning)",
                    containedHoverFocus: "var(--color-extended-yellow-500)"
                },
                active: {
                    fill: "var(--light-mode-system-success)",
                    containedHoverFocus: "var(--color-extended-green-600)"
                }
            },
            content: ee,
            states: {
                active: "var(--light-mode-system-neutral)",
                disabled: "var(--color-extended-gray-200)",
                dragged: "var(--light-mode-shift-100)",
                disabledBackground: "var(--light-mode-state-hover)",
                focusVisible: "var(--light-mode-shift-300)",
                focus: "var(--light-mode-state-press)",
                selected: "var(--light-mode-state-press)",
                hover: "var(--light-mode-state-hover)"
            },
            surface: $,
            navigation: {
                global: "var(--light-mode-common-navigation-bar)",
                default: "var(--light-mode-common-navigation-bar)"
            },
            components: {
                divider: "var(--light-mode-stroke-default)",
                input: {
                    filled: {
                        enableFill: "var(--light-mode-surface-200)",
                        hoverFill: "var(--light-mode-surface-300)"
                    },
                    outlined: {
                        enabledBorder: "var(--light-mode-stroke-default)",
                        hoverBorder: "var(--light-mode-content-default)",
                        focusBorder: "var(--light-mode-content-default)",
                        errorBorder: "var(--light-mode-system-alert)"
                    }
                },
                alert: {
                    importantContent: "var(--light-mode-content-emphasis)",
                    importantFill: "rgba(223, 40, 31, 0.16)",
                    noticeContent: "var(--light-mode-content-emphasis)",
                    noticeFill: "rgba(242, 186, 42, 0.16)",
                    informContent: "var(--light-mode-content-emphasis)",
                    informFill: "rgba(51, 95, 255, 0.16)",
                    activeContent: "var(--light-mode-content-emphasis)",
                    activeFill: "rgba(57, 197, 130, 0.16)"
                },
                backdrop: {
                    fill: "var(--light-mode-common-scrim)"
                },
                label: {
                    warningText: "var(--light-mode-extended-yellow-800)",
                    importantContent: k[1e3],
                    importantFill: k[100],
                    noticeContent: B[1e3],
                    noticeFill: B[100],
                    informContent: p[1e3],
                    informFill: p[100],
                    activeContent: F[1e3],
                    activeFill: F[100]
                },
                button: {
                    disabled: "var(--light-mode-content-muted)",
                    destructiveContainedContent: "var(--dark-mode-content-emphasis)"
                },
                rating: {
                    enabledBorder: "var(--light-mode-system-warning)",
                    activeFill: "var(--light-mode-action-standard-foreground)"
                },
                stickyFooter: {
                    fill: "var(--light-mode-common-scrim)"
                },
                media: {
                    fill: "var(--light-mode-over-media-300)",
                    toolbar: "var(--light-mode-common-navigation-bar)",
                    overlay: "var(--dark-mode-over-media-200)"
                },
                mediaButtons: {
                    onMediaLight: {
                        fill: "var(--dark-mode-common-shadow)",
                        hover: "var(--dark-mode-common-scrim)",
                        focus: "var(--dark-mode-common-scrim)"
                    },
                    onMediaDark: {
                        fill: "var(--light-mode-over-media-0)",
                        hover: "var(--light-mode-over-media-300)",
                        focus: "var(--light-mode-over-media-300)"
                    },
                    outlined: {
                        enabledBorder: $.outline,
                        hoverBorder: "var(--light-mode-stroke-emphasis)",
                        focusBorder: "var(--light-mode-stroke-emphasis)",
                        errorBorder: "var(--light-mode-system-alert)"
                    }
                },
                avatar: {
                    fill: "var(--light-mode-shift-400)"
                },
                slider: {
                    trackInvertedBackground: "color-mix(in srgb, white 62%, var(--light-mode-content-muted))",
                    trackInvertedBorder: "color-mix(in srgb, white 62%, var(--light-mode-content-muted))"
                },
                switch: {
                    slideFill: "var(--dark-mode-content-muted)",
                    knobFill: "var(--light-mode-content-emphasis)",
                    disabledKnob: "var(--dark-mode-content-muted)"
                },
                inlineCode: {
                    asText: {
                        fill: "var(--light-mode-shift-400)",
                        color: ee.standard
                    },
                    asLink: {
                        fill: "var(--light-mode-shift-400)",
                        color: "var(--light-mode-content-link)"
                    }
                },
                linearProgress: {
                    backgroundSecondary: "var(--dark-mode-content-muted)"
                },
                typography: {
                    errorContent: ee.alert.important,
                    infoContent: "var(--color-extended-blue-800)",
                    warningContent: "var(--color-extended-yellow-800)",
                    successContent: "var(--color-extended-green-800)"
                }
            }
        }, x),
        eo = {
            outlined: "0px 0px 0px 1px rgba(255, 255, 255, 0.10)",
            subtle: "0px 1px 4px 0px rgba(0, 0, 0, 0.12), 0px 1px 1px 0px rgba(0, 0, 0, 0.12)",
            overlay: "0px 6px 20px 0px rgba(0, 0, 0, 0.08), 0px 4px 16px 0px rgba(0, 0, 0, 0.04)"
        },
        ea = {
            outlined: "0px 0px 0px 1px rgba(187, 194, 209, 0.12)",
            subtle: "0px 1px 4px 0px rgba(0, 0, 0, 0.24), 0px 1px 1px 0px rgba(0, 0, 0, 0.16)",
            overlay: "0px 6px 20px 0px rgba(0, 0, 0, 0.16), 0px 4px 16px 0px rgba(0, 0, 0, 0.12)"
        },
        et = e.i(169336),
        en = e.i(319114),
        ei = e.i(311591),
        eg = function(e, r) {
            var t, i, g, s;
            return {
                typography: a.default,
                palette: e,
                shadows: n,
                elevation: r,
                border: d,
                breakpoints: {
                    values: {
                        xs: 0,
                        sm: 601,
                        md: 1141,
                        lg: 1521,
                        xl: 1921,
                        XSmall: 0,
                        Small: 361,
                        Medium: 601,
                        Large: 1141,
                        XLarge: 1521,
                        XXLarge: 1921
                    }
                },
                components: {
                    MuiSvgIcon: {
                        variants: [{
                            props: {
                                fontSize: "large"
                            },
                            style: {
                                fontSize: 24
                            }
                        }, {
                            props: {
                                fontSize: "medium"
                            },
                            style: {
                                fontSize: 20
                            }
                        }, {
                            props: {
                                fontSize: "small"
                            },
                            style: {
                                fontSize: 16
                            }
                        }]
                    },
                    MuiCssBaseline: {
                        styleOverrides: b(a.fontFaces.reduce(function(e, r) {
                            return "".concat(e, "@font-face {\n    ").concat(Object.keys(r).map(function(e) {
                                return "".concat(l(e), ": ").concat(r[e], ";")
                            }).join("\n"), "\n}\n")
                        }, ""), (s = a.default.body2, "body {\n  ".concat(Object.keys(s).map(function(e) {
                            return "".concat(l(e), ": ").concat(s[e], ";")
                        }).join("\n"), "\n}\n")))
                    },
                    MuiMenuItem: {
                        styleOverrides: {
                            root: ((t = {})["&.".concat(en.m.selected)] = ((i = {
                                backgroundColor: e.action.selected
                            })["&.".concat(en.m.focusVisible)] = {
                                backgroundColor: e.action.selected
                            }, i["&:hover"] = {
                                backgroundColor: e.action.selected
                            }, i), t)
                        }
                    },
                    MuiPopper: {
                        defaultProps: {
                            sx: (0, o._)({}, d.radius.large)
                        }
                    },
                    MuiPaper: {
                        styleOverrides: {
                            root: ((g = {
                                "&.MuiPickersPopper-paper": (0, o._)({}, d.radius.large)
                            })["&.".concat(ei.p.elevation)] = {
                                backgroundImage: "none"
                            }, g)
                        }
                    }
                }
            }
        },
        ed = (0, et.f)(eg(I, ea)),
        el = (0, et.f)(eg(V, eo)),
        eb = (0, et.f)(eg(Z, ea)),
        es = (0, et.f)(eg(er, eo)),
        ec = {},
        eu = e.i(894556),
        eS = e.i(477763),
        em = e.i(221628),
        e_ = e.i(442632),
        eh = e.i(492495),
        ek = e.i(708139),
        eB = e.i(704316),
        eF = e.i(91375),
        ep = e.i(127633),
        eC = e.i(756684);
    e.i(41392);
    var ev = e.i(141121);
    let ef = r.createContext(null);

    function eL() {
        return r.useContext(ef)
    }
    var ey = "function" == typeof Symbol && Symbol.for ? Symbol.for("mui.nested") : "__THEME_NESTED__";

    function eT(e) {
        let {
            children: o,
            theme: a
        } = e, t = eL(), n = r.useMemo(() => {
            let e = null === t ? a : "function" == typeof a ? a(t) : (0, eS._)({}, t, a);
            return null != e && (e[ey] = null !== t), e
        }, [a, t]);
        return (0, em.jsx)(ef.Provider, {
            value: n,
            children: o
        })
    }
    let ez = {};

    function eD(e, o, a) {
        let t = arguments.length > 3 && void 0 !== arguments[3] && arguments[3];
        return r.useMemo(() => {
            let r = e && o[e] || o;
            if ("function" == typeof a) {
                let n = a(r),
                    i = e ? (0, eS._)({}, o, {
                        [e]: n
                    }) : n;
                return t ? () => i : i
            }
            return (0, eS._)({}, o, e ? {
                [e]: a
            } : a)
        }, [e, o, a, t])
    }

    function eM(e) {
        let {
            children: r,
            theme: o,
            themeId: a
        } = e, t = (0, eB.u)(ez), n = eL() || ez, i = eD(a, t, o), g = eD(a, n, o, !0), d = "rtl" === i.direction, l = function(e) {
            let r = (0, eB.u)(),
                o = (0, ep.u)() || "",
                {
                    modularCssLayers: a
                } = e,
                t = "mui.global, mui.components, mui.theme, mui.custom, mui.sx";
            return t = a && null === r ? "string" == typeof a ? a.replace(/mui(?!\.)/g, t) : "@layer ".concat(t, ";") : "", (0, eC.u)(() => {
                var e, r;
                let a = document.querySelector("head");
                if (!a) return;
                let n = a.firstChild;
                if (t) {
                    if (n && null != (e = n.hasAttribute) && e.call(n, "data-mui-layer-order") && n.getAttribute("data-mui-layer-order") === o) return;
                    let r = document.createElement("style");
                    r.setAttribute("data-mui-layer-order", o), r.textContent = t, a.prepend(r)
                } else null == (r = a.querySelector('style[data-mui-layer-order="'.concat(o, '"]'))) || r.remove()
            }, [t, o]), t ? (0, em.jsx)(eh.a, {
                styles: t
            }) : null
        }(i);
        return (0, em.jsx)(eT, {
            theme: g,
            children: (0, em.jsx)(ev.ThemeContext.Provider, {
                value: i,
                children: (0, em.jsx)(eF.R, {
                    value: d,
                    children: (0, em.jsxs)(e_.D, {
                        value: null == i ? void 0 : i.components,
                        children: [l, r]
                    })
                })
            })
        })
    }
    let eH = ["theme"];

    function eW(e) {
        let {
            theme: r
        } = e, o = (0, et._)(e, eH), a = r[ek.T], t = a || r;
        return "function" != typeof r && (a && !a.vars ? t = (0, eS._)({}, a, {
            vars: null
        }) : r && !r.vars && (t = (0, eS._)({}, r, {
            vars: null
        }))), (0, em.jsx)(eM, (0, eS._)({}, o, {
            themeId: a ? ek.T : void 0,
            theme: t
        }))
    }
    let eO = function(e) {
        var r;
        let o = arguments.length > 1 && void 0 !== arguments[1] && arguments[1],
            a = {};
        o && e.colorSchemes && Object.entries(e.colorSchemes).forEach(r => {
            var o;
            let [t, n] = r;
            a[e.getColorSchemeSelector(t).replace(/\s*&/, "")] = {
                colorScheme: null == (o = n.palette) ? void 0 : o.mode
            }
        });
        let t = (0, eS._)({
                html: (0, eS._)({
                    WebkitFontSmoothing: "antialiased",
                    MozOsxFontSmoothing: "grayscale",
                    boxSizing: "border-box",
                    WebkitTextSizeAdjust: "100%"
                }, o && !e.vars && {
                    colorScheme: e.palette.mode
                }),
                "*, *::before, *::after": {
                    boxSizing: "inherit"
                },
                "strong, b": {
                    fontWeight: e.typography.fontWeightBold
                },
                body: (0, eS._)({
                    margin: 0
                }, (0, eS._)({
                    color: (e.vars || e).palette.text.primary
                }, e.typography.body1, {
                    backgroundColor: (e.vars || e).palette.background.default,
                    "@media print": {
                        backgroundColor: (e.vars || e).palette.common.white
                    }
                }), {
                    "&::backdrop": {
                        backgroundColor: (e.vars || e).palette.background.default
                    }
                })
            }, a),
            n = null == (r = e.components) || null == (r = r.MuiCssBaseline) ? void 0 : r.styleOverrides;
        return n && (t = [t, n]), t
    };

    function ex(e) {
        let {
            children: o,
            enableColorScheme: a = !1
        } = (0, e_.u)({
            props: e,
            name: "MuiCssBaseline"
        });
        return (0, em.jsxs)(r.Fragment, {
            children: [(0, em.jsx)(eh.G, {
                styles: e => eO(e, a)
            }), o]
        })
    }
    e.s(["UIThemeProvider", 0, function(e) {
        var o, a = e.theme,
            t = void 0 === a ? "dark" : a,
            n = e.cssBaselineMode,
            i = e.children;
        switch (t) {
            case "dark":
                o = ed;
                break;
            case "light":
                o = el;
                break;
            case "foundation-dark":
                o = eb;
                break;
            case "foundation-light":
                o = es;
                break;
            default:
                o = ec[t] || ed
        }
        var g = null;
        switch (void 0 === n ? "enabled" : n) {
            case "enabled":
                g = r.default.createElement(ex, {
                    enableColorScheme: !0
                });
                break;
            case "client-only":
                g = r.default.createElement(eu.N, null, r.default.createElement(ex, {
                    enableColorScheme: !0
                }))
        }
        return r.default.createElement(eW, {
            theme: o
        }, g, i)
    }], 578717)
}]);

//# debugId=0b7e1919-aa52-1351-480c-64269391fd5d
//# sourceMappingURL=3fxmpvavi8z3g.js.map