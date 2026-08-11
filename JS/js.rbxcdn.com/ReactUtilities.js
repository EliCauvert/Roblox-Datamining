! function() {
    try {
        var r = "undefined" != typeof window ? window : "undefined" != typeof global ? global : "undefined" != typeof globalThis ? globalThis : "undefined" != typeof self ? self : {};
        r.SENTRY_RELEASE = {
            id: "0f9f891a11e52d8edbdcb725ed481f29162419f8"
        };
        var e = (new r.Error).stack;
        e && (r._sentryDebugIds = r._sentryDebugIds || {}, r._sentryDebugIds[e] = "c4cff876-1d99-4bcb-8418-7a9acf132d15", r._sentryDebugIdIdentifier = "sentry-dbid-c4cff876-1d99-4bcb-8418-7a9acf132d15")
    } catch (r) {}
}(),
function() {
    var r = {
            339: function(r, e, t) {
                "use strict";
                var n = this && this.__createBinding || (Object.create ? function(r, e, t, n) {
                        void 0 === n && (n = t), Object.defineProperty(r, n, {
                            enumerable: !0,
                            get: function() {
                                return e[t]
                            }
                        })
                    } : function(r, e, t, n) {
                        void 0 === n && (n = t), r[n] = e[t]
                    }),
                    o = this && this.__exportStar || function(r, e) {
                        for (var t in r) "default" === t || Object.prototype.hasOwnProperty.call(e, t) || n(e, r, t)
                    };
                Object.defineProperty(e, "__esModule", {
                    value: !0
                }), o(t(925), e), o(t(725), e), o(t(11), e), o(t(211), e)
            },
            925: function(r, e) {
                "use strict";
                Object.defineProperty(e, "__esModule", {
                    value: !0
                }), e.FoundationDark = void 0, e.FoundationDark = {
                    Color: {
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
                            }
                        },
                        None: "rgba(0, 0, 0, 0)",
                        Surface: {
                            Surface_0: "rgb(18, 18, 21)",
                            Surface_100: "rgb(25, 26, 31)",
                            Surface_200: "rgb(32, 34, 39)",
                            Surface_300: "rgb(39, 41, 48)"
                        },
                        OverMedia: {
                            OverMedia_0: "rgba(18, 18, 21, 0.92)",
                            OverMedia_100: "rgba(25, 26, 31, 0.92)",
                            OverMedia_200: "rgba(32, 34, 39, 0.92)",
                            OverMedia_300: "rgba(39, 41, 48, 0.92)"
                        },
                        Shift: {
                            Shift_100: "rgba(208, 217, 251, 0.04)",
                            Shift_200: "rgba(208, 217, 251, 0.08)",
                            Shift_300: "rgba(208, 217, 251, 0.12)",
                            Shift_400: "rgba(208, 217, 251, 0.16)"
                        },
                        Content: {
                            Emphasis: "rgb(247, 247, 248)",
                            Default: "rgb(213, 215, 221)",
                            Muted: "rgb(188, 190, 200)",
                            Link: "rgb(82, 139, 255)"
                        },
                        Stroke: {
                            Emphasis: "rgba(208, 217, 251, 0.16)",
                            Default: "rgba(208, 217, 251, 0.12)",
                            Muted: "rgba(208, 217, 251, 0.08)"
                        },
                        System: {
                            Contrast: "rgb(247, 247, 248)",
                            Neutral: "rgb(188, 190, 200)",
                            Emphasis: "rgb(51, 95, 255)",
                            Success: "rgb(57, 197, 130)",
                            Warning: "rgb(242, 186, 42)",
                            Alert: "rgb(223, 40, 31)"
                        },
                        Common: {
                            Shimmer: "rgba(208, 217, 251, 0.12)",
                            Scrim: "rgba(10, 10, 14, 0.75)",
                            Backdrop: "rgba(10, 10, 14, 0.75)",
                            Shadow: "rgba(0, 0, 0, 0.5)",
                            NavigationBar: "rgb(18, 18, 21)",
                            HeavyDivider: "rgba(0, 0, 0, 0.5)"
                        },
                        Selection: {
                            Start: "rgb(255, 255, 255)",
                            End: "rgb(255, 255, 255)"
                        },
                        State: {
                            Idle: "rgba(255, 255, 255, 0)",
                            Hover: "rgba(208, 217, 251, 0.08)",
                            Press: "rgba(208, 217, 251, 0.12)"
                        },
                        ActionEmphasis: {
                            Background: "rgb(51, 95, 255)",
                            Foreground: "rgb(247, 247, 248)",
                            Border: "rgba(0, 0, 0, 0)"
                        },
                        ActionSoftEmphasis: {
                            Background: "rgba(51, 95, 255, 0.4)",
                            Foreground: "rgb(235, 241, 255)",
                            Border: "rgba(0, 0, 0, 0)"
                        },
                        ActionSubEmphasis: {
                            Background: "rgb(247, 247, 248)",
                            Foreground: "rgb(32, 34, 39)",
                            Border: "rgba(0, 0, 0, 0)"
                        },
                        ActionOverMedia: {
                            Background: "rgb(247, 247, 248)",
                            Foreground: "rgb(32, 34, 39)",
                            Border: "rgba(0, 0, 0, 0)"
                        },
                        ActionStandard: {
                            Background: "rgba(208, 217, 251, 0.12)",
                            Foreground: "rgb(247, 247, 248)",
                            Border: "rgba(0, 0, 0, 0)"
                        },
                        ActionSubtle: {
                            Background: "rgba(0, 0, 0, 0)",
                            Foreground: "rgb(247, 247, 248)",
                            Border: "rgb(213, 215, 221)"
                        },
                        ActionLink: {
                            Background: "rgba(0, 0, 0, 0)",
                            Foreground: "rgb(247, 247, 248)",
                            Border: "rgba(0, 0, 0, 0)"
                        },
                        ActionUtility: {
                            Background: "rgba(0, 0, 0, 0)",
                            Foreground: "rgb(247, 247, 248)",
                            Border: "rgba(0, 0, 0, 0)"
                        },
                        ActionAlert: {
                            Background: "rgba(208, 217, 251, 0.12)",
                            Foreground: "rgb(240, 68, 51)",
                            Border: "rgba(0, 0, 0, 0)"
                        }
                    },
                    Config: {
                        Theme: {
                            Name: "Foundation",
                            IsFoundation: "true",
                            IsUIBlox: "false"
                        },
                        ColorMode: {
                            Name: "Dark",
                            IsDark: "true",
                            IsLight: "false"
                        },
                        UI: {
                            Interval: 4,
                            Scale: 1,
                            StrokeBase: 1
                        },
                        Text: {
                            Interval: 4,
                            Scale: 1,
                            Font: '"Builder Sans"',
                            NominalScale: 1,
                            InverseScale: 1
                        }
                    },
                    DarkMode: {
                        None: "rgba(0, 0, 0, 0)",
                        Surface: {
                            Surface_0: "rgb(18, 18, 21)",
                            Surface_100: "rgb(25, 26, 31)",
                            Surface_200: "rgb(32, 34, 39)",
                            Surface_300: "rgb(39, 41, 48)"
                        },
                        OverMedia: {
                            OverMedia_0: "rgba(18, 18, 21, 0.92)",
                            OverMedia_100: "rgba(25, 26, 31, 0.92)",
                            OverMedia_200: "rgba(32, 34, 39, 0.92)",
                            OverMedia_300: "rgba(39, 41, 48, 0.92)"
                        },
                        Shift: {
                            Shift_100: "rgba(208, 217, 251, 0.04)",
                            Shift_200: "rgba(208, 217, 251, 0.08)",
                            Shift_300: "rgba(208, 217, 251, 0.12)",
                            Shift_400: "rgba(208, 217, 251, 0.16)"
                        },
                        Content: {
                            Emphasis: "rgb(247, 247, 248)",
                            Default: "rgb(213, 215, 221)",
                            Muted: "rgb(188, 190, 200)",
                            Link: "rgb(82, 139, 255)"
                        },
                        Stroke: {
                            Emphasis: "rgba(208, 217, 251, 0.16)",
                            Default: "rgba(208, 217, 251, 0.12)",
                            Muted: "rgba(208, 217, 251, 0.08)"
                        },
                        System: {
                            Contrast: "rgb(247, 247, 248)",
                            Neutral: "rgb(188, 190, 200)",
                            Emphasis: "rgb(51, 95, 255)",
                            Success: "rgb(57, 197, 130)",
                            Warning: "rgb(242, 186, 42)",
                            Alert: "rgb(223, 40, 31)"
                        },
                        Common: {
                            Shimmer: "rgba(208, 217, 251, 0.12)",
                            Scrim: "rgba(10, 10, 14, 0.75)",
                            Backdrop: "rgba(10, 10, 14, 0.75)",
                            Shadow: "rgba(0, 0, 0, 0.5)",
                            NavigationBar: "rgb(18, 18, 21)",
                            HeavyDivider: "rgba(0, 0, 0, 0.5)"
                        },
                        Selection: {
                            Start: "rgb(255, 255, 255)",
                            End: "rgb(255, 255, 255)"
                        },
                        State: {
                            Idle: "rgba(255, 255, 255, 0)",
                            Hover: "rgba(208, 217, 251, 0.08)",
                            Press: "rgba(208, 217, 251, 0.12)"
                        },
                        ActionEmphasis: {
                            Background: "rgb(51, 95, 255)",
                            Foreground: "rgb(247, 247, 248)",
                            Border: "rgba(0, 0, 0, 0)"
                        },
                        ActionSoftEmphasis: {
                            Background: "rgba(51, 95, 255, 0.4)",
                            Foreground: "rgb(235, 241, 255)",
                            Border: "rgba(0, 0, 0, 0)"
                        },
                        ActionSubEmphasis: {
                            Background: "rgb(247, 247, 248)",
                            Foreground: "rgb(32, 34, 39)",
                            Border: "rgba(0, 0, 0, 0)"
                        },
                        ActionOverMedia: {
                            Background: "rgb(247, 247, 248)",
                            Foreground: "rgb(32, 34, 39)",
                            Border: "rgba(0, 0, 0, 0)"
                        },
                        ActionStandard: {
                            Background: "rgba(208, 217, 251, 0.12)",
                            Foreground: "rgb(247, 247, 248)",
                            Border: "rgba(0, 0, 0, 0)"
                        },
                        ActionSubtle: {
                            Background: "rgba(0, 0, 0, 0)",
                            Foreground: "rgb(247, 247, 248)",
                            Border: "rgb(213, 215, 221)"
                        },
                        ActionLink: {
                            Background: "rgba(0, 0, 0, 0)",
                            Foreground: "rgb(247, 247, 248)",
                            Border: "rgba(0, 0, 0, 0)"
                        },
                        ActionUtility: {
                            Background: "rgba(0, 0, 0, 0)",
                            Foreground: "rgb(247, 247, 248)",
                            Border: "rgba(0, 0, 0, 0)"
                        },
                        ActionAlert: {
                            Background: "rgba(208, 217, 251, 0.12)",
                            Foreground: "rgb(240, 68, 51)",
                            Border: "rgba(0, 0, 0, 0)"
                        }
                    },
                    LightMode: {
                        None: "rgba(0, 0, 0, 0)",
                        Surface: {
                            Surface_0: "rgb(255, 255, 255)",
                            Surface_100: "rgb(247, 247, 248)",
                            Surface_200: "rgb(255, 255, 255)",
                            Surface_300: "rgb(247, 247, 248)"
                        },
                        OverMedia: {
                            OverMedia_0: "rgba(255, 255, 255, 0.92)",
                            OverMedia_100: "rgba(247, 247, 248, 0.92)",
                            OverMedia_200: "rgba(255, 255, 255, 0.92)",
                            OverMedia_300: "rgba(247, 247, 248, 0.92)"
                        },
                        Shift: {
                            Shift_100: "rgba(27, 37, 75, 0.04)",
                            Shift_200: "rgba(27, 37, 75, 0.08)",
                            Shift_300: "rgba(27, 37, 75, 0.12)",
                            Shift_400: "rgba(27, 37, 75, 0.16)"
                        },
                        Content: {
                            Emphasis: "rgb(32, 34, 39)",
                            Default: "rgb(73, 77, 90)",
                            Muted: "rgb(106, 111, 129)",
                            Link: "rgb(20, 70, 255)"
                        },
                        Stroke: {
                            Emphasis: "rgba(27, 37, 75, 0.16)",
                            Default: "rgba(27, 37, 75, 0.12)",
                            Muted: "rgba(27, 37, 75, 0.08)"
                        },
                        System: {
                            Contrast: "rgb(32, 34, 39)",
                            Neutral: "rgb(73, 77, 90)",
                            Emphasis: "rgb(51, 95, 255)",
                            Success: "rgb(57, 197, 130)",
                            Warning: "rgb(242, 186, 42)",
                            Alert: "rgb(223, 40, 31)"
                        },
                        Common: {
                            Shimmer: "rgba(27, 37, 75, 0.12)",
                            Scrim: "rgba(10, 10, 14, 0.5)",
                            Backdrop: "rgba(10, 10, 14, 0.5)",
                            Shadow: "rgba(0, 0, 0, 0.5)",
                            NavigationBar: "rgb(255, 255, 255)",
                            HeavyDivider: "rgba(27, 37, 75, 0.04)"
                        },
                        Selection: {
                            Start: "rgb(51, 95, 255)",
                            End: "rgb(51, 95, 255)"
                        },
                        State: {
                            Idle: "rgba(0, 0, 0, 0)",
                            Hover: "rgba(27, 37, 75, 0.08)",
                            Press: "rgba(27, 37, 75, 0.12)"
                        },
                        ActionEmphasis: {
                            Background: "rgb(51, 95, 255)",
                            Foreground: "rgb(247, 247, 248)",
                            Border: "rgba(0, 0, 0, 0)"
                        },
                        ActionSoftEmphasis: {
                            Background: "rgba(51, 95, 255, 0.3)",
                            Foreground: "rgb(0, 20, 92)",
                            Border: "rgba(0, 0, 0, 0)"
                        },
                        ActionSubEmphasis: {
                            Background: "rgb(32, 34, 39)",
                            Foreground: "rgb(247, 247, 248)",
                            Border: "rgba(0, 0, 0, 0)"
                        },
                        ActionOverMedia: {
                            Background: "rgb(32, 34, 39)",
                            Foreground: "rgb(247, 247, 248)",
                            Border: "rgba(0, 0, 0, 0)"
                        },
                        ActionStandard: {
                            Background: "rgba(27, 37, 75, 0.12)",
                            Foreground: "rgb(32, 34, 39)",
                            Border: "rgba(0, 0, 0, 0)"
                        },
                        ActionSubtle: {
                            Background: "rgba(0, 0, 0, 0)",
                            Foreground: "rgb(32, 34, 39)",
                            Border: "rgb(73, 77, 90)"
                        },
                        ActionLink: {
                            Background: "rgba(0, 0, 0, 0)",
                            Foreground: "rgb(32, 34, 39)",
                            Border: "rgba(0, 0, 0, 0)"
                        },
                        ActionUtility: {
                            Background: "rgba(0, 0, 0, 0)",
                            Foreground: "rgb(32, 34, 39)",
                            Border: "rgba(0, 0, 0, 0)"
                        },
                        ActionAlert: {
                            Background: "rgba(27, 37, 75, 0.12)",
                            Foreground: "rgb(217, 28, 21)",
                            Border: "rgba(0, 0, 0, 0)"
                        }
                    },
                    Inverse: {
                        None: "rgba(0, 0, 0, 0)",
                        Surface: {
                            Surface_0: "rgb(255, 255, 255)",
                            Surface_100: "rgb(247, 247, 248)",
                            Surface_200: "rgb(255, 255, 255)",
                            Surface_300: "rgb(247, 247, 248)"
                        },
                        OverMedia: {
                            OverMedia_0: "rgba(255, 255, 255, 0.92)",
                            OverMedia_100: "rgba(247, 247, 248, 0.92)",
                            OverMedia_200: "rgba(255, 255, 255, 0.92)",
                            OverMedia_300: "rgba(247, 247, 248, 0.92)"
                        },
                        Shift: {
                            Shift_100: "rgba(27, 37, 75, 0.04)",
                            Shift_200: "rgba(27, 37, 75, 0.08)",
                            Shift_300: "rgba(27, 37, 75, 0.12)",
                            Shift_400: "rgba(27, 37, 75, 0.16)"
                        },
                        Content: {
                            Emphasis: "rgb(32, 34, 39)",
                            Default: "rgb(73, 77, 90)",
                            Muted: "rgb(106, 111, 129)",
                            Link: "rgb(20, 70, 255)"
                        },
                        Stroke: {
                            Emphasis: "rgba(27, 37, 75, 0.16)",
                            Default: "rgba(27, 37, 75, 0.12)",
                            Muted: "rgba(27, 37, 75, 0.08)"
                        },
                        System: {
                            Contrast: "rgb(32, 34, 39)",
                            Neutral: "rgb(73, 77, 90)",
                            Emphasis: "rgb(51, 95, 255)",
                            Success: "rgb(57, 197, 130)",
                            Warning: "rgb(242, 186, 42)",
                            Alert: "rgb(223, 40, 31)"
                        },
                        Common: {
                            Shimmer: "rgba(27, 37, 75, 0.12)",
                            Scrim: "rgba(10, 10, 14, 0.5)",
                            Backdrop: "rgba(10, 10, 14, 0.5)",
                            Shadow: "rgba(0, 0, 0, 0.5)",
                            NavigationBar: "rgb(255, 255, 255)",
                            HeavyDivider: "rgba(27, 37, 75, 0.04)"
                        },
                        Selection: {
                            Start: "rgb(51, 95, 255)",
                            End: "rgb(51, 95, 255)"
                        },
                        State: {
                            Idle: "rgba(0, 0, 0, 0)",
                            Hover: "rgba(27, 37, 75, 0.08)",
                            Press: "rgba(27, 37, 75, 0.12)"
                        },
                        ActionEmphasis: {
                            Background: "rgb(51, 95, 255)",
                            Foreground: "rgb(247, 247, 248)",
                            Border: "rgba(0, 0, 0, 0)"
                        },
                        ActionSoftEmphasis: {
                            Background: "rgba(51, 95, 255, 0.3)",
                            Foreground: "rgb(0, 20, 92)",
                            Border: "rgba(0, 0, 0, 0)"
                        },
                        ActionSubEmphasis: {
                            Background: "rgb(32, 34, 39)",
                            Foreground: "rgb(247, 247, 248)",
                            Border: "rgba(0, 0, 0, 0)"
                        },
                        ActionOverMedia: {
                            Background: "rgb(32, 34, 39)",
                            Foreground: "rgb(247, 247, 248)",
                            Border: "rgba(0, 0, 0, 0)"
                        },
                        ActionStandard: {
                            Background: "rgba(27, 37, 75, 0.12)",
                            Foreground: "rgb(32, 34, 39)",
                            Border: "rgba(0, 0, 0, 0)"
                        },
                        ActionSubtle: {
                            Background: "rgba(0, 0, 0, 0)",
                            Foreground: "rgb(32, 34, 39)",
                            Border: "rgb(73, 77, 90)"
                        },
                        ActionLink: {
                            Background: "rgba(0, 0, 0, 0)",
                            Foreground: "rgb(32, 34, 39)",
                            Border: "rgba(0, 0, 0, 0)"
                        },
                        ActionUtility: {
                            Background: "rgba(0, 0, 0, 0)",
                            Foreground: "rgb(32, 34, 39)",
                            Border: "rgba(0, 0, 0, 0)"
                        },
                        ActionAlert: {
                            Background: "rgba(27, 37, 75, 0.12)",
                            Foreground: "rgb(217, 28, 21)",
                            Border: "rgba(0, 0, 0, 0)"
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
                    Padding: {
                        None: 0,
                        XXSmall: 2,
                        XSmall: 4,
                        Small: 8,
                        Medium: 12,
                        Large: 16,
                        XLarge: 20,
                        XXLarge: 24
                    },
                    Margin: {
                        None: 0,
                        Small: 20,
                        Medium: 24,
                        Large: 48
                    },
                    Gap: {
                        None: 0,
                        XXSmall: 2,
                        XSmall: 4,
                        Small: 8,
                        Medium: 12,
                        Large: 16,
                        XLarge: 20,
                        XXLarge: 24
                    },
                    Gutter: {
                        None: 0,
                        Small: 8,
                        Medium: 12,
                        Large: 16,
                        XLarge: 20,
                        XXLarge: 24
                    },
                    Radius: {
                        None: 0,
                        XSmall: 2,
                        Small: 4,
                        Medium: 8,
                        Large: 16,
                        Circle: 9999
                    },
                    Stroke: {
                        None: 0,
                        Thin: .5,
                        Standard: 1,
                        Thick: 1.5,
                        Thicker: 3
                    },
                    InputSize: {
                        XSmall: 24,
                        Small: 32,
                        Medium: 40,
                        Large: 48
                    },
                    IconSize: {
                        XSmall: 12,
                        Small: 16,
                        Medium: 20,
                        Large: 24,
                        XLarge: 28
                    },
                    ToggleSize: {
                        XSmall: 16,
                        Small: 20,
                        Medium: 24,
                        Large: 28
                    },
                    LineHeight: {
                        LineHeight_100: 1,
                        LineHeight_120: 1.2,
                        LineHeight_130: 1.3,
                        LineHeight_140: 1.4
                    },
                    LetterSpacing: {
                        Tight: -.01,
                        Default: 0,
                        Loose: .01
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
                    Typography: {
                        DisplayLarge: {
                            Font: '700 80/1.2 "Builder Sans"',
                            LetterSpacing: -.01,
                            FontFamily: '"Builder Sans"',
                            FontWeight: "700",
                            FontSize: 80,
                            LineHeight: 1.2
                        },
                        DisplayMedium: {
                            Font: '700 56/1.2 "Builder Sans"',
                            LetterSpacing: -.01,
                            FontFamily: '"Builder Sans"',
                            FontWeight: "700",
                            FontSize: 56,
                            LineHeight: 1.2
                        },
                        DisplaySmall: {
                            Font: '700 40/1.2 "Builder Sans"',
                            LetterSpacing: -.01,
                            FontFamily: '"Builder Sans"',
                            FontWeight: "700",
                            FontSize: 40,
                            LineHeight: 1.2
                        },
                        HeadingLarge: {
                            Font: '700 28/1.2 "Builder Sans"',
                            LetterSpacing: -.01,
                            FontFamily: '"Builder Sans"',
                            FontWeight: "700",
                            FontSize: 28,
                            LineHeight: 1.2
                        },
                        HeadingMedium: {
                            Font: '700 24/1.2 "Builder Sans"',
                            LetterSpacing: -.01,
                            FontFamily: '"Builder Sans"',
                            FontWeight: "700",
                            FontSize: 24,
                            LineHeight: 1.2
                        },
                        HeadingSmall: {
                            Font: '700 20/1.2 "Builder Sans"',
                            LetterSpacing: -.01,
                            FontFamily: '"Builder Sans"',
                            FontWeight: "700",
                            FontSize: 20,
                            LineHeight: 1.2
                        },
                        TitleLarge: {
                            Font: '700 16/1.4 "Builder Sans"',
                            LetterSpacing: 0,
                            FontFamily: '"Builder Sans"',
                            FontWeight: "700",
                            FontSize: 16,
                            LineHeight: 1.4
                        },
                        TitleMedium: {
                            Font: '700 14/1.4 "Builder Sans"',
                            LetterSpacing: 0,
                            FontFamily: '"Builder Sans"',
                            FontWeight: "700",
                            FontSize: 14,
                            LineHeight: 1.4
                        },
                        TitleSmall: {
                            Font: '700 12/1.4 "Builder Sans"',
                            LetterSpacing: 0,
                            FontFamily: '"Builder Sans"',
                            FontWeight: "700",
                            FontSize: 12,
                            LineHeight: 1.4
                        },
                        LabelLarge: {
                            Font: '600 16/1 "Builder Sans"',
                            LetterSpacing: 0,
                            FontFamily: '"Builder Sans"',
                            FontWeight: "600",
                            FontSize: 16,
                            LineHeight: 1
                        },
                        LabelMedium: {
                            Font: '600 14/1 "Builder Sans"',
                            LetterSpacing: 0,
                            FontFamily: '"Builder Sans"',
                            FontWeight: "600",
                            FontSize: 14,
                            LineHeight: 1
                        },
                        LabelSmall: {
                            Font: '600 12/1 "Builder Sans"',
                            LetterSpacing: 0,
                            FontFamily: '"Builder Sans"',
                            FontWeight: "600",
                            FontSize: 12,
                            LineHeight: 1
                        },
                        BodyLarge: {
                            Font: '400 16/1.4 "Builder Sans"',
                            LetterSpacing: 0,
                            FontFamily: '"Builder Sans"',
                            FontWeight: "400",
                            FontSize: 16,
                            LineHeight: 1.4
                        },
                        BodyMedium: {
                            Font: '400 14/1.4 "Builder Sans"',
                            LetterSpacing: 0,
                            FontFamily: '"Builder Sans"',
                            FontWeight: "400",
                            FontSize: 14,
                            LineHeight: 1.4
                        },
                        BodySmall: {
                            Font: '400 12/1.4 "Builder Sans"',
                            LetterSpacing: 0,
                            FontFamily: '"Builder Sans"',
                            FontWeight: "400",
                            FontSize: 12,
                            LineHeight: 1.4
                        },
                        CaptionLarge: {
                            Font: '600 14/1.4 "Builder Sans"',
                            LetterSpacing: 0,
                            FontFamily: '"Builder Sans"',
                            FontWeight: "600",
                            FontSize: 14,
                            LineHeight: 1.4
                        },
                        CaptionMedium: {
                            Font: '600 12/1.4 "Builder Sans"',
                            LetterSpacing: 0,
                            FontFamily: '"Builder Sans"',
                            FontWeight: "600",
                            FontSize: 12,
                            LineHeight: 1.4
                        },
                        CaptionSmall: {
                            Font: '600 10/1.4 "Builder Sans"',
                            LetterSpacing: 0,
                            FontFamily: '"Builder Sans"',
                            FontWeight: "600",
                            FontSize: 10,
                            LineHeight: 1.4
                        }
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
                    Ease: {
                        StandardIn: {
                            Bezier: "cubic-bezier(0.8, 0, 0.4, 1)",
                            Raw: [.8, 0, .4, 1]
                        },
                        StandardOut: {
                            Bezier: "cubic-bezier(0.2, 0, 0, 1)",
                            Raw: [.2, 0, 0, 1]
                        },
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
                        }
                    }
                }
            },
            725: function(r, e) {
                "use strict";
                Object.defineProperty(e, "__esModule", {
                    value: !0
                }), e.FoundationLight = void 0, e.FoundationLight = {
                    Color: {
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
                            }
                        },
                        None: "rgba(0, 0, 0, 0)",
                        Surface: {
                            Surface_0: "rgb(255, 255, 255)",
                            Surface_100: "rgb(247, 247, 248)",
                            Surface_200: "rgb(255, 255, 255)",
                            Surface_300: "rgb(247, 247, 248)"
                        },
                        OverMedia: {
                            OverMedia_0: "rgba(255, 255, 255, 0.92)",
                            OverMedia_100: "rgba(247, 247, 248, 0.92)",
                            OverMedia_200: "rgba(255, 255, 255, 0.92)",
                            OverMedia_300: "rgba(247, 247, 248, 0.92)"
                        },
                        Shift: {
                            Shift_100: "rgba(27, 37, 75, 0.04)",
                            Shift_200: "rgba(27, 37, 75, 0.08)",
                            Shift_300: "rgba(27, 37, 75, 0.12)",
                            Shift_400: "rgba(27, 37, 75, 0.16)"
                        },
                        Content: {
                            Emphasis: "rgb(32, 34, 39)",
                            Default: "rgb(73, 77, 90)",
                            Muted: "rgb(106, 111, 129)",
                            Link: "rgb(20, 70, 255)"
                        },
                        Stroke: {
                            Emphasis: "rgba(27, 37, 75, 0.16)",
                            Default: "rgba(27, 37, 75, 0.12)",
                            Muted: "rgba(27, 37, 75, 0.08)"
                        },
                        System: {
                            Contrast: "rgb(32, 34, 39)",
                            Neutral: "rgb(73, 77, 90)",
                            Emphasis: "rgb(51, 95, 255)",
                            Success: "rgb(57, 197, 130)",
                            Warning: "rgb(242, 186, 42)",
                            Alert: "rgb(223, 40, 31)"
                        },
                        Common: {
                            Shimmer: "rgba(27, 37, 75, 0.12)",
                            Scrim: "rgba(10, 10, 14, 0.5)",
                            Backdrop: "rgba(10, 10, 14, 0.5)",
                            Shadow: "rgba(0, 0, 0, 0.5)",
                            NavigationBar: "rgb(255, 255, 255)",
                            HeavyDivider: "rgba(27, 37, 75, 0.04)"
                        },
                        Selection: {
                            Start: "rgb(51, 95, 255)",
                            End: "rgb(51, 95, 255)"
                        },
                        State: {
                            Idle: "rgba(0, 0, 0, 0)",
                            Hover: "rgba(27, 37, 75, 0.08)",
                            Press: "rgba(27, 37, 75, 0.12)"
                        },
                        ActionEmphasis: {
                            Background: "rgb(51, 95, 255)",
                            Foreground: "rgb(247, 247, 248)",
                            Border: "rgba(0, 0, 0, 0)"
                        },
                        ActionSoftEmphasis: {
                            Background: "rgba(51, 95, 255, 0.3)",
                            Foreground: "rgb(0, 20, 92)",
                            Border: "rgba(0, 0, 0, 0)"
                        },
                        ActionSubEmphasis: {
                            Background: "rgb(32, 34, 39)",
                            Foreground: "rgb(247, 247, 248)",
                            Border: "rgba(0, 0, 0, 0)"
                        },
                        ActionOverMedia: {
                            Background: "rgb(32, 34, 39)",
                            Foreground: "rgb(247, 247, 248)",
                            Border: "rgba(0, 0, 0, 0)"
                        },
                        ActionStandard: {
                            Background: "rgba(27, 37, 75, 0.12)",
                            Foreground: "rgb(32, 34, 39)",
                            Border: "rgba(0, 0, 0, 0)"
                        },
                        ActionSubtle: {
                            Background: "rgba(0, 0, 0, 0)",
                            Foreground: "rgb(32, 34, 39)",
                            Border: "rgb(73, 77, 90)"
                        },
                        ActionLink: {
                            Background: "rgba(0, 0, 0, 0)",
                            Foreground: "rgb(32, 34, 39)",
                            Border: "rgba(0, 0, 0, 0)"
                        },
                        ActionUtility: {
                            Background: "rgba(0, 0, 0, 0)",
                            Foreground: "rgb(32, 34, 39)",
                            Border: "rgba(0, 0, 0, 0)"
                        },
                        ActionAlert: {
                            Background: "rgba(27, 37, 75, 0.12)",
                            Foreground: "rgb(217, 28, 21)",
                            Border: "rgba(0, 0, 0, 0)"
                        }
                    },
                    Config: {
                        Theme: {
                            Name: "Foundation",
                            IsFoundation: "true",
                            IsUIBlox: "false"
                        },
                        ColorMode: {
                            Name: "Light",
                            IsDark: "false",
                            IsLight: "true"
                        },
                        UI: {
                            Interval: 4,
                            Scale: 1,
                            StrokeBase: 1
                        },
                        Text: {
                            Interval: 4,
                            Scale: 1,
                            Font: '"Builder Sans"',
                            NominalScale: 1,
                            InverseScale: 1
                        }
                    },
                    DarkMode: {
                        None: "rgba(0, 0, 0, 0)",
                        Surface: {
                            Surface_0: "rgb(18, 18, 21)",
                            Surface_100: "rgb(25, 26, 31)",
                            Surface_200: "rgb(32, 34, 39)",
                            Surface_300: "rgb(39, 41, 48)"
                        },
                        OverMedia: {
                            OverMedia_0: "rgba(18, 18, 21, 0.92)",
                            OverMedia_100: "rgba(25, 26, 31, 0.92)",
                            OverMedia_200: "rgba(32, 34, 39, 0.92)",
                            OverMedia_300: "rgba(39, 41, 48, 0.92)"
                        },
                        Shift: {
                            Shift_100: "rgba(208, 217, 251, 0.04)",
                            Shift_200: "rgba(208, 217, 251, 0.08)",
                            Shift_300: "rgba(208, 217, 251, 0.12)",
                            Shift_400: "rgba(208, 217, 251, 0.16)"
                        },
                        Content: {
                            Emphasis: "rgb(247, 247, 248)",
                            Default: "rgb(213, 215, 221)",
                            Muted: "rgb(188, 190, 200)",
                            Link: "rgb(82, 139, 255)"
                        },
                        Stroke: {
                            Emphasis: "rgba(208, 217, 251, 0.16)",
                            Default: "rgba(208, 217, 251, 0.12)",
                            Muted: "rgba(208, 217, 251, 0.08)"
                        },
                        System: {
                            Contrast: "rgb(247, 247, 248)",
                            Neutral: "rgb(188, 190, 200)",
                            Emphasis: "rgb(51, 95, 255)",
                            Success: "rgb(57, 197, 130)",
                            Warning: "rgb(242, 186, 42)",
                            Alert: "rgb(223, 40, 31)"
                        },
                        Common: {
                            Shimmer: "rgba(208, 217, 251, 0.12)",
                            Scrim: "rgba(10, 10, 14, 0.75)",
                            Backdrop: "rgba(10, 10, 14, 0.75)",
                            Shadow: "rgba(0, 0, 0, 0.5)",
                            NavigationBar: "rgb(18, 18, 21)",
                            HeavyDivider: "rgba(0, 0, 0, 0.5)"
                        },
                        Selection: {
                            Start: "rgb(255, 255, 255)",
                            End: "rgb(255, 255, 255)"
                        },
                        State: {
                            Idle: "rgba(255, 255, 255, 0)",
                            Hover: "rgba(208, 217, 251, 0.08)",
                            Press: "rgba(208, 217, 251, 0.12)"
                        },
                        ActionEmphasis: {
                            Background: "rgb(51, 95, 255)",
                            Foreground: "rgb(247, 247, 248)",
                            Border: "rgba(0, 0, 0, 0)"
                        },
                        ActionSoftEmphasis: {
                            Background: "rgba(51, 95, 255, 0.4)",
                            Foreground: "rgb(235, 241, 255)",
                            Border: "rgba(0, 0, 0, 0)"
                        },
                        ActionSubEmphasis: {
                            Background: "rgb(247, 247, 248)",
                            Foreground: "rgb(32, 34, 39)",
                            Border: "rgba(0, 0, 0, 0)"
                        },
                        ActionOverMedia: {
                            Background: "rgb(247, 247, 248)",
                            Foreground: "rgb(32, 34, 39)",
                            Border: "rgba(0, 0, 0, 0)"
                        },
                        ActionStandard: {
                            Background: "rgba(208, 217, 251, 0.12)",
                            Foreground: "rgb(247, 247, 248)",
                            Border: "rgba(0, 0, 0, 0)"
                        },
                        ActionSubtle: {
                            Background: "rgba(0, 0, 0, 0)",
                            Foreground: "rgb(247, 247, 248)",
                            Border: "rgb(213, 215, 221)"
                        },
                        ActionLink: {
                            Background: "rgba(0, 0, 0, 0)",
                            Foreground: "rgb(247, 247, 248)",
                            Border: "rgba(0, 0, 0, 0)"
                        },
                        ActionUtility: {
                            Background: "rgba(0, 0, 0, 0)",
                            Foreground: "rgb(247, 247, 248)",
                            Border: "rgba(0, 0, 0, 0)"
                        },
                        ActionAlert: {
                            Background: "rgba(208, 217, 251, 0.12)",
                            Foreground: "rgb(240, 68, 51)",
                            Border: "rgba(0, 0, 0, 0)"
                        }
                    },
                    LightMode: {
                        None: "rgba(0, 0, 0, 0)",
                        Surface: {
                            Surface_0: "rgb(255, 255, 255)",
                            Surface_100: "rgb(247, 247, 248)",
                            Surface_200: "rgb(255, 255, 255)",
                            Surface_300: "rgb(247, 247, 248)"
                        },
                        OverMedia: {
                            OverMedia_0: "rgba(255, 255, 255, 0.92)",
                            OverMedia_100: "rgba(247, 247, 248, 0.92)",
                            OverMedia_200: "rgba(255, 255, 255, 0.92)",
                            OverMedia_300: "rgba(247, 247, 248, 0.92)"
                        },
                        Shift: {
                            Shift_100: "rgba(27, 37, 75, 0.04)",
                            Shift_200: "rgba(27, 37, 75, 0.08)",
                            Shift_300: "rgba(27, 37, 75, 0.12)",
                            Shift_400: "rgba(27, 37, 75, 0.16)"
                        },
                        Content: {
                            Emphasis: "rgb(32, 34, 39)",
                            Default: "rgb(73, 77, 90)",
                            Muted: "rgb(106, 111, 129)",
                            Link: "rgb(20, 70, 255)"
                        },
                        Stroke: {
                            Emphasis: "rgba(27, 37, 75, 0.16)",
                            Default: "rgba(27, 37, 75, 0.12)",
                            Muted: "rgba(27, 37, 75, 0.08)"
                        },
                        System: {
                            Contrast: "rgb(32, 34, 39)",
                            Neutral: "rgb(73, 77, 90)",
                            Emphasis: "rgb(51, 95, 255)",
                            Success: "rgb(57, 197, 130)",
                            Warning: "rgb(242, 186, 42)",
                            Alert: "rgb(223, 40, 31)"
                        },
                        Common: {
                            Shimmer: "rgba(27, 37, 75, 0.12)",
                            Scrim: "rgba(10, 10, 14, 0.5)",
                            Backdrop: "rgba(10, 10, 14, 0.5)",
                            Shadow: "rgba(0, 0, 0, 0.5)",
                            NavigationBar: "rgb(255, 255, 255)",
                            HeavyDivider: "rgba(27, 37, 75, 0.04)"
                        },
                        Selection: {
                            Start: "rgb(51, 95, 255)",
                            End: "rgb(51, 95, 255)"
                        },
                        State: {
                            Idle: "rgba(0, 0, 0, 0)",
                            Hover: "rgba(27, 37, 75, 0.08)",
                            Press: "rgba(27, 37, 75, 0.12)"
                        },
                        ActionEmphasis: {
                            Background: "rgb(51, 95, 255)",
                            Foreground: "rgb(247, 247, 248)",
                            Border: "rgba(0, 0, 0, 0)"
                        },
                        ActionSoftEmphasis: {
                            Background: "rgba(51, 95, 255, 0.3)",
                            Foreground: "rgb(0, 20, 92)",
                            Border: "rgba(0, 0, 0, 0)"
                        },
                        ActionSubEmphasis: {
                            Background: "rgb(32, 34, 39)",
                            Foreground: "rgb(247, 247, 248)",
                            Border: "rgba(0, 0, 0, 0)"
                        },
                        ActionOverMedia: {
                            Background: "rgb(32, 34, 39)",
                            Foreground: "rgb(247, 247, 248)",
                            Border: "rgba(0, 0, 0, 0)"
                        },
                        ActionStandard: {
                            Background: "rgba(27, 37, 75, 0.12)",
                            Foreground: "rgb(32, 34, 39)",
                            Border: "rgba(0, 0, 0, 0)"
                        },
                        ActionSubtle: {
                            Background: "rgba(0, 0, 0, 0)",
                            Foreground: "rgb(32, 34, 39)",
                            Border: "rgb(73, 77, 90)"
                        },
                        ActionLink: {
                            Background: "rgba(0, 0, 0, 0)",
                            Foreground: "rgb(32, 34, 39)",
                            Border: "rgba(0, 0, 0, 0)"
                        },
                        ActionUtility: {
                            Background: "rgba(0, 0, 0, 0)",
                            Foreground: "rgb(32, 34, 39)",
                            Border: "rgba(0, 0, 0, 0)"
                        },
                        ActionAlert: {
                            Background: "rgba(27, 37, 75, 0.12)",
                            Foreground: "rgb(217, 28, 21)",
                            Border: "rgba(0, 0, 0, 0)"
                        }
                    },
                    Inverse: {
                        None: "rgba(0, 0, 0, 0)",
                        Surface: {
                            Surface_0: "rgb(18, 18, 21)",
                            Surface_100: "rgb(25, 26, 31)",
                            Surface_200: "rgb(32, 34, 39)",
                            Surface_300: "rgb(39, 41, 48)"
                        },
                        OverMedia: {
                            OverMedia_0: "rgba(18, 18, 21, 0.92)",
                            OverMedia_100: "rgba(25, 26, 31, 0.92)",
                            OverMedia_200: "rgba(32, 34, 39, 0.92)",
                            OverMedia_300: "rgba(39, 41, 48, 0.92)"
                        },
                        Shift: {
                            Shift_100: "rgba(208, 217, 251, 0.04)",
                            Shift_200: "rgba(208, 217, 251, 0.08)",
                            Shift_300: "rgba(208, 217, 251, 0.12)",
                            Shift_400: "rgba(208, 217, 251, 0.16)"
                        },
                        Content: {
                            Emphasis: "rgb(247, 247, 248)",
                            Default: "rgb(213, 215, 221)",
                            Muted: "rgb(188, 190, 200)",
                            Link: "rgb(82, 139, 255)"
                        },
                        Stroke: {
                            Emphasis: "rgba(208, 217, 251, 0.16)",
                            Default: "rgba(208, 217, 251, 0.12)",
                            Muted: "rgba(208, 217, 251, 0.08)"
                        },
                        System: {
                            Contrast: "rgb(247, 247, 248)",
                            Neutral: "rgb(188, 190, 200)",
                            Emphasis: "rgb(51, 95, 255)",
                            Success: "rgb(57, 197, 130)",
                            Warning: "rgb(242, 186, 42)",
                            Alert: "rgb(223, 40, 31)"
                        },
                        Common: {
                            Shimmer: "rgba(208, 217, 251, 0.12)",
                            Scrim: "rgba(10, 10, 14, 0.75)",
                            Backdrop: "rgba(10, 10, 14, 0.75)",
                            Shadow: "rgba(0, 0, 0, 0.5)",
                            NavigationBar: "rgb(18, 18, 21)",
                            HeavyDivider: "rgba(0, 0, 0, 0.5)"
                        },
                        Selection: {
                            Start: "rgb(255, 255, 255)",
                            End: "rgb(255, 255, 255)"
                        },
                        State: {
                            Idle: "rgba(255, 255, 255, 0)",
                            Hover: "rgba(208, 217, 251, 0.08)",
                            Press: "rgba(208, 217, 251, 0.12)"
                        },
                        ActionEmphasis: {
                            Background: "rgb(51, 95, 255)",
                            Foreground: "rgb(247, 247, 248)",
                            Border: "rgba(0, 0, 0, 0)"
                        },
                        ActionSoftEmphasis: {
                            Background: "rgba(51, 95, 255, 0.4)",
                            Foreground: "rgb(235, 241, 255)",
                            Border: "rgba(0, 0, 0, 0)"
                        },
                        ActionSubEmphasis: {
                            Background: "rgb(247, 247, 248)",
                            Foreground: "rgb(32, 34, 39)",
                            Border: "rgba(0, 0, 0, 0)"
                        },
                        ActionOverMedia: {
                            Background: "rgb(247, 247, 248)",
                            Foreground: "rgb(32, 34, 39)",
                            Border: "rgba(0, 0, 0, 0)"
                        },
                        ActionStandard: {
                            Background: "rgba(208, 217, 251, 0.12)",
                            Foreground: "rgb(247, 247, 248)",
                            Border: "rgba(0, 0, 0, 0)"
                        },
                        ActionSubtle: {
                            Background: "rgba(0, 0, 0, 0)",
                            Foreground: "rgb(247, 247, 248)",
                            Border: "rgb(213, 215, 221)"
                        },
                        ActionLink: {
                            Background: "rgba(0, 0, 0, 0)",
                            Foreground: "rgb(247, 247, 248)",
                            Border: "rgba(0, 0, 0, 0)"
                        },
                        ActionUtility: {
                            Background: "rgba(0, 0, 0, 0)",
                            Foreground: "rgb(247, 247, 248)",
                            Border: "rgba(0, 0, 0, 0)"
                        },
                        ActionAlert: {
                            Background: "rgba(208, 217, 251, 0.12)",
                            Foreground: "rgb(240, 68, 51)",
                            Border: "rgba(0, 0, 0, 0)"
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
                    Padding: {
                        None: 0,
                        XXSmall: 2,
                        XSmall: 4,
                        Small: 8,
                        Medium: 12,
                        Large: 16,
                        XLarge: 20,
                        XXLarge: 24
                    },
                    Margin: {
                        None: 0,
                        Small: 20,
                        Medium: 24,
                        Large: 48
                    },
                    Gap: {
                        None: 0,
                        XXSmall: 2,
                        XSmall: 4,
                        Small: 8,
                        Medium: 12,
                        Large: 16,
                        XLarge: 20,
                        XXLarge: 24
                    },
                    Gutter: {
                        None: 0,
                        Small: 8,
                        Medium: 12,
                        Large: 16,
                        XLarge: 20,
                        XXLarge: 24
                    },
                    Radius: {
                        None: 0,
                        XSmall: 2,
                        Small: 4,
                        Medium: 8,
                        Large: 16,
                        Circle: 9999
                    },
                    Stroke: {
                        None: 0,
                        Thin: .5,
                        Standard: 1,
                        Thick: 1.5,
                        Thicker: 3
                    },
                    InputSize: {
                        XSmall: 24,
                        Small: 32,
                        Medium: 40,
                        Large: 48
                    },
                    IconSize: {
                        XSmall: 12,
                        Small: 16,
                        Medium: 20,
                        Large: 24,
                        XLarge: 28
                    },
                    ToggleSize: {
                        XSmall: 16,
                        Small: 20,
                        Medium: 24,
                        Large: 28
                    },
                    LineHeight: {
                        LineHeight_100: 1,
                        LineHeight_120: 1.2,
                        LineHeight_130: 1.3,
                        LineHeight_140: 1.4
                    },
                    LetterSpacing: {
                        Tight: -.01,
                        Default: 0,
                        Loose: .01
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
                    Typography: {
                        DisplayLarge: {
                            Font: '700 80/1.2 "Builder Sans"',
                            LetterSpacing: -.01,
                            FontFamily: '"Builder Sans"',
                            FontWeight: "700",
                            FontSize: 80,
                            LineHeight: 1.2
                        },
                        DisplayMedium: {
                            Font: '700 56/1.2 "Builder Sans"',
                            LetterSpacing: -.01,
                            FontFamily: '"Builder Sans"',
                            FontWeight: "700",
                            FontSize: 56,
                            LineHeight: 1.2
                        },
                        DisplaySmall: {
                            Font: '700 40/1.2 "Builder Sans"',
                            LetterSpacing: -.01,
                            FontFamily: '"Builder Sans"',
                            FontWeight: "700",
                            FontSize: 40,
                            LineHeight: 1.2
                        },
                        HeadingLarge: {
                            Font: '700 28/1.2 "Builder Sans"',
                            LetterSpacing: -.01,
                            FontFamily: '"Builder Sans"',
                            FontWeight: "700",
                            FontSize: 28,
                            LineHeight: 1.2
                        },
                        HeadingMedium: {
                            Font: '700 24/1.2 "Builder Sans"',
                            LetterSpacing: -.01,
                            FontFamily: '"Builder Sans"',
                            FontWeight: "700",
                            FontSize: 24,
                            LineHeight: 1.2
                        },
                        HeadingSmall: {
                            Font: '700 20/1.2 "Builder Sans"',
                            LetterSpacing: -.01,
                            FontFamily: '"Builder Sans"',
                            FontWeight: "700",
                            FontSize: 20,
                            LineHeight: 1.2
                        },
                        TitleLarge: {
                            Font: '700 16/1.4 "Builder Sans"',
                            LetterSpacing: 0,
                            FontFamily: '"Builder Sans"',
                            FontWeight: "700",
                            FontSize: 16,
                            LineHeight: 1.4
                        },
                        TitleMedium: {
                            Font: '700 14/1.4 "Builder Sans"',
                            LetterSpacing: 0,
                            FontFamily: '"Builder Sans"',
                            FontWeight: "700",
                            FontSize: 14,
                            LineHeight: 1.4
                        },
                        TitleSmall: {
                            Font: '700 12/1.4 "Builder Sans"',
                            LetterSpacing: 0,
                            FontFamily: '"Builder Sans"',
                            FontWeight: "700",
                            FontSize: 12,
                            LineHeight: 1.4
                        },
                        LabelLarge: {
                            Font: '600 16/1 "Builder Sans"',
                            LetterSpacing: 0,
                            FontFamily: '"Builder Sans"',
                            FontWeight: "600",
                            FontSize: 16,
                            LineHeight: 1
                        },
                        LabelMedium: {
                            Font: '600 14/1 "Builder Sans"',
                            LetterSpacing: 0,
                            FontFamily: '"Builder Sans"',
                            FontWeight: "600",
                            FontSize: 14,
                            LineHeight: 1
                        },
                        LabelSmall: {
                            Font: '600 12/1 "Builder Sans"',
                            LetterSpacing: 0,
                            FontFamily: '"Builder Sans"',
                            FontWeight: "600",
                            FontSize: 12,
                            LineHeight: 1
                        },
                        BodyLarge: {
                            Font: '400 16/1.4 "Builder Sans"',
                            LetterSpacing: 0,
                            FontFamily: '"Builder Sans"',
                            FontWeight: "400",
                            FontSize: 16,
                            LineHeight: 1.4
                        },
                        BodyMedium: {
                            Font: '400 14/1.4 "Builder Sans"',
                            LetterSpacing: 0,
                            FontFamily: '"Builder Sans"',
                            FontWeight: "400",
                            FontSize: 14,
                            LineHeight: 1.4
                        },
                        BodySmall: {
                            Font: '400 12/1.4 "Builder Sans"',
                            LetterSpacing: 0,
                            FontFamily: '"Builder Sans"',
                            FontWeight: "400",
                            FontSize: 12,
                            LineHeight: 1.4
                        },
                        CaptionLarge: {
                            Font: '600 14/1.4 "Builder Sans"',
                            LetterSpacing: 0,
                            FontFamily: '"Builder Sans"',
                            FontWeight: "600",
                            FontSize: 14,
                            LineHeight: 1.4
                        },
                        CaptionMedium: {
                            Font: '600 12/1.4 "Builder Sans"',
                            LetterSpacing: 0,
                            FontFamily: '"Builder Sans"',
                            FontWeight: "600",
                            FontSize: 12,
                            LineHeight: 1.4
                        },
                        CaptionSmall: {
                            Font: '600 10/1.4 "Builder Sans"',
                            LetterSpacing: 0,
                            FontFamily: '"Builder Sans"',
                            FontWeight: "600",
                            FontSize: 10,
                            LineHeight: 1.4
                        }
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
                    Ease: {
                        StandardIn: {
                            Bezier: "cubic-bezier(0.8, 0, 0.4, 1)",
                            Raw: [.8, 0, .4, 1]
                        },
                        StandardOut: {
                            Bezier: "cubic-bezier(0.2, 0, 0, 1)",
                            Raw: [.2, 0, 0, 1]
                        },
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
                        }
                    }
                }
            },
            11: function(r, e) {
                "use strict";
                Object.defineProperty(e, "__esModule", {
                    value: !0
                }), e.UIBloxDark = void 0, e.UIBloxDark = {
                    Color: {
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
                            Gray: {
                                Gray_100: "rgb(242, 244, 245)",
                                Gray_200: "rgb(232, 235, 236)",
                                Gray_300: "rgb(222, 225, 227)",
                                Gray_400: "rgb(199, 203, 206)",
                                Gray_500: "rgb(189, 190, 190)",
                                Gray_600: "rgb(145, 146, 147)",
                                Gray_700: "rgb(101, 102, 104)",
                                Gray_800: "rgb(96, 97, 98)",
                                Gray_900: "rgb(57, 59, 61)",
                                Gray_1000: "rgb(35, 37, 39)",
                                Gray_1100: "rgb(25, 27, 29)",
                                Gray_1200: "rgb(17, 18, 20)"
                            }
                        },
                        None: "rgba(0, 0, 0, 0)",
                        Surface: {
                            Surface_0: "rgb(35, 37, 39)",
                            Surface_100: "rgb(25, 27, 29)",
                            Surface_200: "rgb(17, 18, 20)",
                            Surface_300: "rgb(57, 59, 61)"
                        },
                        OverMedia: {
                            OverMedia_0: "rgba(0, 0, 0, 0.7)",
                            OverMedia_100: "rgba(17, 18, 20, 0.7)",
                            OverMedia_200: "rgba(25, 27, 29, 0.7)",
                            OverMedia_300: "rgba(57, 59, 61, 0.7)"
                        },
                        Shift: {
                            Shift_100: "rgba(17, 18, 20, 0.8)",
                            Shift_200: "rgb(101, 102, 104)",
                            Shift_300: "rgba(255, 255, 255, 0.2)",
                            Shift_400: "rgba(255, 255, 255, 0.3)"
                        },
                        Content: {
                            Emphasis: "rgb(255, 255, 255)",
                            Default: "rgb(189, 190, 190)",
                            Muted: "rgba(255, 255, 255, 0.7)",
                            Link: "rgb(112, 160, 255)"
                        },
                        Stroke: {
                            Emphasis: "rgba(255, 255, 255, 0.2)",
                            Default: "rgba(255, 255, 255, 0.15)",
                            Muted: "rgba(255, 255, 255, 0.1)"
                        },
                        System: {
                            Contrast: "rgb(255, 255, 255)",
                            Neutral: "rgb(189, 190, 190)",
                            Emphasis: "rgb(0, 180, 109)",
                            Success: "rgb(0, 180, 109)",
                            Warning: "rgb(242, 186, 42)",
                            Alert: "rgb(247, 75, 82)"
                        },
                        Common: {
                            Shimmer: "rgba(57, 59, 61, 0.5)",
                            Scrim: "rgba(0, 0, 0, 0.5)",
                            Backdrop: "rgba(0, 0, 0, 0.5)",
                            Shadow: "rgba(0, 0, 0, 0.5)",
                            NavigationBar: "rgb(25, 27, 29)",
                            HeavyDivider: "rgba(0, 0, 0, 0.5)"
                        },
                        Selection: {
                            Start: "rgb(255, 255, 255)",
                            End: "rgb(101, 102, 104)"
                        },
                        State: {
                            Idle: "rgba(255, 255, 255, 0)",
                            Hover: "rgba(255, 255, 255, 0.1)",
                            Press: "rgba(0, 0, 0, 0.3)"
                        },
                        ActionEmphasis: {
                            Background: "rgb(0, 180, 109)",
                            Foreground: "rgb(255, 255, 255)",
                            Border: "rgba(0, 0, 0, 0)"
                        },
                        ActionSoftEmphasis: {
                            Background: "rgb(255, 255, 255)",
                            Foreground: "rgb(57, 59, 61)",
                            Border: "rgba(0, 0, 0, 0)"
                        },
                        ActionSubEmphasis: {
                            Background: "rgb(255, 255, 255)",
                            Foreground: "rgb(57, 59, 61)",
                            Border: "rgba(0, 0, 0, 0)"
                        },
                        ActionOverMedia: {
                            Background: "rgb(255, 255, 255)",
                            Foreground: "rgb(57, 59, 61)",
                            Border: "rgba(0, 0, 0, 0)"
                        },
                        ActionStandard: {
                            Background: "rgba(255, 255, 255, 0.2)",
                            Foreground: "rgb(255, 255, 255)",
                            Border: "rgba(0, 0, 0, 0)"
                        },
                        ActionSubtle: {
                            Background: "rgba(0, 0, 0, 0)",
                            Foreground: "rgb(255, 255, 255)",
                            Border: "rgb(255, 255, 255)"
                        },
                        ActionLink: {
                            Background: "rgba(0, 0, 0, 0)",
                            Foreground: "rgb(255, 255, 255)",
                            Border: "rgba(0, 0, 0, 0)"
                        },
                        ActionUtility: {
                            Background: "rgba(0, 0, 0, 0)",
                            Foreground: "rgb(255, 255, 255)",
                            Border: "rgba(0, 0, 0, 0)"
                        },
                        ActionAlert: {
                            Background: "rgba(0, 0, 0, 0)",
                            Foreground: "rgb(247, 75, 82)",
                            Border: "rgb(247, 75, 82)"
                        }
                    },
                    Config: {
                        Theme: {
                            Name: "UIBlox",
                            IsFoundation: "false",
                            IsUIBlox: "true"
                        },
                        ColorMode: {
                            Name: "Dark",
                            IsDark: "true",
                            IsLight: "false"
                        },
                        UI: {
                            Interval: 4,
                            Scale: 1,
                            StrokeBase: 1
                        },
                        Text: {
                            Interval: 4,
                            Scale: 1,
                            Font: '"Builder Sans"',
                            NominalScale: 1,
                            InverseScale: 1
                        }
                    },
                    DarkMode: {
                        None: "rgba(0, 0, 0, 0)",
                        Surface: {
                            Surface_0: "rgb(35, 37, 39)",
                            Surface_100: "rgb(25, 27, 29)",
                            Surface_200: "rgb(17, 18, 20)",
                            Surface_300: "rgb(57, 59, 61)"
                        },
                        OverMedia: {
                            OverMedia_0: "rgba(0, 0, 0, 0.7)",
                            OverMedia_100: "rgba(17, 18, 20, 0.7)",
                            OverMedia_200: "rgba(25, 27, 29, 0.7)",
                            OverMedia_300: "rgba(57, 59, 61, 0.7)"
                        },
                        Shift: {
                            Shift_100: "rgba(17, 18, 20, 0.8)",
                            Shift_200: "rgb(101, 102, 104)",
                            Shift_300: "rgba(255, 255, 255, 0.2)",
                            Shift_400: "rgba(255, 255, 255, 0.3)"
                        },
                        Content: {
                            Emphasis: "rgb(255, 255, 255)",
                            Default: "rgb(189, 190, 190)",
                            Muted: "rgba(255, 255, 255, 0.7)",
                            Link: "rgb(112, 160, 255)"
                        },
                        Stroke: {
                            Emphasis: "rgba(255, 255, 255, 0.2)",
                            Default: "rgba(255, 255, 255, 0.15)",
                            Muted: "rgba(255, 255, 255, 0.1)"
                        },
                        System: {
                            Contrast: "rgb(255, 255, 255)",
                            Neutral: "rgb(189, 190, 190)",
                            Emphasis: "rgb(0, 180, 109)",
                            Success: "rgb(0, 180, 109)",
                            Warning: "rgb(242, 186, 42)",
                            Alert: "rgb(247, 75, 82)"
                        },
                        Common: {
                            Shimmer: "rgba(57, 59, 61, 0.5)",
                            Scrim: "rgba(0, 0, 0, 0.5)",
                            Backdrop: "rgba(0, 0, 0, 0.5)",
                            Shadow: "rgba(0, 0, 0, 0.5)",
                            NavigationBar: "rgb(25, 27, 29)",
                            HeavyDivider: "rgba(0, 0, 0, 0.5)"
                        },
                        Selection: {
                            Start: "rgb(255, 255, 255)",
                            End: "rgb(101, 102, 104)"
                        },
                        State: {
                            Idle: "rgba(255, 255, 255, 0)",
                            Hover: "rgba(255, 255, 255, 0.1)",
                            Press: "rgba(0, 0, 0, 0.3)"
                        },
                        ActionEmphasis: {
                            Background: "rgb(0, 180, 109)",
                            Foreground: "rgb(255, 255, 255)",
                            Border: "rgba(0, 0, 0, 0)"
                        },
                        ActionSoftEmphasis: {
                            Background: "rgb(255, 255, 255)",
                            Foreground: "rgb(57, 59, 61)",
                            Border: "rgba(0, 0, 0, 0)"
                        },
                        ActionSubEmphasis: {
                            Background: "rgb(255, 255, 255)",
                            Foreground: "rgb(57, 59, 61)",
                            Border: "rgba(0, 0, 0, 0)"
                        },
                        ActionOverMedia: {
                            Background: "rgb(255, 255, 255)",
                            Foreground: "rgb(57, 59, 61)",
                            Border: "rgba(0, 0, 0, 0)"
                        },
                        ActionStandard: {
                            Background: "rgba(255, 255, 255, 0.2)",
                            Foreground: "rgb(255, 255, 255)",
                            Border: "rgba(0, 0, 0, 0)"
                        },
                        ActionSubtle: {
                            Background: "rgba(0, 0, 0, 0)",
                            Foreground: "rgb(255, 255, 255)",
                            Border: "rgb(255, 255, 255)"
                        },
                        ActionLink: {
                            Background: "rgba(0, 0, 0, 0)",
                            Foreground: "rgb(255, 255, 255)",
                            Border: "rgba(0, 0, 0, 0)"
                        },
                        ActionUtility: {
                            Background: "rgba(0, 0, 0, 0)",
                            Foreground: "rgb(255, 255, 255)",
                            Border: "rgba(0, 0, 0, 0)"
                        },
                        ActionAlert: {
                            Background: "rgba(0, 0, 0, 0)",
                            Foreground: "rgb(247, 75, 82)",
                            Border: "rgb(247, 75, 82)"
                        }
                    },
                    LightMode: {
                        None: "rgba(0, 0, 0, 0)",
                        Surface: {
                            Surface_0: "rgb(242, 244, 245)",
                            Surface_100: "rgb(222, 225, 227)",
                            Surface_200: "rgb(199, 203, 206)",
                            Surface_300: "rgb(255, 255, 255)"
                        },
                        OverMedia: {
                            OverMedia_0: "rgba(255, 255, 255, 0.9)",
                            OverMedia_100: "rgba(222, 225, 227, 0.9)",
                            OverMedia_200: "rgba(255, 255, 255, 0.9)",
                            OverMedia_300: "rgba(222, 225, 227, 0.9)"
                        },
                        Shift: {
                            Shift_100: "rgba(0, 0, 0, 0.1)",
                            Shift_200: "rgb(189, 190, 190)",
                            Shift_300: "rgba(0, 0, 0, 0.2)",
                            Shift_400: "rgba(0, 0, 0, 0.3)"
                        },
                        Content: {
                            Emphasis: "rgb(57, 59, 61)",
                            Default: "rgb(96, 97, 98)",
                            Muted: "rgba(0, 0, 0, 0.6)",
                            Link: "rgb(112, 160, 255)"
                        },
                        Stroke: {
                            Emphasis: "rgba(57, 59, 61, 0.2)",
                            Default: "rgba(57, 59, 61, 0.15)",
                            Muted: "rgba(57, 59, 61, 0.1)"
                        },
                        System: {
                            Contrast: "rgb(57, 59, 61)",
                            Neutral: "rgb(96, 97, 98)",
                            Emphasis: "rgb(0, 180, 109)",
                            Success: "rgb(0, 180, 109)",
                            Warning: "rgb(242, 186, 42)",
                            Alert: "rgb(247, 75, 82)"
                        },
                        Common: {
                            Shimmer: "rgba(0, 0, 0, 0.1)",
                            Scrim: "rgba(0, 0, 0, 0.3)",
                            Shadow: "rgba(0, 0, 0, 0.3)",
                            Backdrop: "rgba(0, 0, 0, 0.3)",
                            NavigationBar: "rgb(255, 255, 255)",
                            HeavyDivider: "rgba(0, 0, 0, 0.1)"
                        },
                        Selection: {
                            Start: "rgb(189, 190, 190)",
                            End: "rgb(189, 190, 190)"
                        },
                        State: {
                            Idle: "rgba(0, 0, 0, 0)",
                            Hover: "rgba(0, 0, 0, 0.1)",
                            Press: "rgba(0, 0, 0, 0.2)"
                        },
                        ActionEmphasis: {
                            Background: "rgb(0, 180, 109)",
                            Foreground: "rgb(255, 255, 255)",
                            Border: "rgba(0, 0, 0, 0)"
                        },
                        ActionSoftEmphasis: {
                            Background: "rgb(57, 59, 61)",
                            Foreground: "rgb(255, 255, 255)",
                            Border: "rgba(0, 0, 0, 0)"
                        },
                        ActionSubEmphasis: {
                            Background: "rgb(57, 59, 61)",
                            Foreground: "rgb(255, 255, 255)",
                            Border: "rgba(0, 0, 0, 0)"
                        },
                        ActionOverMedia: {
                            Background: "rgb(57, 59, 61)",
                            Foreground: "rgb(255, 255, 255)",
                            Border: "rgba(0, 0, 0, 0)"
                        },
                        ActionStandard: {
                            Background: "rgba(0, 0, 0, 0.2)",
                            Foreground: "rgb(57, 59, 61)",
                            Border: "rgba(0, 0, 0, 0)"
                        },
                        ActionSubtle: {
                            Background: "rgba(0, 0, 0, 0)",
                            Foreground: "rgb(57, 59, 61)",
                            Border: "rgb(96, 97, 98)"
                        },
                        ActionLink: {
                            Background: "rgba(0, 0, 0, 0)",
                            Foreground: "rgb(57, 59, 61)",
                            Border: "rgba(0, 0, 0, 0)"
                        },
                        ActionUtility: {
                            Background: "rgba(0, 0, 0, 0)",
                            Foreground: "rgb(57, 59, 61)",
                            Border: "rgba(0, 0, 0, 0)"
                        },
                        ActionAlert: {
                            Background: "rgba(0, 0, 0, 0)",
                            Foreground: "rgb(247, 75, 82)",
                            Border: "rgb(247, 75, 82)"
                        }
                    },
                    Inverse: {
                        None: "rgba(0, 0, 0, 0)",
                        Surface: {
                            Surface_0: "rgb(242, 244, 245)",
                            Surface_100: "rgb(222, 225, 227)",
                            Surface_200: "rgb(199, 203, 206)",
                            Surface_300: "rgb(255, 255, 255)"
                        },
                        OverMedia: {
                            OverMedia_0: "rgba(255, 255, 255, 0.9)",
                            OverMedia_100: "rgba(222, 225, 227, 0.9)",
                            OverMedia_200: "rgba(255, 255, 255, 0.9)",
                            OverMedia_300: "rgba(222, 225, 227, 0.9)"
                        },
                        Shift: {
                            Shift_100: "rgba(0, 0, 0, 0.1)",
                            Shift_200: "rgb(189, 190, 190)",
                            Shift_300: "rgba(0, 0, 0, 0.2)",
                            Shift_400: "rgba(0, 0, 0, 0.3)"
                        },
                        Content: {
                            Emphasis: "rgb(57, 59, 61)",
                            Default: "rgb(96, 97, 98)",
                            Muted: "rgba(0, 0, 0, 0.6)",
                            Link: "rgb(112, 160, 255)"
                        },
                        Stroke: {
                            Emphasis: "rgba(57, 59, 61, 0.2)",
                            Default: "rgba(57, 59, 61, 0.15)",
                            Muted: "rgba(57, 59, 61, 0.1)"
                        },
                        System: {
                            Contrast: "rgb(57, 59, 61)",
                            Neutral: "rgb(96, 97, 98)",
                            Emphasis: "rgb(0, 180, 109)",
                            Success: "rgb(0, 180, 109)",
                            Warning: "rgb(242, 186, 42)",
                            Alert: "rgb(247, 75, 82)"
                        },
                        Common: {
                            Shimmer: "rgba(0, 0, 0, 0.1)",
                            Scrim: "rgba(0, 0, 0, 0.3)",
                            Backdrop: "rgba(0, 0, 0, 0.3)",
                            Shadow: "rgba(0, 0, 0, 0.3)",
                            NavigationBar: "rgb(255, 255, 255)",
                            HeavyDivider: "rgba(0, 0, 0, 0.1)"
                        },
                        Selection: {
                            Start: "rgb(189, 190, 190)",
                            End: "rgb(189, 190, 190)"
                        },
                        State: {
                            Idle: "rgba(0, 0, 0, 0)",
                            Hover: "rgba(0, 0, 0, 0.1)",
                            Press: "rgba(0, 0, 0, 0.2)"
                        },
                        ActionEmphasis: {
                            Background: "rgb(0, 180, 109)",
                            Foreground: "rgb(255, 255, 255)",
                            Border: "rgba(0, 0, 0, 0)"
                        },
                        ActionSoftEmphasis: {
                            Background: "rgb(57, 59, 61)",
                            Foreground: "rgb(255, 255, 255)",
                            Border: "rgba(0, 0, 0, 0)"
                        },
                        ActionSubEmphasis: {
                            Background: "rgb(57, 59, 61)",
                            Foreground: "rgb(255, 255, 255)",
                            Border: "rgba(0, 0, 0, 0)"
                        },
                        ActionOverMedia: {
                            Background: "rgb(57, 59, 61)",
                            Foreground: "rgb(255, 255, 255)",
                            Border: "rgba(0, 0, 0, 0)"
                        },
                        ActionStandard: {
                            Background: "rgba(0, 0, 0, 0.2)",
                            Foreground: "rgb(57, 59, 61)",
                            Border: "rgba(0, 0, 0, 0)"
                        },
                        ActionSubtle: {
                            Background: "rgba(0, 0, 0, 0)",
                            Foreground: "rgb(57, 59, 61)",
                            Border: "rgb(96, 97, 98)"
                        },
                        ActionLink: {
                            Background: "rgba(0, 0, 0, 0)",
                            Foreground: "rgb(57, 59, 61)",
                            Border: "rgba(0, 0, 0, 0)"
                        },
                        ActionUtility: {
                            Background: "rgba(0, 0, 0, 0)",
                            Foreground: "rgb(57, 59, 61)",
                            Border: "rgba(0, 0, 0, 0)"
                        },
                        ActionAlert: {
                            Background: "rgba(0, 0, 0, 0)",
                            Foreground: "rgb(247, 75, 82)",
                            Border: "rgb(247, 75, 82)"
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
                    Padding: {
                        None: 0,
                        XXSmall: 2,
                        XSmall: 4,
                        Small: 8,
                        Medium: 12,
                        Large: 16,
                        XLarge: 20,
                        XXLarge: 24
                    },
                    Margin: {
                        None: 0,
                        Small: 20,
                        Medium: 24,
                        Large: 48
                    },
                    Gap: {
                        None: 0,
                        XXSmall: 2,
                        XSmall: 4,
                        Small: 8,
                        Medium: 12,
                        Large: 16,
                        XLarge: 20,
                        XXLarge: 24
                    },
                    Gutter: {
                        None: 0,
                        Small: 8,
                        Medium: 12,
                        Large: 16,
                        XLarge: 20,
                        XXLarge: 24
                    },
                    Radius: {
                        None: 0,
                        XSmall: 2,
                        Small: 4,
                        Medium: 8,
                        Large: 16,
                        Circle: 9999
                    },
                    Stroke: {
                        None: 0,
                        Thin: .5,
                        Standard: 1,
                        Thick: 1.5,
                        Thicker: 3
                    },
                    InputSize: {
                        XSmall: 24,
                        Small: 32,
                        Medium: 40,
                        Large: 48
                    },
                    IconSize: {
                        XSmall: 12,
                        Small: 16,
                        Medium: 20,
                        Large: 24,
                        XLarge: 28
                    },
                    ToggleSize: {
                        XSmall: 16,
                        Small: 20,
                        Medium: 24,
                        Large: 28
                    },
                    LineHeight: {
                        LineHeight_100: 1,
                        LineHeight_120: 1.2,
                        LineHeight_130: 1.3,
                        LineHeight_140: 1.4
                    },
                    LetterSpacing: {
                        Tight: -.01,
                        Default: 0,
                        Loose: .01
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
                    Typography: {
                        DisplayLarge: {
                            Font: '700 80/1.2 "Builder Sans"',
                            LetterSpacing: -.01,
                            FontFamily: '"Builder Sans"',
                            FontWeight: "700",
                            FontSize: 80,
                            LineHeight: 1.2
                        },
                        DisplayMedium: {
                            Font: '700 56/1.2 "Builder Sans"',
                            LetterSpacing: -.01,
                            FontFamily: '"Builder Sans"',
                            FontWeight: "700",
                            FontSize: 56,
                            LineHeight: 1.2
                        },
                        DisplaySmall: {
                            Font: '700 40/1.2 "Builder Sans"',
                            LetterSpacing: -.01,
                            FontFamily: '"Builder Sans"',
                            FontWeight: "700",
                            FontSize: 40,
                            LineHeight: 1.2
                        },
                        HeadingLarge: {
                            Font: '700 28/1.2 "Builder Sans"',
                            LetterSpacing: -.01,
                            FontFamily: '"Builder Sans"',
                            FontWeight: "700",
                            FontSize: 28,
                            LineHeight: 1.2
                        },
                        HeadingMedium: {
                            Font: '700 24/1.2 "Builder Sans"',
                            LetterSpacing: -.01,
                            FontFamily: '"Builder Sans"',
                            FontWeight: "700",
                            FontSize: 24,
                            LineHeight: 1.2
                        },
                        HeadingSmall: {
                            Font: '700 20/1.2 "Builder Sans"',
                            LetterSpacing: -.01,
                            FontFamily: '"Builder Sans"',
                            FontWeight: "700",
                            FontSize: 20,
                            LineHeight: 1.2
                        },
                        TitleLarge: {
                            Font: '700 16/1.4 "Builder Sans"',
                            LetterSpacing: 0,
                            FontFamily: '"Builder Sans"',
                            FontWeight: "700",
                            FontSize: 16,
                            LineHeight: 1.4
                        },
                        TitleMedium: {
                            Font: '700 14/1.4 "Builder Sans"',
                            LetterSpacing: 0,
                            FontFamily: '"Builder Sans"',
                            FontWeight: "700",
                            FontSize: 14,
                            LineHeight: 1.4
                        },
                        TitleSmall: {
                            Font: '700 12/1.4 "Builder Sans"',
                            LetterSpacing: 0,
                            FontFamily: '"Builder Sans"',
                            FontWeight: "700",
                            FontSize: 12,
                            LineHeight: 1.4
                        },
                        LabelLarge: {
                            Font: '600 16/1 "Builder Sans"',
                            LetterSpacing: 0,
                            FontFamily: '"Builder Sans"',
                            FontWeight: "600",
                            FontSize: 16,
                            LineHeight: 1
                        },
                        LabelMedium: {
                            Font: '600 14/1 "Builder Sans"',
                            LetterSpacing: 0,
                            FontFamily: '"Builder Sans"',
                            FontWeight: "600",
                            FontSize: 14,
                            LineHeight: 1
                        },
                        LabelSmall: {
                            Font: '600 12/1 "Builder Sans"',
                            LetterSpacing: 0,
                            FontFamily: '"Builder Sans"',
                            FontWeight: "600",
                            FontSize: 12,
                            LineHeight: 1
                        },
                        BodyLarge: {
                            Font: '400 16/1.4 "Builder Sans"',
                            LetterSpacing: 0,
                            FontFamily: '"Builder Sans"',
                            FontWeight: "400",
                            FontSize: 16,
                            LineHeight: 1.4
                        },
                        BodyMedium: {
                            Font: '400 14/1.4 "Builder Sans"',
                            LetterSpacing: 0,
                            FontFamily: '"Builder Sans"',
                            FontWeight: "400",
                            FontSize: 14,
                            LineHeight: 1.4
                        },
                        BodySmall: {
                            Font: '400 12/1.4 "Builder Sans"',
                            LetterSpacing: 0,
                            FontFamily: '"Builder Sans"',
                            FontWeight: "400",
                            FontSize: 12,
                            LineHeight: 1.4
                        },
                        CaptionLarge: {
                            Font: '600 14/1.4 "Builder Sans"',
                            LetterSpacing: 0,
                            FontFamily: '"Builder Sans"',
                            FontWeight: "600",
                            FontSize: 14,
                            LineHeight: 1.4
                        },
                        CaptionMedium: {
                            Font: '600 12/1.4 "Builder Sans"',
                            LetterSpacing: 0,
                            FontFamily: '"Builder Sans"',
                            FontWeight: "600",
                            FontSize: 12,
                            LineHeight: 1.4
                        },
                        CaptionSmall: {
                            Font: '600 10/1.4 "Builder Sans"',
                            LetterSpacing: 0,
                            FontFamily: '"Builder Sans"',
                            FontWeight: "600",
                            FontSize: 10,
                            LineHeight: 1.4
                        }
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
                    Ease: {
                        StandardIn: {
                            Bezier: "cubic-bezier(0.8, 0, 0.4, 1)",
                            Raw: [.8, 0, .4, 1]
                        },
                        StandardOut: {
                            Bezier: "cubic-bezier(0.2, 0, 0, 1)",
                            Raw: [.2, 0, 0, 1]
                        },
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
                        }
                    }
                }
            },
            211: function(r, e) {
                "use strict";
                Object.defineProperty(e, "__esModule", {
                    value: !0
                }), e.UIBloxLight = void 0, e.UIBloxLight = {
                    Color: {
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
                            Gray: {
                                Gray_100: "rgb(242, 244, 245)",
                                Gray_200: "rgb(232, 235, 236)",
                                Gray_300: "rgb(222, 225, 227)",
                                Gray_400: "rgb(199, 203, 206)",
                                Gray_500: "rgb(189, 190, 190)",
                                Gray_600: "rgb(145, 146, 147)",
                                Gray_700: "rgb(101, 102, 104)",
                                Gray_800: "rgb(96, 97, 98)",
                                Gray_900: "rgb(57, 59, 61)",
                                Gray_1000: "rgb(35, 37, 39)",
                                Gray_1100: "rgb(25, 27, 29)",
                                Gray_1200: "rgb(17, 18, 20)"
                            }
                        },
                        None: "rgba(0, 0, 0, 0)",
                        Surface: {
                            Surface_0: "rgb(242, 244, 245)",
                            Surface_100: "rgb(222, 225, 227)",
                            Surface_200: "rgb(199, 203, 206)",
                            Surface_300: "rgb(255, 255, 255)"
                        },
                        OverMedia: {
                            OverMedia_0: "rgba(255, 255, 255, 0.9)",
                            OverMedia_100: "rgba(222, 225, 227, 0.9)",
                            OverMedia_200: "rgba(255, 255, 255, 0.9)",
                            OverMedia_300: "rgba(222, 225, 227, 0.9)"
                        },
                        Shift: {
                            Shift_100: "rgba(0, 0, 0, 0.1)",
                            Shift_200: "rgb(189, 190, 190)",
                            Shift_300: "rgba(0, 0, 0, 0.2)",
                            Shift_400: "rgba(0, 0, 0, 0.3)"
                        },
                        Content: {
                            Emphasis: "rgb(57, 59, 61)",
                            Default: "rgb(96, 97, 98)",
                            Muted: "rgba(0, 0, 0, 0.6)",
                            Link: "rgb(112, 160, 255)"
                        },
                        Stroke: {
                            Emphasis: "rgba(57, 59, 61, 0.2)",
                            Default: "rgba(57, 59, 61, 0.15)",
                            Muted: "rgba(57, 59, 61, 0.1)"
                        },
                        System: {
                            Contrast: "rgb(57, 59, 61)",
                            Neutral: "rgb(96, 97, 98)",
                            Emphasis: "rgb(0, 180, 109)",
                            Success: "rgb(0, 180, 109)",
                            Warning: "rgb(242, 186, 42)",
                            Alert: "rgb(247, 75, 82)"
                        },
                        Common: {
                            Shimmer: "rgba(0, 0, 0, 0.1)",
                            Scrim: "rgba(0, 0, 0, 0.3)",
                            Backdrop: "rgba(0, 0, 0, 0.3)",
                            Shadow: "rgba(0, 0, 0, 0.3)",
                            NavigationBar: "rgb(255, 255, 255)",
                            HeavyDivider: "rgba(0, 0, 0, 0.1)"
                        },
                        Selection: {
                            Start: "rgb(189, 190, 190)",
                            End: "rgb(189, 190, 190)"
                        },
                        State: {
                            Idle: "rgba(0, 0, 0, 0)",
                            Hover: "rgba(0, 0, 0, 0.1)",
                            Press: "rgba(0, 0, 0, 0.2)"
                        },
                        ActionEmphasis: {
                            Background: "rgb(0, 180, 109)",
                            Foreground: "rgb(255, 255, 255)",
                            Border: "rgba(0, 0, 0, 0)"
                        },
                        ActionSoftEmphasis: {
                            Background: "rgb(57, 59, 61)",
                            Foreground: "rgb(255, 255, 255)",
                            Border: "rgba(0, 0, 0, 0)"
                        },
                        ActionSubEmphasis: {
                            Background: "rgb(57, 59, 61)",
                            Foreground: "rgb(255, 255, 255)",
                            Border: "rgba(0, 0, 0, 0)"
                        },
                        ActionOverMedia: {
                            Background: "rgb(57, 59, 61)",
                            Foreground: "rgb(255, 255, 255)",
                            Border: "rgba(0, 0, 0, 0)"
                        },
                        ActionStandard: {
                            Background: "rgba(0, 0, 0, 0.2)",
                            Foreground: "rgb(57, 59, 61)",
                            Border: "rgba(0, 0, 0, 0)"
                        },
                        ActionSubtle: {
                            Background: "rgba(0, 0, 0, 0)",
                            Foreground: "rgb(57, 59, 61)",
                            Border: "rgb(96, 97, 98)"
                        },
                        ActionLink: {
                            Background: "rgba(0, 0, 0, 0)",
                            Foreground: "rgb(57, 59, 61)",
                            Border: "rgba(0, 0, 0, 0)"
                        },
                        ActionUtility: {
                            Background: "rgba(0, 0, 0, 0)",
                            Foreground: "rgb(57, 59, 61)",
                            Border: "rgba(0, 0, 0, 0)"
                        },
                        ActionAlert: {
                            Background: "rgba(0, 0, 0, 0)",
                            Foreground: "rgb(247, 75, 82)",
                            Border: "rgb(247, 75, 82)"
                        }
                    },
                    Config: {
                        Theme: {
                            Name: "UIBlox",
                            IsFoundation: "false",
                            IsUIBlox: "true"
                        },
                        ColorMode: {
                            Name: "Light",
                            IsDark: "false",
                            IsLight: "true"
                        },
                        UI: {
                            Interval: 4,
                            Scale: 1,
                            StrokeBase: 1
                        },
                        Text: {
                            Interval: 4,
                            Scale: 1,
                            Font: '"Builder Sans"',
                            NominalScale: 1,
                            InverseScale: 1
                        }
                    },
                    DarkMode: {
                        None: "rgba(0, 0, 0, 0)",
                        Surface: {
                            Surface_0: "rgb(35, 37, 39)",
                            Surface_100: "rgb(25, 27, 29)",
                            Surface_200: "rgb(17, 18, 20)",
                            Surface_300: "rgb(57, 59, 61)"
                        },
                        OverMedia: {
                            OverMedia_0: "rgba(0, 0, 0, 0.7)",
                            OverMedia_100: "rgba(17, 18, 20, 0.7)",
                            OverMedia_200: "rgba(25, 27, 29, 0.7)",
                            OverMedia_300: "rgba(57, 59, 61, 0.7)"
                        },
                        Shift: {
                            Shift_100: "rgba(17, 18, 20, 0.8)",
                            Shift_200: "rgb(101, 102, 104)",
                            Shift_300: "rgba(255, 255, 255, 0.2)",
                            Shift_400: "rgba(255, 255, 255, 0.3)"
                        },
                        Content: {
                            Emphasis: "rgb(255, 255, 255)",
                            Default: "rgb(189, 190, 190)",
                            Muted: "rgba(255, 255, 255, 0.7)",
                            Link: "rgb(112, 160, 255)"
                        },
                        Stroke: {
                            Emphasis: "rgba(255, 255, 255, 0.2)",
                            Default: "rgba(255, 255, 255, 0.15)",
                            Muted: "rgba(255, 255, 255, 0.1)"
                        },
                        System: {
                            Contrast: "rgb(255, 255, 255)",
                            Neutral: "rgb(189, 190, 190)",
                            Emphasis: "rgb(0, 180, 109)",
                            Success: "rgb(0, 180, 109)",
                            Warning: "rgb(242, 186, 42)",
                            Alert: "rgb(247, 75, 82)"
                        },
                        Common: {
                            Shimmer: "rgba(57, 59, 61, 0.5)",
                            Scrim: "rgba(0, 0, 0, 0.5)",
                            Backdrop: "rgba(0, 0, 0, 0.5)",
                            Shadow: "rgba(0, 0, 0, 0.5)",
                            NavigationBar: "rgb(25, 27, 29)",
                            HeavyDivider: "rgba(0, 0, 0, 0.5)"
                        },
                        Selection: {
                            Start: "rgb(255, 255, 255)",
                            End: "rgb(101, 102, 104)"
                        },
                        State: {
                            Idle: "rgba(255, 255, 255, 0)",
                            Hover: "rgba(255, 255, 255, 0.1)",
                            Press: "rgba(0, 0, 0, 0.3)"
                        },
                        ActionEmphasis: {
                            Background: "rgb(0, 180, 109)",
                            Foreground: "rgb(255, 255, 255)",
                            Border: "rgba(0, 0, 0, 0)"
                        },
                        ActionSoftEmphasis: {
                            Background: "rgb(255, 255, 255)",
                            Foreground: "rgb(57, 59, 61)",
                            Border: "rgba(0, 0, 0, 0)"
                        },
                        ActionSubEmphasis: {
                            Background: "rgb(255, 255, 255)",
                            Foreground: "rgb(57, 59, 61)",
                            Border: "rgba(0, 0, 0, 0)"
                        },
                        ActionOverMedia: {
                            Background: "rgb(255, 255, 255)",
                            Foreground: "rgb(57, 59, 61)",
                            Border: "rgba(0, 0, 0, 0)"
                        },
                        ActionStandard: {
                            Background: "rgba(255, 255, 255, 0.2)",
                            Foreground: "rgb(255, 255, 255)",
                            Border: "rgba(0, 0, 0, 0)"
                        },
                        ActionSubtle: {
                            Background: "rgba(0, 0, 0, 0)",
                            Foreground: "rgb(255, 255, 255)",
                            Border: "rgb(255, 255, 255)"
                        },
                        ActionLink: {
                            Background: "rgba(0, 0, 0, 0)",
                            Foreground: "rgb(255, 255, 255)",
                            Border: "rgba(0, 0, 0, 0)"
                        },
                        ActionUtility: {
                            Background: "rgba(0, 0, 0, 0)",
                            Foreground: "rgb(255, 255, 255)",
                            Border: "rgba(0, 0, 0, 0)"
                        },
                        ActionAlert: {
                            Background: "rgba(0, 0, 0, 0)",
                            Foreground: "rgb(247, 75, 82)",
                            Border: "rgb(247, 75, 82)"
                        }
                    },
                    LightMode: {
                        None: "rgba(0, 0, 0, 0)",
                        Surface: {
                            Surface_0: "rgb(242, 244, 245)",
                            Surface_100: "rgb(222, 225, 227)",
                            Surface_200: "rgb(199, 203, 206)",
                            Surface_300: "rgb(255, 255, 255)"
                        },
                        OverMedia: {
                            OverMedia_0: "rgba(255, 255, 255, 0.9)",
                            OverMedia_100: "rgba(222, 225, 227, 0.9)",
                            OverMedia_200: "rgba(255, 255, 255, 0.9)",
                            OverMedia_300: "rgba(222, 225, 227, 0.9)"
                        },
                        Shift: {
                            Shift_100: "rgba(0, 0, 0, 0.1)",
                            Shift_200: "rgb(189, 190, 190)",
                            Shift_300: "rgba(0, 0, 0, 0.2)",
                            Shift_400: "rgba(0, 0, 0, 0.3)"
                        },
                        Content: {
                            Emphasis: "rgb(57, 59, 61)",
                            Default: "rgb(96, 97, 98)",
                            Muted: "rgba(0, 0, 0, 0.6)",
                            Link: "rgb(112, 160, 255)"
                        },
                        Stroke: {
                            Emphasis: "rgba(57, 59, 61, 0.2)",
                            Default: "rgba(57, 59, 61, 0.15)",
                            Muted: "rgba(57, 59, 61, 0.1)"
                        },
                        System: {
                            Contrast: "rgb(57, 59, 61)",
                            Neutral: "rgb(96, 97, 98)",
                            Emphasis: "rgb(0, 180, 109)",
                            Success: "rgb(0, 180, 109)",
                            Warning: "rgb(242, 186, 42)",
                            Alert: "rgb(247, 75, 82)"
                        },
                        Common: {
                            Shimmer: "rgba(0, 0, 0, 0.1)",
                            Scrim: "rgba(0, 0, 0, 0.3)",
                            Shadow: "rgba(0, 0, 0, 0.3)",
                            Backdrop: "rgba(0, 0, 0, 0.3)",
                            NavigationBar: "rgb(255, 255, 255)",
                            HeavyDivider: "rgba(0, 0, 0, 0.1)"
                        },
                        Selection: {
                            Start: "rgb(189, 190, 190)",
                            End: "rgb(189, 190, 190)"
                        },
                        State: {
                            Idle: "rgba(0, 0, 0, 0)",
                            Hover: "rgba(0, 0, 0, 0.1)",
                            Press: "rgba(0, 0, 0, 0.2)"
                        },
                        ActionEmphasis: {
                            Background: "rgb(0, 180, 109)",
                            Foreground: "rgb(255, 255, 255)",
                            Border: "rgba(0, 0, 0, 0)"
                        },
                        ActionSoftEmphasis: {
                            Background: "rgb(57, 59, 61)",
                            Foreground: "rgb(255, 255, 255)",
                            Border: "rgba(0, 0, 0, 0)"
                        },
                        ActionSubEmphasis: {
                            Background: "rgb(57, 59, 61)",
                            Foreground: "rgb(255, 255, 255)",
                            Border: "rgba(0, 0, 0, 0)"
                        },
                        ActionOverMedia: {
                            Background: "rgb(57, 59, 61)",
                            Foreground: "rgb(255, 255, 255)",
                            Border: "rgba(0, 0, 0, 0)"
                        },
                        ActionStandard: {
                            Background: "rgba(0, 0, 0, 0.2)",
                            Foreground: "rgb(57, 59, 61)",
                            Border: "rgba(0, 0, 0, 0)"
                        },
                        ActionSubtle: {
                            Background: "rgba(0, 0, 0, 0)",
                            Foreground: "rgb(57, 59, 61)",
                            Border: "rgb(96, 97, 98)"
                        },
                        ActionLink: {
                            Background: "rgba(0, 0, 0, 0)",
                            Foreground: "rgb(57, 59, 61)",
                            Border: "rgba(0, 0, 0, 0)"
                        },
                        ActionUtility: {
                            Background: "rgba(0, 0, 0, 0)",
                            Foreground: "rgb(57, 59, 61)",
                            Border: "rgba(0, 0, 0, 0)"
                        },
                        ActionAlert: {
                            Background: "rgba(0, 0, 0, 0)",
                            Foreground: "rgb(247, 75, 82)",
                            Border: "rgb(247, 75, 82)"
                        }
                    },
                    Inverse: {
                        None: "rgba(0, 0, 0, 0)",
                        Surface: {
                            Surface_0: "rgb(35, 37, 39)",
                            Surface_100: "rgb(25, 27, 29)",
                            Surface_200: "rgb(17, 18, 20)",
                            Surface_300: "rgb(57, 59, 61)"
                        },
                        OverMedia: {
                            OverMedia_0: "rgba(0, 0, 0, 0.7)",
                            OverMedia_100: "rgba(17, 18, 20, 0.7)",
                            OverMedia_200: "rgba(25, 27, 29, 0.7)",
                            OverMedia_300: "rgba(57, 59, 61, 0.7)"
                        },
                        Shift: {
                            Shift_100: "rgba(17, 18, 20, 0.8)",
                            Shift_200: "rgb(101, 102, 104)",
                            Shift_300: "rgba(255, 255, 255, 0.2)",
                            Shift_400: "rgba(255, 255, 255, 0.3)"
                        },
                        Content: {
                            Emphasis: "rgb(255, 255, 255)",
                            Default: "rgb(189, 190, 190)",
                            Muted: "rgba(255, 255, 255, 0.7)",
                            Link: "rgb(112, 160, 255)"
                        },
                        Stroke: {
                            Emphasis: "rgba(255, 255, 255, 0.2)",
                            Default: "rgba(255, 255, 255, 0.15)",
                            Muted: "rgba(255, 255, 255, 0.1)"
                        },
                        System: {
                            Contrast: "rgb(255, 255, 255)",
                            Neutral: "rgb(189, 190, 190)",
                            Emphasis: "rgb(0, 180, 109)",
                            Success: "rgb(0, 180, 109)",
                            Warning: "rgb(242, 186, 42)",
                            Alert: "rgb(247, 75, 82)"
                        },
                        Common: {
                            Shimmer: "rgba(57, 59, 61, 0.5)",
                            Scrim: "rgba(0, 0, 0, 0.5)",
                            Backdrop: "rgba(0, 0, 0, 0.5)",
                            Shadow: "rgba(0, 0, 0, 0.5)",
                            NavigationBar: "rgb(25, 27, 29)",
                            HeavyDivider: "rgba(0, 0, 0, 0.5)"
                        },
                        Selection: {
                            Start: "rgb(255, 255, 255)",
                            End: "rgb(101, 102, 104)"
                        },
                        State: {
                            Idle: "rgba(255, 255, 255, 0)",
                            Hover: "rgba(255, 255, 255, 0.1)",
                            Press: "rgba(0, 0, 0, 0.3)"
                        },
                        ActionEmphasis: {
                            Background: "rgb(0, 180, 109)",
                            Foreground: "rgb(255, 255, 255)",
                            Border: "rgba(0, 0, 0, 0)"
                        },
                        ActionSoftEmphasis: {
                            Background: "rgb(255, 255, 255)",
                            Foreground: "rgb(57, 59, 61)",
                            Border: "rgba(0, 0, 0, 0)"
                        },
                        ActionSubEmphasis: {
                            Background: "rgb(255, 255, 255)",
                            Foreground: "rgb(57, 59, 61)",
                            Border: "rgba(0, 0, 0, 0)"
                        },
                        ActionOverMedia: {
                            Background: "rgb(255, 255, 255)",
                            Foreground: "rgb(57, 59, 61)",
                            Border: "rgba(0, 0, 0, 0)"
                        },
                        ActionStandard: {
                            Background: "rgba(255, 255, 255, 0.2)",
                            Foreground: "rgb(255, 255, 255)",
                            Border: "rgba(0, 0, 0, 0)"
                        },
                        ActionSubtle: {
                            Background: "rgba(0, 0, 0, 0)",
                            Foreground: "rgb(255, 255, 255)",
                            Border: "rgb(255, 255, 255)"
                        },
                        ActionLink: {
                            Background: "rgba(0, 0, 0, 0)",
                            Foreground: "rgb(255, 255, 255)",
                            Border: "rgba(0, 0, 0, 0)"
                        },
                        ActionUtility: {
                            Background: "rgba(0, 0, 0, 0)",
                            Foreground: "rgb(255, 255, 255)",
                            Border: "rgba(0, 0, 0, 0)"
                        },
                        ActionAlert: {
                            Background: "rgba(0, 0, 0, 0)",
                            Foreground: "rgb(247, 75, 82)",
                            Border: "rgb(247, 75, 82)"
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
                    Padding: {
                        None: 0,
                        XXSmall: 2,
                        XSmall: 4,
                        Small: 8,
                        Medium: 12,
                        Large: 16,
                        XLarge: 20,
                        XXLarge: 24
                    },
                    Margin: {
                        None: 0,
                        Small: 20,
                        Medium: 24,
                        Large: 48
                    },
                    Gap: {
                        None: 0,
                        XXSmall: 2,
                        XSmall: 4,
                        Small: 8,
                        Medium: 12,
                        Large: 16,
                        XLarge: 20,
                        XXLarge: 24
                    },
                    Gutter: {
                        None: 0,
                        Small: 8,
                        Medium: 12,
                        Large: 16,
                        XLarge: 20,
                        XXLarge: 24
                    },
                    Radius: {
                        None: 0,
                        XSmall: 2,
                        Small: 4,
                        Medium: 8,
                        Large: 16,
                        Circle: 9999
                    },
                    Stroke: {
                        None: 0,
                        Thin: .5,
                        Standard: 1,
                        Thick: 1.5,
                        Thicker: 3
                    },
                    InputSize: {
                        XSmall: 24,
                        Small: 32,
                        Medium: 40,
                        Large: 48
                    },
                    IconSize: {
                        XSmall: 12,
                        Small: 16,
                        Medium: 20,
                        Large: 24,
                        XLarge: 28
                    },
                    ToggleSize: {
                        XSmall: 16,
                        Small: 20,
                        Medium: 24,
                        Large: 28
                    },
                    LineHeight: {
                        LineHeight_100: 1,
                        LineHeight_120: 1.2,
                        LineHeight_130: 1.3,
                        LineHeight_140: 1.4
                    },
                    LetterSpacing: {
                        Tight: -.01,
                        Default: 0,
                        Loose: .01
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
                    Typography: {
                        DisplayLarge: {
                            Font: '700 80/1.2 "Builder Sans"',
                            LetterSpacing: -.01,
                            FontFamily: '"Builder Sans"',
                            FontWeight: "700",
                            FontSize: 80,
                            LineHeight: 1.2
                        },
                        DisplayMedium: {
                            Font: '700 56/1.2 "Builder Sans"',
                            LetterSpacing: -.01,
                            FontFamily: '"Builder Sans"',
                            FontWeight: "700",
                            FontSize: 56,
                            LineHeight: 1.2
                        },
                        DisplaySmall: {
                            Font: '700 40/1.2 "Builder Sans"',
                            LetterSpacing: -.01,
                            FontFamily: '"Builder Sans"',
                            FontWeight: "700",
                            FontSize: 40,
                            LineHeight: 1.2
                        },
                        HeadingLarge: {
                            Font: '700 28/1.2 "Builder Sans"',
                            LetterSpacing: -.01,
                            FontFamily: '"Builder Sans"',
                            FontWeight: "700",
                            FontSize: 28,
                            LineHeight: 1.2
                        },
                        HeadingMedium: {
                            Font: '700 24/1.2 "Builder Sans"',
                            LetterSpacing: -.01,
                            FontFamily: '"Builder Sans"',
                            FontWeight: "700",
                            FontSize: 24,
                            LineHeight: 1.2
                        },
                        HeadingSmall: {
                            Font: '700 20/1.2 "Builder Sans"',
                            LetterSpacing: -.01,
                            FontFamily: '"Builder Sans"',
                            FontWeight: "700",
                            FontSize: 20,
                            LineHeight: 1.2
                        },
                        TitleLarge: {
                            Font: '700 16/1.4 "Builder Sans"',
                            LetterSpacing: 0,
                            FontFamily: '"Builder Sans"',
                            FontWeight: "700",
                            FontSize: 16,
                            LineHeight: 1.4
                        },
                        TitleMedium: {
                            Font: '700 14/1.4 "Builder Sans"',
                            LetterSpacing: 0,
                            FontFamily: '"Builder Sans"',
                            FontWeight: "700",
                            FontSize: 14,
                            LineHeight: 1.4
                        },
                        TitleSmall: {
                            Font: '700 12/1.4 "Builder Sans"',
                            LetterSpacing: 0,
                            FontFamily: '"Builder Sans"',
                            FontWeight: "700",
                            FontSize: 12,
                            LineHeight: 1.4
                        },
                        LabelLarge: {
                            Font: '600 16/1 "Builder Sans"',
                            LetterSpacing: 0,
                            FontFamily: '"Builder Sans"',
                            FontWeight: "600",
                            FontSize: 16,
                            LineHeight: 1
                        },
                        LabelMedium: {
                            Font: '600 14/1 "Builder Sans"',
                            LetterSpacing: 0,
                            FontFamily: '"Builder Sans"',
                            FontWeight: "600",
                            FontSize: 14,
                            LineHeight: 1
                        },
                        LabelSmall: {
                            Font: '600 12/1 "Builder Sans"',
                            LetterSpacing: 0,
                            FontFamily: '"Builder Sans"',
                            FontWeight: "600",
                            FontSize: 12,
                            LineHeight: 1
                        },
                        BodyLarge: {
                            Font: '400 16/1.4 "Builder Sans"',
                            LetterSpacing: 0,
                            FontFamily: '"Builder Sans"',
                            FontWeight: "400",
                            FontSize: 16,
                            LineHeight: 1.4
                        },
                        BodyMedium: {
                            Font: '400 14/1.4 "Builder Sans"',
                            LetterSpacing: 0,
                            FontFamily: '"Builder Sans"',
                            FontWeight: "400",
                            FontSize: 14,
                            LineHeight: 1.4
                        },
                        BodySmall: {
                            Font: '400 12/1.4 "Builder Sans"',
                            LetterSpacing: 0,
                            FontFamily: '"Builder Sans"',
                            FontWeight: "400",
                            FontSize: 12,
                            LineHeight: 1.4
                        },
                        CaptionLarge: {
                            Font: '600 14/1.4 "Builder Sans"',
                            LetterSpacing: 0,
                            FontFamily: '"Builder Sans"',
                            FontWeight: "600",
                            FontSize: 14,
                            LineHeight: 1.4
                        },
                        CaptionMedium: {
                            Font: '600 12/1.4 "Builder Sans"',
                            LetterSpacing: 0,
                            FontFamily: '"Builder Sans"',
                            FontWeight: "600",
                            FontSize: 12,
                            LineHeight: 1.4
                        },
                        CaptionSmall: {
                            Font: '600 10/1.4 "Builder Sans"',
                            LetterSpacing: 0,
                            FontFamily: '"Builder Sans"',
                            FontWeight: "600",
                            FontSize: 10,
                            LineHeight: 1.4
                        }
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
                    Ease: {
                        StandardIn: {
                            Bezier: "cubic-bezier(0.8, 0, 0.4, 1)",
                            Raw: [.8, 0, .4, 1]
                        },
                        StandardOut: {
                            Bezier: "cubic-bezier(0.2, 0, 0, 1)",
                            Raw: [.2, 0, 0, 1]
                        },
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
                        }
                    }
                }
            },
            942: function(r) {
                function e(r) {
                    return r && "undefined" != typeof Symbol && r.constructor === Symbol ? "symbol" : typeof r
                }!
                /*!
                	Copyright (c) 2018 Jed Watson.
                	Licensed under the MIT License (MIT), see
                	http://jedwatson.github.io/classnames
                */
                function() {
                    "use strict";
                    var t = {}.hasOwnProperty;

                    function n() {
                        for (var r = "", i = 0; i < arguments.length; i++) {
                            var a = arguments[i];
                            a && (r = o(r, function(r) {
                                if ("string" == typeof r || "number" == typeof r) return r;
                                if ((void 0 === r ? "undefined" : e(r)) !== "object") return "";
                                if (Array.isArray(r)) return n.apply(null, r);
                                if (r.toString !== Object.prototype.toString && !r.toString.toString().includes("[native code]")) return r.toString();
                                var i = "";
                                for (var a in r) t.call(r, a) && r[a] && (i = o(i, a));
                                return i
                            }(a)))
                        }
                        return r
                    }

                    function o(r, e) {
                        return e ? r ? r + " " + e : r + e : r
                    }
                    r.exports ? (n.default = n, r.exports = n) : "function" == typeof define && "object" === e(define.amd) && define.amd ? define("classnames", [], function() {
                        return n
                    }) : window.classNames = n
                }()
            }
        },
        e = {};

    function t(n) {
        var o = e[n];
        if (void 0 !== o) return o.exports;
        var i = e[n] = {
            exports: {}
        };
        return r[n].call(i.exports, i, i.exports, t), i.exports
    }
    t.n = function(r) {
            var e = r && r.__esModule ? function() {
                return r.default
            } : function() {
                return r
            };
            return t.d(e, {
                a: e
            }), e
        }, t.d = function(r, e) {
            for (var n in e) t.o(e, n) && !t.o(r, n) && Object.defineProperty(r, n, {
                enumerable: !0,
                get: e[n]
            })
        }, t.o = function(r, e) {
            return Object.prototype.hasOwnProperty.call(r, e)
        }, t.r = function(r) {
            "undefined" != typeof Symbol && Symbol.toStringTag && Object.defineProperty(r, Symbol.toStringTag, {
                value: "Module"
            }), Object.defineProperty(r, "__esModule", {
                value: !0
            })
        }, t.rv = function() {
            return "1.5.7"
        }, t.ruid = "bundler=rspack@1.5.7",
        function() {
            "use strict";
            var r, e, n, o, i = {};
            t.r(i), t.d(i, {
                Branch: function() {
                    return X
                },
                DismissableLayer: function() {
                    return R
                },
                DismissableLayerBranch: function() {
                    return x
                },
                Root: function() {
                    return N
                }
            });
            var a = {};
            t.r(a), t.d(a, {
                FocusGuards: function() {
                    return U
                },
                Root: function() {
                    return K
                },
                useFocusGuards: function() {
                    return q
                }
            });
            var g = {};
            t.r(g), t.d(g, {
                TranslationProvider: function() {
                    return rs
                },
                makeActionCreator: function() {
                    return rT
                },
                queryClient: function() {
                    return ex
                },
                renderWithErrorBoundary: function() {
                    return eR
                },
                useDebounce: function() {
                    return rI
                },
                useInterval: function() {
                    return rW
                },
                useLocalStorage: function() {
                    return rD
                },
                useOnClickOutside: function() {
                    return rC
                },
                usePrevious: function() {
                    return rR
                },
                useTheme: function() {
                    return rX
                },
                useTokens: function() {
                    return rU
                },
                useTranslation: function() {
                    return rd
                },
                useWindowActiveState: function() {
                    return rG
                },
                withComponentStatus: function() {
                    return rM
                },
                withTranslations: function() {
                    return rF
                }
            });
            var u = {};
            t.r(u), t.d(u, {
                TranslationProvider: function() {
                    return rs
                },
                makeActionCreator: function() {
                    return rT
                },
                queryClient: function() {
                    return ex
                },
                renderWithErrorBoundary: function() {
                    return eR
                },
                useDebounce: function() {
                    return rI
                },
                useInterval: function() {
                    return rW
                },
                useLocalStorage: function() {
                    return rD
                },
                useOnClickOutside: function() {
                    return rC
                },
                usePrevious: function() {
                    return rR
                },
                useTheme: function() {
                    return rX
                },
                useTokens: function() {
                    return rU
                },
                useTranslation: function() {
                    return rd
                },
                useWindowActiveState: function() {
                    return rG
                },
                withComponentStatus: function() {
                    return rM
                },
                withTranslations: function() {
                    return rF
                }
            });
            var c = window.React,
                b = t.n(c);

            function l(r, e) {
                var t = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {},
                    n = t.checkForDefaultPrevented,
                    o = void 0 === n || n;
                return function(t) {
                    if (null == r || r(t), !1 === o || !t.defaultPrevented) return null == e ? void 0 : e(t)
                }
            }
            var s = window.ReactDOM;

            function d(r, e) {
                (null == e || e > r.length) && (e = r.length);
                for (var t = 0, n = Array(e); t < e; t++) n[t] = r[t];
                return n
            }

            function _(r, e) {
                if ("function" == typeof r) return r(e);
                null != r && (r.current = e)
            }

            function f() {
                for (var r = arguments.length, e = Array(r), t = 0; t < r; t++) e[t] = arguments[t];
                return function(r) {
                    var t = !1,
                        n = e.map(function(e) {
                            var n = _(e, r);
                            return t || "function" != typeof n || (t = !0), n
                        });
                    if (t) return function() {
                        for (var r = 0; r < n.length; r++) {
                            var t = n[r];
                            "function" == typeof t ? t() : _(e[r], null)
                        }
                    }
                }
            }

            function S() {
                for (var r = arguments.length, e = Array(r), t = 0; t < r; t++) e[t] = arguments[t];
                return c.useCallback(f.apply(void 0, function(r) {
                    if (Array.isArray(r)) return d(r)
                }(e) || function(r) {
                    if ("undefined" != typeof Symbol && null != r[Symbol.iterator] || null != r["@@iterator"]) return Array.from(r)
                }(e) || function(r, e) {
                    if (r) {
                        if ("string" == typeof r) return d(r, void 0);
                        var t = Object.prototype.toString.call(r).slice(8, -1);
                        if ("Object" === t && r.constructor && (t = r.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                        if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return d(r, e)
                    }
                }(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()), e)
            }
            var p = window.ReactJSX;

            function h(r, e) {
                (null == e || e > r.length) && (e = r.length);
                for (var t = 0, n = Array(e); t < e; t++) n[t] = r[t];
                return n
            }

            function y(r) {
                for (var e = 1; e < arguments.length; e++) {
                    var t = null != arguments[e] ? arguments[e] : {},
                        n = Object.keys(t);
                    "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(t).filter(function(r) {
                        return Object.getOwnPropertyDescriptor(t, r).enumerable
                    }))), n.forEach(function(e) {
                        var n;
                        n = t[e], e in r ? Object.defineProperty(r, e, {
                            value: n,
                            enumerable: !0,
                            configurable: !0,
                            writable: !0
                        }) : r[e] = n
                    })
                }
                return r
            }

            function m(r, e) {
                return e = null != e ? e : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(r, Object.getOwnPropertyDescriptors(e)) : (function(r, e) {
                    var t = Object.keys(r);
                    if (Object.getOwnPropertySymbols) {
                        var n = Object.getOwnPropertySymbols(r);
                        t.push.apply(t, n)
                    }
                    return t
                })(Object(e)).forEach(function(t) {
                    Object.defineProperty(r, t, Object.getOwnPropertyDescriptor(e, t))
                }), r
            }

            function v(r, e) {
                if (null == r) return {};
                var t, n, o = function(r, e) {
                    if (null == r) return {};
                    var t, n, o = {},
                        i = Object.keys(r);
                    for (n = 0; n < i.length; n++) t = i[n], e.indexOf(t) >= 0 || (o[t] = r[t]);
                    return o
                }(r, e);
                if (Object.getOwnPropertySymbols) {
                    var i = Object.getOwnPropertySymbols(r);
                    for (n = 0; n < i.length; n++) t = i[n], !(e.indexOf(t) >= 0) && Object.prototype.propertyIsEnumerable.call(r, t) && (o[t] = r[t])
                }
                return o
            }

            function F(r) {
                return function(r) {
                    if (Array.isArray(r)) return h(r)
                }(r) || function(r) {
                    if ("undefined" != typeof Symbol && null != r[Symbol.iterator] || null != r["@@iterator"]) return Array.from(r)
                }(r) || function(r, e) {
                    if (r) {
                        if ("string" == typeof r) return h(r, void 0);
                        var t = Object.prototype.toString.call(r).slice(8, -1);
                        if ("Object" === t && r.constructor && (t = r.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                        if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return h(r, e)
                    }
                }(r) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var B = Symbol("radix.slottable");

            function k(r) {
                return c.isValidElement(r) && "function" == typeof r.type && "__radixId" in r.type && r.type.__radixId === B
            }

            function O(r, e, t) {
                return e in r ? Object.defineProperty(r, e, {
                    value: t,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : r[e] = t, r
            }

            function L(r) {
                for (var e = 1; e < arguments.length; e++) {
                    var t = null != arguments[e] ? arguments[e] : {},
                        n = Object.keys(t);
                    "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(t).filter(function(r) {
                        return Object.getOwnPropertyDescriptor(t, r).enumerable
                    }))), n.forEach(function(e) {
                        O(r, e, t[e])
                    })
                }
                return r
            }

            function z(r, e) {
                return e = null != e ? e : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(r, Object.getOwnPropertyDescriptors(e)) : (function(r, e) {
                    var t = Object.keys(r);
                    if (Object.getOwnPropertySymbols) {
                        var n = Object.getOwnPropertySymbols(r);
                        t.push.apply(t, n)
                    }
                    return t
                })(Object(e)).forEach(function(t) {
                    Object.defineProperty(r, t, Object.getOwnPropertyDescriptor(e, t))
                }), r
            }
            var w = ["a", "button", "div", "form", "h2", "h3", "img", "input", "label", "li", "nav", "ol", "p", "span", "svg", "ul"].reduce(function(r, e) {
                var t, n, o, i, a, g = (t = o = "Primitive.".concat(e), (n = c.forwardRef(function(r, e) {
                        var t = r.children,
                            n = v(r, ["children"]);
                        if (c.isValidElement(t)) {
                            var o, i, a, g, u, b = (u = (g = null == (i = Object.getOwnPropertyDescriptor((o = t).props, "ref")) ? void 0 : i.get) && "isReactWarning" in g && g.isReactWarning) ? o.ref : (u = (g = null == (a = Object.getOwnPropertyDescriptor(o, "ref")) ? void 0 : a.get) && "isReactWarning" in g && g.isReactWarning) ? o.props.ref : o.props.ref || o.ref,
                                l = function(r, e) {
                                    var t = y({}, e);
                                    for (var n in e) ! function(n) {
                                        var o = r[n],
                                            i = e[n];
                                        /^on[A-Z]/.test(n) ? o && i ? t[n] = function() {
                                            for (var r = arguments.length, e = Array(r), t = 0; t < r; t++) e[t] = arguments[t];
                                            i.apply(void 0, F(e)), o.apply(void 0, F(e))
                                        } : o && (t[n] = o) : "style" === n ? t[n] = y({}, o, i) : "className" === n && (t[n] = [o, i].filter(Boolean).join(" "))
                                    }(n);
                                    return y({}, r, t)
                                }(n, t.props);
                            return t.type !== c.Fragment && (l.ref = e ? f(e, b) : b), c.cloneElement(t, l)
                        }
                        return c.Children.count(t) > 1 ? c.Children.only(null) : null
                    })).displayName = "".concat(t, ".SlotClone"), i = n, (a = c.forwardRef(function(r, e) {
                        var t = r.children,
                            n = v(r, ["children"]),
                            o = c.Children.toArray(t),
                            a = o.find(k);
                        if (a) {
                            var g = a.props.children,
                                u = o.map(function(r) {
                                    return r !== a ? r : c.Children.count(g) > 1 ? c.Children.only(null) : c.isValidElement(g) ? g.props.children : null
                                });
                            return (0, p.jsx)(i, m(y({}, n), {
                                ref: e,
                                children: c.isValidElement(g) ? c.cloneElement(g, void 0, u) : null
                            }))
                        }
                        return (0, p.jsx)(i, m(y({}, n), {
                            ref: e,
                            children: t
                        }))
                    })).displayName = "".concat(o, ".Slot"), a),
                    u = c.forwardRef(function(r, t) {
                        var n = r.asChild,
                            o = function(r, e) {
                                if (null == r) return {};
                                var t, n, o = function(r, e) {
                                    if (null == r) return {};
                                    var t, n, o = {},
                                        i = Object.keys(r);
                                    for (n = 0; n < i.length; n++) t = i[n], e.indexOf(t) >= 0 || (o[t] = r[t]);
                                    return o
                                }(r, e);
                                if (Object.getOwnPropertySymbols) {
                                    var i = Object.getOwnPropertySymbols(r);
                                    for (n = 0; n < i.length; n++) t = i[n], !(e.indexOf(t) >= 0) && Object.prototype.propertyIsEnumerable.call(r, t) && (o[t] = r[t])
                                }
                                return o
                            }(r, ["asChild"]),
                            i = n ? g : e;
                        return "undefined" != typeof window && (window[Symbol.for("radix-ui")] = !0), (0, p.jsx)(i, z(L({}, o), {
                            ref: t
                        }))
                    });
                return u.displayName = "Primitive.".concat(e), z(L({}, r), O({}, e, u))
            }, {});

            function E(r, e) {
                (null == e || e > r.length) && (e = r.length);
                for (var t = 0, n = Array(e); t < e; t++) n[t] = r[t];
                return n
            }

            function P(r) {
                var e = c.useRef(r);
                return c.useEffect(function() {
                    e.current = r
                }), c.useMemo(function() {
                    return function() {
                        for (var r, t = arguments.length, n = Array(t), o = 0; o < t; o++) n[o] = arguments[o];
                        return null == (r = e.current) ? void 0 : r.call.apply(r, [e].concat(function(r) {
                            if (Array.isArray(r)) return E(r)
                        }(n) || function(r) {
                            if ("undefined" != typeof Symbol && null != r[Symbol.iterator] || null != r["@@iterator"]) return Array.from(r)
                        }(n) || function(r, e) {
                            if (r) {
                                if ("string" == typeof r) return E(r, void 0);
                                var t = Object.prototype.toString.call(r).slice(8, -1);
                                if ("Object" === t && r.constructor && (t = r.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                                if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return E(r, e)
                            }
                        }(n) || function() {
                            throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                        }()))
                    }
                }, [])
            }

            function A(r, e) {
                (null == e || e > r.length) && (e = r.length);
                for (var t = 0, n = Array(e); t < e; t++) n[t] = r[t];
                return n
            }

            function M(r) {
                for (var e = 1; e < arguments.length; e++) {
                    var t = null != arguments[e] ? arguments[e] : {},
                        n = Object.keys(t);
                    "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(t).filter(function(r) {
                        return Object.getOwnPropertyDescriptor(t, r).enumerable
                    }))), n.forEach(function(e) {
                        var n;
                        n = t[e], e in r ? Object.defineProperty(r, e, {
                            value: n,
                            enumerable: !0,
                            configurable: !0,
                            writable: !0
                        }) : r[e] = n
                    })
                }
                return r
            }

            function j(r, e) {
                return e = null != e ? e : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(r, Object.getOwnPropertyDescriptors(e)) : (function(r, e) {
                    var t = Object.keys(r);
                    if (Object.getOwnPropertySymbols) {
                        var n = Object.getOwnPropertySymbols(r);
                        t.push.apply(t, n)
                    }
                    return t
                })(Object(e)).forEach(function(t) {
                    Object.defineProperty(r, t, Object.getOwnPropertyDescriptor(e, t))
                }), r
            }

            function T(r, e) {
                return function(r) {
                    if (Array.isArray(r)) return r
                }(r) || function(r, e) {
                    var t, n, o = null == r ? null : "undefined" != typeof Symbol && r[Symbol.iterator] || r["@@iterator"];
                    if (null != o) {
                        var i = [],
                            a = !0,
                            g = !1;
                        try {
                            for (o = o.call(r); !(a = (t = o.next()).done) && (i.push(t.value), !e || i.length !== e); a = !0);
                        } catch (r) {
                            g = !0, n = r
                        } finally {
                            try {
                                a || null == o.return || o.return()
                            } finally {
                                if (g) throw n
                            }
                        }
                        return i
                    }
                }(r, e) || W(r, e) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function I(r) {
                return function(r) {
                    if (Array.isArray(r)) return A(r)
                }(r) || function(r) {
                    if ("undefined" != typeof Symbol && null != r[Symbol.iterator] || null != r["@@iterator"]) return Array.from(r)
                }(r) || W(r) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function W(r, e) {
                if (r) {
                    if ("string" == typeof r) return A(r, e);
                    var t = Object.prototype.toString.call(r).slice(8, -1);
                    if ("Object" === t && r.constructor && (t = r.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                    if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return A(r, e)
                }
            }
            var D = "dismissableLayer.update",
                C = c.createContext({
                    layers: new Set,
                    layersWithOutsidePointerEventsDisabled: new Set,
                    branches: new Set
                }),
                R = c.forwardRef(function(e, t) {
                    var n, o, i = e.disableOutsidePointerEvents,
                        a = void 0 !== i && i,
                        g = e.onEscapeKeyDown,
                        u = e.onPointerDownOutside,
                        b = e.onFocusOutside,
                        s = e.onInteractOutside,
                        d = e.onDismiss,
                        _ = function(r, e) {
                            if (null == r) return {};
                            var t, n, o = function(r, e) {
                                if (null == r) return {};
                                var t, n, o = {},
                                    i = Object.keys(r);
                                for (n = 0; n < i.length; n++) t = i[n], e.indexOf(t) >= 0 || (o[t] = r[t]);
                                return o
                            }(r, e);
                            if (Object.getOwnPropertySymbols) {
                                var i = Object.getOwnPropertySymbols(r);
                                for (n = 0; n < i.length; n++) t = i[n], !(e.indexOf(t) >= 0) && Object.prototype.propertyIsEnumerable.call(r, t) && (o[t] = r[t])
                            }
                            return o
                        }(e, ["disableOutsidePointerEvents", "onEscapeKeyDown", "onPointerDownOutside", "onFocusOutside", "onInteractOutside", "onDismiss"]),
                        f = c.useContext(C),
                        h = T(c.useState(null), 2),
                        y = h[0],
                        m = h[1],
                        v = null != (o = null == y ? void 0 : y.ownerDocument) ? o : null == (n = globalThis) ? void 0 : n.document,
                        F = T(c.useState({}), 2)[1],
                        B = S(t, function(r) {
                            return m(r)
                        }),
                        k = Array.from(f.layers),
                        O = T(I(f.layersWithOutsidePointerEventsDisabled).slice(-1), 1)[0],
                        L = k.indexOf(O),
                        z = y ? k.indexOf(y) : -1,
                        E = f.layersWithOutsidePointerEventsDisabled.size > 0,
                        A = z >= L,
                        W = function(r) {
                            var e, t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : null == (e = globalThis) ? void 0 : e.document,
                                n = P(r),
                                o = c.useRef(!1),
                                i = c.useRef(function() {});
                            return c.useEffect(function() {
                                var r = function(r) {
                                        if (r.target && !o.current) {
                                            var e = function() {
                                                    G("dismissableLayer.pointerDownOutside", n, a, {
                                                        discrete: !0
                                                    })
                                                },
                                                a = {
                                                    originalEvent: r
                                                };
                                            "touch" === r.pointerType ? (t.removeEventListener("click", i.current), i.current = e, t.addEventListener("click", i.current, {
                                                once: !0
                                            })) : e()
                                        } else t.removeEventListener("click", i.current);
                                        o.current = !1
                                    },
                                    e = window.setTimeout(function() {
                                        t.addEventListener("pointerdown", r)
                                    }, 0);
                                return function() {
                                    window.clearTimeout(e), t.removeEventListener("pointerdown", r), t.removeEventListener("click", i.current)
                                }
                            }, [t, n]), {
                                onPointerDownCapture: function() {
                                    return o.current = !0
                                }
                            }
                        }(function(r) {
                            var e = r.target,
                                t = I(f.branches).some(function(r) {
                                    return r.contains(e)
                                });
                            A && !t && (null == u || u(r), null == s || s(r), r.defaultPrevented || null == d || d())
                        }, v),
                        R = function(r) {
                            var e, t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : null == (e = globalThis) ? void 0 : e.document,
                                n = P(r),
                                o = c.useRef(!1);
                            return c.useEffect(function() {
                                var r = function(r) {
                                    r.target && !o.current && G("dismissableLayer.focusOutside", n, {
                                        originalEvent: r
                                    }, {
                                        discrete: !1
                                    })
                                };
                                return t.addEventListener("focusin", r),
                                    function() {
                                        return t.removeEventListener("focusin", r)
                                    }
                            }, [t, n]), {
                                onFocusCapture: function() {
                                    return o.current = !0
                                },
                                onBlurCapture: function() {
                                    return o.current = !1
                                }
                            }
                        }(function(r) {
                            var e = r.target;
                            !I(f.branches).some(function(r) {
                                return r.contains(e)
                            }) && (null == b || b(r), null == s || s(r), r.defaultPrevented || null == d || d())
                        }, v);
                    return ! function(r) {
                        var e, t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : null == (e = globalThis) ? void 0 : e.document,
                            n = P(r);
                        c.useEffect(function() {
                            var r = function(r) {
                                "Escape" === r.key && n(r)
                            };
                            return t.addEventListener("keydown", r, {
                                    capture: !0
                                }),
                                function() {
                                    return t.removeEventListener("keydown", r, {
                                        capture: !0
                                    })
                                }
                        }, [n, t])
                    }(function(r) {
                        z === f.layers.size - 1 && (null == g || g(r), !r.defaultPrevented && d && (r.preventDefault(), d()))
                    }, v), c.useEffect(function() {
                        if (y) return a && (0 === f.layersWithOutsidePointerEventsDisabled.size && (r = v.body.style.pointerEvents, v.body.style.pointerEvents = "none"), f.layersWithOutsidePointerEventsDisabled.add(y)), f.layers.add(y), H(),
                            function() {
                                a && 1 === f.layersWithOutsidePointerEventsDisabled.size && (v.body.style.pointerEvents = r)
                            }
                    }, [y, v, a, f]), c.useEffect(function() {
                        return function() {
                            y && (f.layers.delete(y), f.layersWithOutsidePointerEventsDisabled.delete(y), H())
                        }
                    }, [y, f]), c.useEffect(function() {
                        var r = function() {
                            return F({})
                        };
                        return document.addEventListener(D, r),
                            function() {
                                return document.removeEventListener(D, r)
                            }
                    }, []), (0, p.jsx)(w.div, j(M({}, _), {
                        ref: B,
                        style: M({
                            pointerEvents: E ? A ? "auto" : "none" : void 0
                        }, e.style),
                        onFocusCapture: l(e.onFocusCapture, R.onFocusCapture),
                        onBlurCapture: l(e.onBlurCapture, R.onBlurCapture),
                        onPointerDownCapture: l(e.onPointerDownCapture, W.onPointerDownCapture)
                    }))
                });
            R.displayName = "DismissableLayer";
            var x = c.forwardRef(function(r, e) {
                var t = c.useContext(C),
                    n = c.useRef(null),
                    o = S(e, n);
                return c.useEffect(function() {
                    var r = n.current;
                    if (r) return t.branches.add(r),
                        function() {
                            t.branches.delete(r)
                        }
                }, [t.branches]), (0, p.jsx)(w.div, j(M({}, r), {
                    ref: o
                }))
            });

            function H() {
                var r = new CustomEvent(D);
                document.dispatchEvent(r)
            }

            function G(r, e, t, n) {
                var o = n.discrete,
                    i = t.originalEvent.target,
                    a = new CustomEvent(r, {
                        bubbles: !1,
                        cancelable: !0,
                        detail: t
                    });
                (e && i.addEventListener(r, e, {
                    once: !0
                }), o) ? i && s.flushSync(function() {
                    return i.dispatchEvent(a)
                }): i.dispatchEvent(a)
            }
            x.displayName = "DismissableLayerBranch";
            var N = R,
                X = x,
                Y = 0;

            function U(r) {
                return q(), r.children
            }

            function q() {
                c.useEffect(function() {
                    var r, e, t = document.querySelectorAll("[data-radix-focus-guard]");
                    return document.body.insertAdjacentElement("afterbegin", null != (r = t[0]) ? r : $()), document.body.insertAdjacentElement("beforeend", null != (e = t[1]) ? e : $()), Y++,
                        function() {
                            1 === Y && document.querySelectorAll("[data-radix-focus-guard]").forEach(function(r) {
                                return r.remove()
                            }), Y--
                        }
                }, [])
            }

            function $() {
                var r = document.createElement("span");
                return r.setAttribute("data-radix-focus-guard", ""), r.tabIndex = 0, r.style.outline = "none", r.style.opacity = "0", r.style.position = "fixed", r.style.pointerEvents = "none", r
            }
            var K = U;

            function V(r, e) {
                (null == e || e > r.length) && (e = r.length);
                for (var t = 0, n = Array(e); t < e; t++) n[t] = r[t];
                return n
            }
            var J = function(r, e) {
                    var t = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : window;
                    if ("string" == typeof r) t[r] = e;
                    else {
                        var n = function(r) {
                                if (Array.isArray(r)) return V(r)
                            }(r) || function(r) {
                                if ("undefined" != typeof Symbol && null != r[Symbol.iterator] || null != r["@@iterator"]) return Array.from(r)
                            }(r) || function(r, e) {
                                if (r) {
                                    if ("string" == typeof r) return V(r, void 0);
                                    var t = Object.prototype.toString.call(r).slice(8, -1);
                                    if ("Object" === t && r.constructor && (t = r.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                                    if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return V(r, e)
                                }
                            }(r) || function() {
                                throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                            }(),
                            o = n.pop(),
                            i = t,
                            a = !0,
                            g = !1,
                            u = void 0;
                        try {
                            for (var c, b = n[Symbol.iterator](); !(a = (c = b.next()).done); a = !0) {
                                var l, s = c.value;
                                null != (l = i)[s] || (l[s] = {}), i = i[s]
                            }
                        } catch (r) {
                            g = !0, u = r
                        } finally {
                            try {
                                a || null == b.return || b.return()
                            } finally {
                                if (g) throw u
                            }
                        }
                        i[o] = e
                    }
                },
                Q = function(r, e) {
                    J(r, e)
                },
                Z = window.TanstackQuery,
                rr = window.Roblox["core-scripts"].intl.intl,
                re = t.n(rr),
                rt = window.Roblox["core-scripts"].intl.translation;

            function rn(r, e) {
                (null == e || e > r.length) && (e = r.length);
                for (var t = 0, n = Array(e); t < e; t++) n[t] = r[t];
                return n
            }

            function ro(r) {
                return function(r) {
                    if (Array.isArray(r)) return rn(r)
                }(r) || function(r) {
                    if ("undefined" != typeof Symbol && null != r[Symbol.iterator] || null != r["@@iterator"]) return Array.from(r)
                }(r) || function(r, e) {
                    if (r) {
                        if ("string" == typeof r) return rn(r, void 0);
                        var t = Object.prototype.toString.call(r).slice(8, -1);
                        if ("Object" === t && r.constructor && (t = r.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                        if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return rn(r, e)
                    }
                }(r) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var ri = function(r) {
                    return 2 === r.split(".").length
                },
                ra = function(r) {
                    return Array.isArray(r) && r.every(function(r) {
                        return "string" == typeof r
                    })
                },
                rg = function(r) {
                    var e = r.common,
                        t = r.feature,
                        n = r.features;
                    if (!ra(e) || void 0 !== t && void 0 !== n || null != t && "string" != typeof t || null != n && !ra(n)) throw Error("Invalid namespaces config!");
                    return ro(e).concat(ro(null == t ? [] : [t]), ro(null != n ? n : [])).filter(ri)
                },
                ru = function(r) {
                    if (!Array.isArray(r)) return rg(r);
                    if (ra(r)) return r.filter(ri);
                    throw TypeError("Translation Config must be an array of strings.")
                };

            function rc(r, e) {
                (null == e || e > r.length) && (e = r.length);
                for (var t = 0, n = Array(e); t < e; t++) n[t] = r[t];
                return n
            }
            var rb = function(r, e) {
                    var t = ru(r),
                        n = new(re()),
                        o = new rt.TranslationResourceProvider(n),
                        i = t.map(function(r) {
                            return o.getTranslationResource(r)
                        }),
                        a = o.mergeTranslationResources.apply(o, function(r) {
                            if (Array.isArray(r)) return rc(r)
                        }(i) || function(r) {
                            if ("undefined" != typeof Symbol && null != r[Symbol.iterator] || null != r["@@iterator"]) return Array.from(r)
                        }(i) || function(r, e) {
                            if (r) {
                                if ("string" == typeof r) return rc(r, void 0);
                                var t = Object.prototype.toString.call(r).slice(8, -1);
                                if ("Object" === t && r.constructor && (t = r.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                                if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return rc(r, e)
                            }
                        }(i) || function() {
                            throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                        }());
                    return {
                        translate: function(r, t, o) {
                            var i = a.get(r, t);
                            return !i && e && e(r, n.locale), i && i.length > 0 ? i : null != o ? o : ""
                        },
                        intl: n
                    }
                },
                rl = (0, c.createContext)(void 0);

            function rs(r) {
                var e = r.config,
                    t = r.children,
                    n = r.onEmptyString;
                return (0, p.jsx)(rl.Provider, {
                    value: rb(e, n),
                    children: t
                })
            }
            var rd = function() {
                var r = (0, c.useContext)(rl);
                if (!r) throw Error("invalid use of `useTranslation` hook. Ensure your component has an ancestor wrapped in `TranslationProvider`");
                return r
            };

            function r_(r, e) {
                (null == e || e > r.length) && (e = r.length);
                for (var t = 0, n = Array(e); t < e; t++) n[t] = r[t];
                return n
            }
            var rf = function(r, e) {
                    return "".concat(e, "(").concat(r.displayName || r.name || "Component", ")")
                },
                rS = function(r) {
                    var e = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : "withHOC";
                    return function(t) {
                        for (var n = arguments.length, o = Array(n > 1 ? n - 1 : 0), i = 1; i < n; i++) o[i - 1] = arguments[i];
                        var a = r.apply(void 0, [t].concat(function(r) {
                            if (Array.isArray(r)) return r_(r)
                        }(o) || function(r) {
                            if ("undefined" != typeof Symbol && null != r[Symbol.iterator] || null != r["@@iterator"]) return Array.from(r)
                        }(o) || function(r, e) {
                            if (r) {
                                if ("string" == typeof r) return r_(r, void 0);
                                var t = Object.prototype.toString.call(r).slice(8, -1);
                                if ("Object" === t && r.constructor && (t = r.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                                if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return r_(r, e)
                            }
                        }(o) || function() {
                            throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                        }()));
                        return a.displayName = rf(t, e), a
                    }
                };

            function rp(r, e) {
                (null == e || e > r.length) && (e = r.length);
                for (var t = 0, n = Array(e); t < e; t++) n[t] = r[t];
                return n
            }

            function rh(r, e, t) {
                return e in r ? Object.defineProperty(r, e, {
                    value: t,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : r[e] = t, r
            }

            function ry(r) {
                return (ry = Object.setPrototypeOf ? Object.getPrototypeOf : function(r) {
                    return r.__proto__ || Object.getPrototypeOf(r)
                })(r)
            }

            function rm(r, e) {
                return (rm = Object.setPrototypeOf || function(r, e) {
                    return r.__proto__ = e, r
                })(r, e)
            }

            function rv() {
                try {
                    var r = !Boolean.prototype.valueOf.call(Reflect.construct(Boolean, [], function() {}))
                } catch (r) {}
                return (rv = function() {
                    return !!r
                })()
            }
            var rF = rS(function(r, e) {
                    var t = ru(e);
                    return function(e) {
                        var n;
                        if ("function" != typeof e && null !== e) throw TypeError("Super expression must either be null or a function");

                        function o(r) {
                            if (!(this instanceof o)) throw TypeError("Cannot call a class as a function");
                            e = o, n = [r], e = ry(e), rh(i = function(r, e) {
                                var t;
                                if (e && ("object" == ((t = e) && "undefined" != typeof Symbol && t.constructor === Symbol ? "symbol" : typeof t) || "function" == typeof e)) return e;
                                if (void 0 === r) throw ReferenceError("this hasn't been initialised - super() hasn't been called");
                                return r
                            }(this, rv() ? Reflect.construct(e, n || [], ry(this).constructor) : e.apply(this, n)), "intl", void 0), i.intl = new(re()), i.translate = i.translate.bind(i);
                            var e, n, i, a = new rt.TranslationResourceProvider(i.intl),
                                g = t.map(function(r) {
                                    return a.getTranslationResource(r)
                                });
                            return i.state = {
                                languageResources: a.mergeTranslationResources.apply(a, function(r) {
                                    if (Array.isArray(r)) return rp(r)
                                }(g) || function(r) {
                                    if ("undefined" != typeof Symbol && null != r[Symbol.iterator] || null != r["@@iterator"]) return Array.from(r)
                                }(g) || function(r, e) {
                                    if (r) {
                                        if ("string" == typeof r) return rp(r, void 0);
                                        var t = Object.prototype.toString.call(r).slice(8, -1);
                                        if ("Object" === t && r.constructor && (t = r.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                                        if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return rp(r, e)
                                    }
                                }(g) || function() {
                                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                                }())
                            }, i
                        }
                        return o.prototype = Object.create(e && e.prototype, {
                                constructor: {
                                    value: o,
                                    writable: !0,
                                    configurable: !0
                                }
                            }), e && rm(o, e), n = [{
                                key: "translate",
                                value: function(r, e) {
                                    return this.state.languageResources.get(r, e)
                                }
                            }, {
                                key: "render",
                                value: function() {
                                    var e, t, n = this;
                                    return (0, p.jsx)(r, (e = function(r) {
                                        for (var e = 1; e < arguments.length; e++) {
                                            var t = null != arguments[e] ? arguments[e] : {},
                                                n = Object.keys(t);
                                            "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(t).filter(function(r) {
                                                return Object.getOwnPropertyDescriptor(t, r).enumerable
                                            }))), n.forEach(function(e) {
                                                rh(r, e, t[e])
                                            })
                                        }
                                        return r
                                    }({}, this.props), t = t = {
                                        translate: function(r, e) {
                                            return n.translate(r, e)
                                        },
                                        intl: this.intl
                                    }, Object.getOwnPropertyDescriptors ? Object.defineProperties(e, Object.getOwnPropertyDescriptors(t)) : (function(r, e) {
                                        var t = Object.keys(r);
                                        if (Object.getOwnPropertySymbols) {
                                            var n = Object.getOwnPropertySymbols(r);
                                            t.push.apply(t, n)
                                        }
                                        return t
                                    })(Object(t)).forEach(function(r) {
                                        Object.defineProperty(e, r, Object.getOwnPropertyDescriptor(t, r))
                                    }), e))
                                }
                            }],
                            function(r, e) {
                                for (var t = 0; t < e.length; t++) {
                                    var n = e[t];
                                    n.enumerable = n.enumerable || !1, n.configurable = !0, "value" in n && (n.writable = !0), Object.defineProperty(r, n.key, n)
                                }
                            }(o.prototype, n), o
                    }(b().Component)
                }, "withTranslations"),
                rB = window.PropTypes,
                rk = t.n(rB),
                rO = t(942),
                rL = t.n(rO),
                rz = function(r, e) {
                    console.warn("The following exception has been caught with the captured component stack:"), console.group(), console.info("".concat(r)), console.info("".concat(e.componentStack)), console.groupEnd()
                };

            function rw(r, e) {
                for (var t = 0; t < e.length; t++) {
                    var n = e[t];
                    n.enumerable = n.enumerable || !1, n.configurable = !0, "value" in n && (n.writable = !0), Object.defineProperty(r, n.key, n)
                }
            }

            function rE(r) {
                return (rE = Object.setPrototypeOf ? Object.getPrototypeOf : function(r) {
                    return r.__proto__ || Object.getPrototypeOf(r)
                })(r)
            }

            function rP(r, e) {
                return (rP = Object.setPrototypeOf || function(r, e) {
                    return r.__proto__ = e, r
                })(r, e)
            }

            function rA() {
                try {
                    var r = !Boolean.prototype.valueOf.call(Reflect.construct(Boolean, [], function() {}))
                } catch (r) {}
                return (rA = function() {
                    return !!r
                })()
            }
            var rM = rS(function(r) {
                var e = function(e) {
                    var t, n;
                    if ("function" != typeof e && null !== e) throw TypeError("Super expression must either be null or a function");

                    function o(r) {
                        if (!(this instanceof o)) throw TypeError("Cannot call a class as a function");
                        e = o, t = [r], e = rE(e);
                        var e, t, n, i = (n = function(r, e) {
                            var t;
                            if (e && ("object" == ((t = e) && "undefined" != typeof Symbol && t.constructor === Symbol ? "symbol" : typeof t) || "function" == typeof e)) return e;
                            if (void 0 === r) throw ReferenceError("this hasn't been initialised - super() hasn't been called");
                            return r
                        }(this, rA() ? Reflect.construct(e, t || [], rE(this).constructor) : e.apply(this, t))).props.showAppOnInit;
                        return n.state = {
                            isLoading: !i,
                            hasError: !1,
                            errorState: null
                        }, n.onLoadStart = n.onLoadStart.bind(n), n.onLoadEnd = n.onLoadEnd.bind(n), n.onError = n.onError.bind(n), n
                    }
                    return o.prototype = Object.create(e && e.prototype, {
                        constructor: {
                            value: o,
                            writable: !0,
                            configurable: !0
                        }
                    }), e && rP(o, e), n = [{
                        key: "getDerivedStateFromError",
                        value: function() {
                            return {
                                hasError: !0,
                                errorState: null
                            }
                        }
                    }], t = [{
                        key: "componentDidCatch",
                        value: function(r, e) {
                            rz(r, e)
                        }
                    }, {
                        key: "onLoadStart",
                        value: function() {
                            this.setState({
                                isLoading: !0
                            })
                        }
                    }, {
                        key: "onLoadEnd",
                        value: function() {
                            this.setState({
                                isLoading: !1
                            })
                        }
                    }, {
                        key: "onError",
                        value: function(r) {
                            this.setState({
                                hasError: !0,
                                errorState: r
                            })
                        }
                    }, {
                        key: "render",
                        value: function() {
                            var e, t, n, o, i = this.props,
                                a = i.defaultMessage,
                                g = i.errorStates,
                                u = function(r, e) {
                                    if (null == r) return {};
                                    var t, n, o = function(r, e) {
                                        if (null == r) return {};
                                        var t, n, o = {},
                                            i = Object.keys(r);
                                        for (n = 0; n < i.length; n++) t = i[n], e.indexOf(t) >= 0 || (o[t] = r[t]);
                                        return o
                                    }(r, e);
                                    if (Object.getOwnPropertySymbols) {
                                        var i = Object.getOwnPropertySymbols(r);
                                        for (n = 0; n < i.length; n++) t = i[n], !(e.indexOf(t) >= 0) && Object.prototype.propertyIsEnumerable.call(r, t) && (o[t] = r[t])
                                    }
                                    return o
                                }(i, ["defaultMessage", "errorStates"]),
                                c = this.state,
                                b = c.isLoading,
                                l = c.hasError,
                                s = c.errorState;
                            l ? n = (0, p.jsx)("h3", {
                                children: g[s] ? g[s] : a
                            }) : (n = (0, p.jsx)("span", {
                                className: "spinner spinner-default"
                            }), o = (0, p.jsx)(r, (e = function(r) {
                                for (var e = 1; e < arguments.length; e++) {
                                    var t = null != arguments[e] ? arguments[e] : {},
                                        n = Object.keys(t);
                                    "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(t).filter(function(r) {
                                        return Object.getOwnPropertyDescriptor(t, r).enumerable
                                    }))), n.forEach(function(e) {
                                        var n;
                                        n = t[e], e in r ? Object.defineProperty(r, e, {
                                            value: n,
                                            enumerable: !0,
                                            configurable: !0,
                                            writable: !0
                                        }) : r[e] = n
                                    })
                                }
                                return r
                            }({}, u), t = t = {
                                isLoading: b,
                                hasError: l,
                                errorState: s,
                                onLoadStart: this.onLoadStart,
                                onLoadEnd: this.onLoadEnd,
                                onError: this.onError
                            }, Object.getOwnPropertyDescriptors ? Object.defineProperties(e, Object.getOwnPropertyDescriptors(t)) : (function(r, e) {
                                var t = Object.keys(r);
                                if (Object.getOwnPropertySymbols) {
                                    var n = Object.getOwnPropertySymbols(r);
                                    t.push.apply(t, n)
                                }
                                return t
                            })(Object(t)).forEach(function(r) {
                                Object.defineProperty(e, r, Object.getOwnPropertyDescriptor(t, r))
                            }), e)));
                            var d = l || b,
                                _ = rL()("component-status-container", {
                                    hidden: !d
                                }),
                                f = rL()("component-container", {
                                    hidden: d
                                });
                            return (0, p.jsxs)("div", {
                                className: "component-status",
                                children: [(0, p.jsx)("div", {
                                    className: _,
                                    children: n
                                }), (0, p.jsx)("div", {
                                    className: f,
                                    children: o
                                })]
                            })
                        }
                    }], rw(o.prototype, t), n && rw(o, n), o
                }(b().Component);
                return e.defaultProps = {
                    showAppOnInit: !1,
                    defaultMessage: "",
                    errorStates: {}
                }, e.propTypes = {
                    showAppOnInit: rk().bool,
                    defaultMessage: rk().string,
                    errorStates: rk().objectOf(rk().string)
                }, e
            }, "withComponentStatus");

            function rj(r, e, t) {
                return e in r ? Object.defineProperty(r, e, {
                    value: t,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : r[e] = t, r
            }

            function rT(r) {
                for (var e = arguments.length, t = Array(e > 1 ? e - 1 : 0), n = 1; n < e; n++) t[n - 1] = arguments[n];
                return function() {
                    for (var e = arguments.length, n = Array(e), o = 0; o < e; o++) n[o] = arguments[o];
                    return function(r) {
                        for (var e = 1; e < arguments.length; e++) {
                            var t = null != arguments[e] ? arguments[e] : {},
                                n = Object.keys(t);
                            "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(t).filter(function(r) {
                                return Object.getOwnPropertyDescriptor(t, r).enumerable
                            }))), n.forEach(function(e) {
                                rj(r, e, t[e])
                            })
                        }
                        return r
                    }({
                        type: r
                    }, t.reduce(function(r, e, t) {
                        return Object.assign(r, rj({}, e, n[t]))
                    }, {}))
                }
            }
            var rI = function(r, e) {
                    var t = (0, c.useState)(r),
                        n = t[0],
                        o = t[1];
                    return (0, c.useEffect)(function() {
                        var t = setTimeout(function() {
                            o(r)
                        }, e);
                        return function() {
                            clearTimeout(t)
                        }
                    }, [r, e]), n
                },
                rW = function(r, e) {
                    var t = (0, c.useRef)(r);
                    (0, c.useEffect)(function() {
                        t.current = r
                    }, [r]), (0, c.useEffect)(function() {
                        if (null !== e) {
                            var r = setInterval(function() {
                                return t.current()
                            }, e);
                            return function() {
                                clearInterval(r)
                            }
                        }
                    }, [e])
                },
                rD = function(r, e) {
                    var t = function() {
                            if ("undefined" == typeof window) return e;
                            try {
                                var t = window.localStorage.getItem(r);
                                return t ? JSON.parse(t) : e
                            } catch (t) {
                                return console.warn("Error reading localStorage key “" + r + "”:", t), e
                            }
                        },
                        n = (0, c.useState)(t),
                        o = n[0],
                        i = n[1],
                        a = (0, c.useCallback)(function(e) {
                            "undefined" == typeof window && console.warn("Tried setting localStorage key “" + r + "” even though environment is not a client");
                            try {
                                var t, n = (t = Function, null != t && "undefined" != typeof Symbol && t[Symbol.hasInstance] ? !!t[Symbol.hasInstance](e) : e instanceof t) ? e(o) : e;
                                window.localStorage.setItem(r, JSON.stringify(n)), i(n), window.dispatchEvent(new Event("local-storage"))
                            } catch (e) {
                                console.warn("Error setting localStorage key “" + r + "”:", e)
                            }
                        }, [r, o]);
                    return (0, c.useEffect)(function() {
                        i(t())
                    }, []), (0, c.useEffect)(function() {
                        var r = function() {
                            i(t())
                        };
                        return window.addEventListener("storage", r), window.addEventListener("local-storage", r),
                            function() {
                                window.removeEventListener("storage", r), window.removeEventListener("local-storage", r)
                            }
                    }, []), [o, a]
                },
                rC = function(r, e) {
                    (0, c.useEffect)(function() {
                        var t = function(t) {
                            r.every(function(r) {
                                return !(null == r ? void 0 : r.current)
                            }) || r.findIndex(function(r) {
                                var e, n, o;
                                return n = t.target, (null != (o = Node) && "undefined" != typeof Symbol && o[Symbol.hasInstance] ? !!o[Symbol.hasInstance](n) : n instanceof o) && (null == (e = null == r ? void 0 : r.current) ? void 0 : e.contains(t.target))
                            }) > -1 || e(t)
                        };
                        return document.addEventListener("mousedown", t), document.addEventListener("touchstart", t),
                            function() {
                                document.removeEventListener("mousedown", t), document.removeEventListener("touchstart", t)
                            }
                    }, [r, e])
                },
                rR = function(r) {
                    var e = (0, c.useRef)();
                    return (0, c.useEffect)(function() {
                        e.current = r
                    }, [r]), e.current
                },
                rx = ["focus", "click", "hover", "scroll", "mouseover", "mouseenter", "mousedown", "dblclick", "keypress", "touchstart", "touchmove"],
                rH = ["blur"],
                rG = function() {
                    var r = (0, c.useState)(!1),
                        e = r[0],
                        t = r[1],
                        n = (0, c.useCallback)(function() {
                            t(!0)
                        }, []),
                        o = (0, c.useCallback)(function() {
                            t(!1)
                        }, []);
                    return (0, c.useEffect)(function() {
                        return rx.forEach(function(r) {
                                window.addEventListener(r, n)
                            }), rH.forEach(function(r) {
                                window.addEventListener(r, o)
                            }),
                            function() {
                                rx.forEach(function(r) {
                                    window.removeEventListener(r, n)
                                }), rH.forEach(function(r) {
                                    window.removeEventListener(r, o)
                                })
                            }
                    }, [n, o]), e
                };

            function rN(r, e) {
                (null == e || e > r.length) && (e = r.length);
                for (var t = 0, n = Array(e); t < e; t++) n[t] = r[t];
                return n
            }
            var rX = function() {
                    var r, e = (r = (0, c.useState)(document.body.classList.contains("dark-theme")), function(r) {
                            if (Array.isArray(r)) return r
                        }(r) || function(r, e) {
                            var t, n, o = null == r ? null : "undefined" != typeof Symbol && r[Symbol.iterator] || r["@@iterator"];
                            if (null != o) {
                                var i = [],
                                    a = !0,
                                    g = !1;
                                try {
                                    for (o = o.call(r); !(a = (t = o.next()).done) && (i.push(t.value), i.length !== e); a = !0);
                                } catch (r) {
                                    g = !0, n = r
                                } finally {
                                    try {
                                        a || null == o.return || o.return()
                                    } finally {
                                        if (g) throw n
                                    }
                                }
                                return i
                            }
                        }(r, 2) || function(r, e) {
                            if (r) {
                                if ("string" == typeof r) return rN(r, 2);
                                var t = Object.prototype.toString.call(r).slice(8, -1);
                                if ("Object" === t && r.constructor && (t = r.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                                if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return rN(r, e)
                            }
                        }(r, 2) || function() {
                            throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                        }()),
                        t = e[0],
                        n = e[1];
                    return (0, c.useEffect)(function() {
                        var r = new MutationObserver(function() {
                            n(document.body.classList.contains("dark-theme"))
                        });
                        return r.observe(document.body, {
                                attributeFilter: ["class"]
                            }),
                            function() {
                                r.disconnect()
                            }
                    }, []), t ? "dark" : "light"
                },
                rY = t(339),
                rU = function() {
                    var r = rX();
                    return (0, c.useMemo)(function() {
                        return "dark" === r ? rY.FoundationDark : rY.FoundationLight
                    }, [r])
                },
                rq = "10.50.0",
                r$ = globalThis;

            function rK() {
                return rV(r$), r$
            }

            function rV(r) {
                var e = r.__SENTRY__ = r.__SENTRY__ || {};
                return e.version = e.version || rq, e[rq] = e[rq] || {}
            }

            function rJ(r, e) {
                var t = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : r$,
                    n = t.__SENTRY__ = t.__SENTRY__ || {},
                    o = n[rq] = n[rq] || {};
                return o[r] || (o[r] = e())
            }
            var rQ = "undefined" == typeof __SENTRY_DEBUG__ || __SENTRY_DEBUG__;

            function rZ(r) {
                if (void 0 !== e) return e ? e(r) : r();
                var t = Symbol.for("__SENTRY_SAFE_RANDOM_ID_WRAPPER__");
                return t in r$ && "function" == typeof r$[t] ? (e = r$[t])(r) : (e = null, r())
            }

            function r0() {
                return rZ(function() {
                    return Math.random()
                })
            }

            function r2() {
                var r = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : r$.crypto || r$.msCrypto;
                try {
                    if (null == r ? void 0 : r.randomUUID) return rZ(function() {
                        return r.randomUUID()
                    }).replace(/-/g, "")
                } catch (r) {}
                return n || (n = "10000000100040008000100000000000"), n.replace(/[018]/g, function(r) {
                    return (r ^ (15 & 16 * r0()) >> r / 4).toString(16)
                })
            }

            function r1() {
                return rZ(function() {
                    return Date.now()
                }) / 1e3
            }

            function r5(r, e) {
                (null == e || e > r.length) && (e = r.length);
                for (var t = 0, n = Array(e); t < e; t++) n[t] = r[t];
                return n
            }

            function r4(r) {
                return function(r) {
                    if (Array.isArray(r)) return r5(r)
                }(r) || function(r) {
                    if ("undefined" != typeof Symbol && null != r[Symbol.iterator] || null != r["@@iterator"]) return Array.from(r)
                }(r) || function(r, e) {
                    if (r) {
                        if ("string" == typeof r) return r5(r, void 0);
                        var t = Object.prototype.toString.call(r).slice(8, -1);
                        if ("Object" === t && r.constructor && (t = r.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                        if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return r5(r, e)
                    }
                }(r) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var r7 = {};

            function r3(r) {
                if (!("console" in r$)) return r();
                var e = r$.console,
                    t = {},
                    n = Object.keys(r7);
                n.forEach(function(r) {
                    var n = r7[r];
                    t[r] = e[r], e[r] = n
                });
                try {
                    return r()
                } finally {
                    n.forEach(function(r) {
                        e[r] = t[r]
                    })
                }
            }

            function r8(r) {
                for (var e = arguments.length, t = Array(e > 1 ? e - 1 : 0), n = 1; n < e; n++) t[n - 1] = arguments[n];
                rQ && function() {
                    return rQ ? rJ("loggerSettings", function() {
                        return {
                            enabled: !1
                        }
                    }) : {
                        enabled: !1
                    }
                }().enabled && r3(function() {
                    var e;
                    (e = r$.console)[r].apply(e, ["".concat("Sentry Logger ", "[").concat(r, "]:")].concat(r4(t)))
                })
            }
            var r9 = function() {
                    for (var r = arguments.length, e = Array(r), t = 0; t < r; t++) e[t] = arguments[t];
                    r8.apply(void 0, ["log"].concat(r4(e)))
                },
                r6 = function() {
                    for (var r = arguments.length, e = Array(r), t = 0; t < r; t++) e[t] = arguments[t];
                    r8.apply(void 0, ["warn"].concat(r4(e)))
                },
                er = function() {
                    for (var r = arguments.length, e = Array(r), t = 0; t < r; t++) e[t] = arguments[t];
                    r8.apply(void 0, ["error"].concat(r4(e)))
                },
                ee = Object.prototype.toString,
                et = "_sentrySpan";

            function en(r, e) {
                if (e) try {
                    Object.defineProperty(r, et, {
                        value: e,
                        writable: !0,
                        configurable: !0
                    })
                } catch (e) {
                    rQ && r9('Failed to add non-enumerable property "'.concat(et, '" to object'), r)
                } else delete r[et]
            }

            function eo(r, e) {
                (null == e || e > r.length) && (e = r.length);
                for (var t = 0, n = Array(e); t < e; t++) n[t] = r[t];
                return n
            }

            function ei(r, e, t) {
                return e in r ? Object.defineProperty(r, e, {
                    value: t,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : r[e] = t, r
            }

            function ea(r) {
                for (var e = 1; e < arguments.length; e++) {
                    var t = null != arguments[e] ? arguments[e] : {},
                        n = Object.keys(t);
                    "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(t).filter(function(r) {
                        return Object.getOwnPropertyDescriptor(t, r).enumerable
                    }))), n.forEach(function(e) {
                        ei(r, e, t[e])
                    })
                }
                return r
            }

            function eg(r, e) {
                return e = null != e ? e : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(r, Object.getOwnPropertyDescriptors(e)) : (function(r, e) {
                    var t = Object.keys(r);
                    if (Object.getOwnPropertySymbols) {
                        var n = Object.getOwnPropertySymbols(r);
                        t.push.apply(t, n)
                    }
                    return t
                })(Object(e)).forEach(function(t) {
                    Object.defineProperty(r, t, Object.getOwnPropertyDescriptor(e, t))
                }), r
            }

            function eu(r) {
                return function(r) {
                    if (Array.isArray(r)) return eo(r)
                }(r) || function(r) {
                    if ("undefined" != typeof Symbol && null != r[Symbol.iterator] || null != r["@@iterator"]) return Array.from(r)
                }(r) || function(r, e) {
                    if (r) {
                        if ("string" == typeof r) return eo(r, void 0);
                        var t = Object.prototype.toString.call(r).slice(8, -1);
                        if ("Object" === t && r.constructor && (t = r.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                        if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return eo(r, e)
                    }
                }(r) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var ec = function() {
                    var r;

                    function e() {
                        if (!(this instanceof e)) throw TypeError("Cannot call a class as a function");
                        this._notifyingListeners = !1, this._scopeListeners = [], this._eventProcessors = [], this._breadcrumbs = [], this._attachments = [], this._user = {}, this._tags = {}, this._attributes = {}, this._extra = {}, this._contexts = {}, this._sdkProcessingMetadata = {}, this._propagationContext = {
                            traceId: r2(),
                            sampleRand: r0()
                        }
                    }
                    return r = [{
                            key: "clone",
                            value: function() {
                                var r = new e;
                                return r._breadcrumbs = eu(this._breadcrumbs), r._tags = ea({}, this._tags), r._attributes = ea({}, this._attributes), r._extra = ea({}, this._extra), r._contexts = ea({}, this._contexts), this._contexts.flags && (r._contexts.flags = {
                                    values: eu(this._contexts.flags.values)
                                }), r._user = this._user, r._level = this._level, r._session = this._session, r._transactionName = this._transactionName, r._fingerprint = this._fingerprint, r._eventProcessors = eu(this._eventProcessors), r._attachments = eu(this._attachments), r._sdkProcessingMetadata = ea({}, this._sdkProcessingMetadata), r._propagationContext = ea({}, this._propagationContext), r._client = this._client, r._lastEventId = this._lastEventId, r._conversationId = this._conversationId, en(r, this[et]), r
                            }
                        }, {
                            key: "setClient",
                            value: function(r) {
                                this._client = r
                            }
                        }, {
                            key: "setLastEventId",
                            value: function(r) {
                                this._lastEventId = r
                            }
                        }, {
                            key: "getClient",
                            value: function() {
                                return this._client
                            }
                        }, {
                            key: "lastEventId",
                            value: function() {
                                return this._lastEventId
                            }
                        }, {
                            key: "addScopeListener",
                            value: function(r) {
                                this._scopeListeners.push(r)
                            }
                        }, {
                            key: "addEventProcessor",
                            value: function(r) {
                                return this._eventProcessors.push(r), this
                            }
                        }, {
                            key: "setUser",
                            value: function(r) {
                                return this._user = r || {
                                    email: void 0,
                                    id: void 0,
                                    ip_address: void 0,
                                    username: void 0
                                }, this._session && function(r) {
                                    var e = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {};
                                    if (e.user && (!r.ipAddress && e.user.ip_address && (r.ipAddress = e.user.ip_address), r.did || e.did || (r.did = e.user.id || e.user.email || e.user.username)), r.timestamp = e.timestamp || (null != o ? o : o = function() {
                                            var r = r$.performance;
                                            if (!(null == r ? void 0 : r.now) || !r.timeOrigin) return r1;
                                            var e = r.timeOrigin;
                                            return function() {
                                                return (e + rZ(function() {
                                                    return r.now()
                                                })) / 1e3
                                            }
                                        }())(), e.abnormal_mechanism && (r.abnormal_mechanism = e.abnormal_mechanism), e.ignoreDuration && (r.ignoreDuration = e.ignoreDuration), e.sid && (r.sid = 32 === e.sid.length ? e.sid : r2()), void 0 !== e.init && (r.init = e.init), !r.did && e.did && (r.did = "".concat(e.did)), "number" == typeof e.started && (r.started = e.started), r.ignoreDuration) r.duration = void 0;
                                    else if ("number" == typeof e.duration) r.duration = e.duration;
                                    else {
                                        var t = r.timestamp - r.started;
                                        r.duration = t >= 0 ? t : 0
                                    }
                                    e.release && (r.release = e.release), e.environment && (r.environment = e.environment), !r.ipAddress && e.ipAddress && (r.ipAddress = e.ipAddress), !r.userAgent && e.userAgent && (r.userAgent = e.userAgent), "number" == typeof e.errors && (r.errors = e.errors), e.status && (r.status = e.status)
                                }(this._session, {
                                    user: r
                                }), this._notifyScopeListeners(), this
                            }
                        }, {
                            key: "getUser",
                            value: function() {
                                return this._user
                            }
                        }, {
                            key: "setConversationId",
                            value: function(r) {
                                return this._conversationId = r || void 0, this._notifyScopeListeners(), this
                            }
                        }, {
                            key: "setTags",
                            value: function(r) {
                                return this._tags = ea({}, this._tags, r), this._notifyScopeListeners(), this
                            }
                        }, {
                            key: "setTag",
                            value: function(r, e) {
                                return this.setTags(ei({}, r, e))
                            }
                        }, {
                            key: "setAttributes",
                            value: function(r) {
                                return this._attributes = ea({}, this._attributes, r), this._notifyScopeListeners(), this
                            }
                        }, {
                            key: "setAttribute",
                            value: function(r, e) {
                                return this.setAttributes(ei({}, r, e))
                            }
                        }, {
                            key: "removeAttribute",
                            value: function(r) {
                                return r in this._attributes && (delete this._attributes[r], this._notifyScopeListeners()), this
                            }
                        }, {
                            key: "setExtras",
                            value: function(r) {
                                return this._extra = ea({}, this._extra, r), this._notifyScopeListeners(), this
                            }
                        }, {
                            key: "setExtra",
                            value: function(r, e) {
                                return this._extra = eg(ea({}, this._extra), ei({}, r, e)), this._notifyScopeListeners(), this
                            }
                        }, {
                            key: "setFingerprint",
                            value: function(r) {
                                return this._fingerprint = r, this._notifyScopeListeners(), this
                            }
                        }, {
                            key: "setLevel",
                            value: function(r) {
                                return this._level = r, this._notifyScopeListeners(), this
                            }
                        }, {
                            key: "setTransactionName",
                            value: function(r) {
                                return this._transactionName = r, this._notifyScopeListeners(), this
                            }
                        }, {
                            key: "setContext",
                            value: function(r, e) {
                                return null === e ? delete this._contexts[r] : this._contexts[r] = e, this._notifyScopeListeners(), this
                            }
                        }, {
                            key: "setSession",
                            value: function(r) {
                                return r ? this._session = r : delete this._session, this._notifyScopeListeners(), this
                            }
                        }, {
                            key: "getSession",
                            value: function() {
                                return this._session
                            }
                        }, {
                            key: "update",
                            value: function(r) {
                                if (!r) return this;
                                var t = "function" == typeof r ? r(this) : r,
                                    n = ((null != e && "undefined" != typeof Symbol && e[Symbol.hasInstance] ? !!e[Symbol.hasInstance](t) : t instanceof e) ? t.getScopeData() : ee.call(t) === "[object ".concat("Object", "]") ? r : void 0) || {},
                                    o = n.tags,
                                    i = n.attributes,
                                    a = n.extra,
                                    g = n.user,
                                    u = n.contexts,
                                    c = n.level,
                                    b = n.fingerprint,
                                    l = void 0 === b ? [] : b,
                                    s = n.propagationContext,
                                    d = n.conversationId;
                                return this._tags = ea({}, this._tags, o), this._attributes = ea({}, this._attributes, i), this._extra = ea({}, this._extra, a), this._contexts = ea({}, this._contexts, u), g && Object.keys(g).length && (this._user = g), c && (this._level = c), l.length && (this._fingerprint = l), s && (this._propagationContext = s), d && (this._conversationId = d), this
                            }
                        }, {
                            key: "clear",
                            value: function() {
                                return this._breadcrumbs = [], this._tags = {}, this._attributes = {}, this._extra = {}, this._user = {}, this._contexts = {}, this._level = void 0, this._transactionName = void 0, this._fingerprint = void 0, this._session = void 0, this._conversationId = void 0, en(this, void 0), this._attachments = [], this.setPropagationContext({
                                    traceId: r2(),
                                    sampleRand: r0()
                                }), this._notifyScopeListeners(), this
                            }
                        }, {
                            key: "addBreadcrumb",
                            value: function(r, e) {
                                var t, n = "number" == typeof e ? e : 100;
                                if (n <= 0) return this;
                                var o = eg(ea({
                                    timestamp: r1()
                                }, r), {
                                    message: r.message ? function(r) {
                                        var e = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : 0;
                                        return "string" != typeof r || 0 === e || r.length <= e ? r : "".concat(r.slice(0, e), "...")
                                    }(r.message, 2048) : r.message
                                });
                                return this._breadcrumbs.push(o), this._breadcrumbs.length > n && (this._breadcrumbs = this._breadcrumbs.slice(-n), null == (t = this._client) || t.recordDroppedEvent("buffer_overflow", "log_item")), this._notifyScopeListeners(), this
                            }
                        }, {
                            key: "getLastBreadcrumb",
                            value: function() {
                                return this._breadcrumbs[this._breadcrumbs.length - 1]
                            }
                        }, {
                            key: "clearBreadcrumbs",
                            value: function() {
                                return this._breadcrumbs = [], this._notifyScopeListeners(), this
                            }
                        }, {
                            key: "addAttachment",
                            value: function(r) {
                                return this._attachments.push(r), this
                            }
                        }, {
                            key: "clearAttachments",
                            value: function() {
                                return this._attachments = [], this
                            }
                        }, {
                            key: "getScopeData",
                            value: function() {
                                return {
                                    breadcrumbs: this._breadcrumbs,
                                    attachments: this._attachments,
                                    contexts: this._contexts,
                                    tags: this._tags,
                                    attributes: this._attributes,
                                    extra: this._extra,
                                    user: this._user,
                                    level: this._level,
                                    fingerprint: this._fingerprint || [],
                                    eventProcessors: this._eventProcessors,
                                    propagationContext: this._propagationContext,
                                    sdkProcessingMetadata: this._sdkProcessingMetadata,
                                    transactionName: this._transactionName,
                                    span: this[et],
                                    conversationId: this._conversationId
                                }
                            }
                        }, {
                            key: "setSDKProcessingMetadata",
                            value: function(r) {
                                return this._sdkProcessingMetadata = function r(e, t) {
                                    var n = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : 2;
                                    if (!t || (void 0 === t ? "undefined" : t && "undefined" != typeof Symbol && t.constructor === Symbol ? "symbol" : typeof t) != "object" || n <= 0) return t;
                                    if (e && 0 === Object.keys(t).length) return e;
                                    var o = function(r) {
                                        for (var e = 1; e < arguments.length; e++) {
                                            var t = null != arguments[e] ? arguments[e] : {},
                                                n = Object.keys(t);
                                            "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(t).filter(function(r) {
                                                return Object.getOwnPropertyDescriptor(t, r).enumerable
                                            }))), n.forEach(function(e) {
                                                var n;
                                                n = t[e], e in r ? Object.defineProperty(r, e, {
                                                    value: n,
                                                    enumerable: !0,
                                                    configurable: !0,
                                                    writable: !0
                                                }) : r[e] = n
                                            })
                                        }
                                        return r
                                    }({}, e);
                                    for (var i in t) Object.prototype.hasOwnProperty.call(t, i) && (o[i] = r(o[i], t[i], n - 1));
                                    return o
                                }(this._sdkProcessingMetadata, r, 2), this
                            }
                        }, {
                            key: "setPropagationContext",
                            value: function(r) {
                                return this._propagationContext = r, this
                            }
                        }, {
                            key: "getPropagationContext",
                            value: function() {
                                return this._propagationContext
                            }
                        }, {
                            key: "captureException",
                            value: function(r, e) {
                                var t = (null == e ? void 0 : e.event_id) || r2();
                                if (!this._client) return rQ && r6("No client configured on scope - will not capture exception!"), t;
                                var n = Error("Sentry syntheticException");
                                return this._client.captureException(r, eg(ea({
                                    originalException: r,
                                    syntheticException: n
                                }, e), {
                                    event_id: t
                                }), this), t
                            }
                        }, {
                            key: "captureMessage",
                            value: function(r, e, t) {
                                var n, o = (null == t ? void 0 : t.event_id) || r2();
                                if (!this._client) return rQ && r6("No client configured on scope - will not capture message!"), o;
                                var i = null != (n = null == t ? void 0 : t.syntheticException) ? n : Error(r);
                                return this._client.captureMessage(r, e, eg(ea({
                                    originalException: r,
                                    syntheticException: i
                                }, t), {
                                    event_id: o
                                }), this), o
                            }
                        }, {
                            key: "captureEvent",
                            value: function(r, e) {
                                var t = r.event_id || (null == e ? void 0 : e.event_id) || r2();
                                return this._client ? this._client.captureEvent(r, eg(ea({}, e), {
                                    event_id: t
                                }), this) : rQ && r6("No client configured on scope - will not capture event!"), t
                            }
                        }, {
                            key: "_notifyScopeListeners",
                            value: function() {
                                var r = this;
                                this._notifyingListeners || (this._notifyingListeners = !0, this._scopeListeners.forEach(function(e) {
                                    e(r)
                                }), this._notifyingListeners = !1)
                            }
                        }],
                        function(r, e) {
                            for (var t = 0; t < e.length; t++) {
                                var n = e[t];
                                n.enumerable = n.enumerable || !1, n.configurable = !0, "value" in n && (n.writable = !0), Object.defineProperty(r, n.key, n)
                            }
                        }(e.prototype, r), e
                }(),
                eb = function(r) {
                    var e;
                    return (null != (e = Promise) && "undefined" != typeof Symbol && e[Symbol.hasInstance] ? !!e[Symbol.hasInstance](r) : r instanceof e) && !r[el]
                },
                el = Symbol("chained PromiseLike"),
                es = function(r, e, t) {
                    var n = r.then(function(r) {
                        return e(r), r
                    }, function(r) {
                        throw t(r), r
                    });
                    return eb(n) && eb(r) ? n : ed(r, n)
                },
                ed = function(r, e) {
                    var t, n = !1;
                    for (var o in r) ! function(t) {
                        if (!(t in e)) {
                            n = !0;
                            var o = r[t];
                            "function" == typeof o ? Object.defineProperty(e, t, {
                                value: function() {
                                    for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                                    return o.apply(r, t)
                                },
                                enumerable: !0,
                                configurable: !0,
                                writable: !0
                            }) : e[t] = o
                        }
                    }(o);
                    return n && Object.assign(e, (el in (t = {}) ? Object.defineProperty(t, el, {
                        value: !0,
                        enumerable: !0,
                        configurable: !0,
                        writable: !0
                    }) : t[el] = !0, t)), e
                },
                e_ = function() {
                    var r;

                    function e(r, t) {
                        var n, o;
                        if (!(this instanceof e)) throw TypeError("Cannot call a class as a function");
                        n = r || new ec, o = t || new ec, this._stack = [{
                            scope: n
                        }], this._isolationScope = o
                    }
                    return r = [{
                            key: "withScope",
                            value: function(r) {
                                var e, t, n = this,
                                    o = this._pushScope();
                                try {
                                    t = r(o)
                                } catch (r) {
                                    throw this._popScope(), r
                                }
                                return (null == (e = t) ? void 0 : e.then) && "function" == typeof e.then ? es(t, function() {
                                    return n._popScope()
                                }, function() {
                                    return n._popScope()
                                }) : (this._popScope(), t)
                            }
                        }, {
                            key: "getClient",
                            value: function() {
                                return this.getStackTop().client
                            }
                        }, {
                            key: "getScope",
                            value: function() {
                                return this.getStackTop().scope
                            }
                        }, {
                            key: "getIsolationScope",
                            value: function() {
                                return this._isolationScope
                            }
                        }, {
                            key: "getStackTop",
                            value: function() {
                                return this._stack[this._stack.length - 1]
                            }
                        }, {
                            key: "_pushScope",
                            value: function() {
                                var r = this.getScope().clone();
                                return this._stack.push({
                                    client: this.getClient(),
                                    scope: r
                                }), r
                            }
                        }, {
                            key: "_popScope",
                            value: function() {
                                return !(this._stack.length <= 1) && !!this._stack.pop()
                            }
                        }],
                        function(r, e) {
                            for (var t = 0; t < e.length; t++) {
                                var n = e[t];
                                n.enumerable = n.enumerable || !1, n.configurable = !0, "value" in n && (n.writable = !0), Object.defineProperty(r, n.key, n)
                            }
                        }(e.prototype, r), e
                }();

            function ef() {
                var r = rV(rK());
                return r.stack = r.stack || new e_(rJ("defaultCurrentScope", function() {
                    return new ec
                }), rJ("defaultIsolationScope", function() {
                    return new ec
                }))
            }

            function eS(r) {
                return ef().withScope(r)
            }

            function ep(r, e) {
                var t = ef();
                return t.withScope(function() {
                    return t.getStackTop().scope = r, e(r)
                })
            }

            function eh(r) {
                return ef().withScope(function() {
                    return r(ef().getIsolationScope())
                })
            }

            function ey(r) {
                var e = rV(r);
                return e.acs ? e.acs : {
                    withIsolationScope: eh,
                    withScope: eS,
                    withSetScope: ep,
                    withSetIsolationScope: function(r, e) {
                        return eh(e)
                    },
                    getCurrentScope: function() {
                        return ef().getScope()
                    },
                    getIsolationScope: function() {
                        return ef().getIsolationScope()
                    }
                }
            }

            function em(r, e) {
                (null == e || e > r.length) && (e = r.length);
                for (var t = 0, n = Array(e); t < e; t++) n[t] = r[t];
                return n
            }

            function ev() {
                return ey(rK()).getCurrentScope()
            }

            function eF() {
                for (var r = arguments.length, e = Array(r), t = 0; t < r; t++) e[t] = arguments[t];
                var n = ey(rK());
                if (2 === e.length) {
                    var o = function(r) {
                            if (Array.isArray(r)) return r
                        }(e) || function(r, e) {
                            var t, n, o = null == r ? null : "undefined" != typeof Symbol && r[Symbol.iterator] || r["@@iterator"];
                            if (null != o) {
                                var i = [],
                                    a = !0,
                                    g = !1;
                                try {
                                    for (o = o.call(r); !(a = (t = o.next()).done) && (i.push(t.value), i.length !== e); a = !0);
                                } catch (r) {
                                    g = !0, n = r
                                } finally {
                                    try {
                                        a || null == o.return || o.return()
                                    } finally {
                                        if (g) throw n
                                    }
                                }
                                return i
                            }
                        }(e, 2) || function(r, e) {
                            if (r) {
                                if ("string" == typeof r) return em(r, 2);
                                var t = Object.prototype.toString.call(r).slice(8, -1);
                                if ("Object" === t && r.constructor && (t = r.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                                if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return em(r, e)
                            }
                        }(e, 2) || function() {
                            throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                        }(),
                        i = o[0],
                        a = o[1];
                    return i ? n.withSetScope(i, a) : n.withScope(a)
                }
                return n.withScope(e[0])
            }

            function eB() {
                return ev().getClient()
            }
            var ek = ["user", "level", "extra", "contexts", "tags", "fingerprint", "propagationContext"];

            function eO(r, e) {
                (null == e || e > r.length) && (e = r.length);
                for (var t = 0, n = Array(e); t < e; t++) n[t] = r[t];
                return n
            }
            var eL = /^(?:(\w+):)\/\/(?:(\w+)(?::(\w+)?)?@)((?:\[[:.%\w]+\]|[\w.-]+))(?::(\d+))?\/(.+)/;

            function ez(r) {
                return {
                    protocol: r.protocol,
                    publicKey: r.publicKey || "",
                    pass: r.pass || "",
                    host: r.host,
                    port: r.port || "",
                    path: r.path || "",
                    projectId: r.projectId
                }
            }
            var ew = "undefined" == typeof __SENTRY_DEBUG__ || __SENTRY_DEBUG__;

            function eE(r) {
                for (var e = 1; e < arguments.length; e++) {
                    var t = null != arguments[e] ? arguments[e] : {},
                        n = Object.keys(t);
                    "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(t).filter(function(r) {
                        return Object.getOwnPropertyDescriptor(t, r).enumerable
                    }))), n.forEach(function(e) {
                        var n;
                        n = t[e], e in r ? Object.defineProperty(r, e, {
                            value: n,
                            enumerable: !0,
                            configurable: !0,
                            writable: !0
                        }) : r[e] = n
                    })
                }
                return r
            }

            function eP() {
                var r, e, t = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {},
                    n = r$.document,
                    o = (null == n ? void 0 : n.head) || (null == n ? void 0 : n.body);
                if (!o) {
                    ew && er("[showReportDialog] Global document not defined");
                    return
                }
                var i = ev(),
                    a = eB(),
                    g = null == a ? void 0 : a.getDsn();
                if (!g) {
                    ew && er("[showReportDialog] DSN not configured");
                    return
                }
                var u = (r = eE({}, t), e = e = {
                        user: eE({}, i.getUser(), t.user),
                        eventId: t.eventId || ey(rK()).getIsolationScope().lastEventId()
                    }, Object.getOwnPropertyDescriptors ? Object.defineProperties(r, Object.getOwnPropertyDescriptors(e)) : (function(r, e) {
                        var t = Object.keys(r);
                        if (Object.getOwnPropertySymbols) {
                            var n = Object.getOwnPropertySymbols(r);
                            t.push.apply(t, n)
                        }
                        return t
                    })(Object(e)).forEach(function(t) {
                        Object.defineProperty(r, t, Object.getOwnPropertyDescriptor(e, t))
                    }), r),
                    c = r$.document.createElement("script");
                c.async = !0, c.crossOrigin = "anonymous", c.src = function(r, e) {
                    var t, n, o = function(r) {
                        var e = "string" == typeof r ? function(r) {
                            var e, t = eL.exec(r);
                            if (!t) return void r3(function() {
                                console.error("Invalid Sentry Dsn: ".concat(r))
                            });
                            var n = (e = t.slice(1), function(r) {
                                    if (Array.isArray(r)) return r
                                }(e) || function(r, e) {
                                    var t, n, o = null == r ? null : "undefined" != typeof Symbol && r[Symbol.iterator] || r["@@iterator"];
                                    if (null != o) {
                                        var i = [],
                                            a = !0,
                                            g = !1;
                                        try {
                                            for (o = o.call(r); !(a = (t = o.next()).done) && (i.push(t.value), i.length !== e); a = !0);
                                        } catch (r) {
                                            g = !0, n = r
                                        } finally {
                                            try {
                                                a || null == o.return || o.return()
                                            } finally {
                                                if (g) throw n
                                            }
                                        }
                                        return i
                                    }
                                }(e, 6) || function(r, e) {
                                    if (r) {
                                        if ("string" == typeof r) return eO(r, 6);
                                        var t = Object.prototype.toString.call(r).slice(8, -1);
                                        if ("Object" === t && r.constructor && (t = r.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                                        if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return eO(r, e)
                                    }
                                }(e, 6) || function() {
                                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                                }()),
                                o = n[0],
                                i = n[1],
                                a = n[2],
                                g = n[3],
                                u = n[4],
                                c = n[5],
                                b = "",
                                l = void 0 === c ? "" : c,
                                s = l.split("/");
                            if (s.length > 1 && (b = s.slice(0, -1).join("/"), l = s.pop()), l) {
                                var d = l.match(/^\d+/);
                                d && (l = d[0])
                            }
                            return ez({
                                host: void 0 === g ? "" : g,
                                pass: void 0 === a ? "" : a,
                                path: b,
                                projectId: l,
                                port: void 0 === u ? "" : u,
                                protocol: o,
                                publicKey: i
                            })
                        }(r) : ez(r);
                        if (e && function(r) {
                                if (!rQ) return !0;
                                var e = r.port,
                                    t = r.projectId,
                                    n = r.protocol;
                                return !["protocol", "publicKey", "host", "projectId"].find(function(e) {
                                    return !r[e] && (er("Invalid Sentry Dsn: ".concat(e, " missing")), !0)
                                }) && (t.match(/^\d+$/) ? "http" !== n && "https" !== n ? (er("Invalid Sentry Dsn: Invalid protocol ".concat(n)), !1) : !(e && isNaN(parseInt(e, 10))) || (er("Invalid Sentry Dsn: Invalid port ".concat(e)), !1) : (er("Invalid Sentry Dsn: Invalid projectId ".concat(t)), !1))
                            }(e)) return e
                    }(r);
                    if (!o) return "";
                    var i = "".concat((t = o.protocol ? "".concat(o.protocol, ":") : "", n = o.port ? ":".concat(o.port) : "", "".concat(t, "//").concat(o.host).concat(n).concat(o.path ? "/".concat(o.path) : "", "/api/")), "embed/error-page/"),
                        a = "dsn=".concat(function(r) {
                            var e = arguments.length > 1 && void 0 !== arguments[1] && arguments[1],
                                t = r.host,
                                n = r.path,
                                o = r.pass,
                                i = r.port,
                                a = r.projectId,
                                g = r.protocol,
                                u = r.publicKey;
                            return "".concat(g, "://").concat(u).concat(e && o ? ":".concat(o) : "") + "@".concat(t).concat(i ? ":".concat(i) : "", "/").concat(n ? "".concat(n, "/") : n).concat(a)
                        }(o));
                    for (var g in e)
                        if ("dsn" !== g && "onClose" !== g)
                            if ("user" === g) {
                                var u = e.user;
                                if (!u) continue;
                                u.name && (a += "&name=".concat(encodeURIComponent(u.name))), u.email && (a += "&email=".concat(encodeURIComponent(u.email)))
                            } else a += "&".concat(encodeURIComponent(g), "=").concat(encodeURIComponent(e[g]));
                    return "".concat(i, "?").concat(a)
                }(g, u);
                var b = u.onLoad,
                    l = u.onClose;
                if (b && (c.onload = b), l) {
                    var s = function(r) {
                        if ("__sentry_reportdialog_closed__" === r.data) try {
                            l()
                        } finally {
                            r$.removeEventListener("message", s)
                        }
                    };
                    r$.addEventListener("message", s)
                }
                o.appendChild(c)
            }
            var eA = "undefined" == typeof __SENTRY_DEBUG__ || __SENTRY_DEBUG__;

            function eM(r) {
                return (eM = Object.setPrototypeOf ? Object.getPrototypeOf : function(r) {
                    return r.__proto__ || Object.getPrototypeOf(r)
                })(r)
            }

            function ej(r) {
                for (var e = 1; e < arguments.length; e++) {
                    var t = null != arguments[e] ? arguments[e] : {},
                        n = Object.keys(t);
                    "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(t).filter(function(r) {
                        return Object.getOwnPropertyDescriptor(t, r).enumerable
                    }))), n.forEach(function(e) {
                        var n;
                        n = t[e], e in r ? Object.defineProperty(r, e, {
                            value: n,
                            enumerable: !0,
                            configurable: !0,
                            writable: !0
                        }) : r[e] = n
                    })
                }
                return r
            }

            function eT(r, e) {
                return e = null != e ? e : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(r, Object.getOwnPropertyDescriptors(e)) : (function(r, e) {
                    var t = Object.keys(r);
                    if (Object.getOwnPropertySymbols) {
                        var n = Object.getOwnPropertySymbols(r);
                        t.push.apply(t, n)
                    }
                    return t
                })(Object(e)).forEach(function(t) {
                    Object.defineProperty(r, t, Object.getOwnPropertyDescriptor(e, t))
                }), r
            }

            function eI(r, e) {
                return (eI = Object.setPrototypeOf || function(r, e) {
                    return r.__proto__ = e, r
                })(r, e)
            }

            function eW() {
                try {
                    var r = !Boolean.prototype.valueOf.call(Reflect.construct(Boolean, [], function() {}))
                } catch (r) {}
                return (eW = function() {
                    return !!r
                })()
            }
            var eD = {
                    componentStack: null,
                    error: null,
                    eventId: null
                },
                eC = function(r) {
                    var e;
                    if ("function" != typeof r && null !== r) throw TypeError("Super expression must either be null or a function");

                    function t(r) {
                        if (!(this instanceof t)) throw TypeError("Cannot call a class as a function");
                        e = t, n = [r], e = eM(e), (o = function(r, e) {
                            var t;
                            if (e && ("object" == ((t = e) && "undefined" != typeof Symbol && t.constructor === Symbol ? "symbol" : typeof t) || "function" == typeof e)) return e;
                            if (void 0 === r) throw ReferenceError("this hasn't been initialised - super() hasn't been called");
                            return r
                        }(this, eW() ? Reflect.construct(e, n || [], eM(this).constructor) : e.apply(this, n))).state = eD, o._openFallbackReportDialog = !0;
                        var e, n, o, i = eB();
                        return i && r.showDialog && (o._openFallbackReportDialog = !1, o._cleanupHook = i.on("afterSendEvent", function(e) {
                            !e.type && o._lastEventId && e.event_id === o._lastEventId && eP(eT(ej({}, r.dialogOptions), {
                                eventId: o._lastEventId
                            }))
                        })), o
                    }
                    return t.prototype = Object.create(r && r.prototype, {
                            constructor: {
                                value: t,
                                writable: !0,
                                configurable: !0
                            }
                        }), r && eI(t, r), e = [{
                            key: "componentDidCatch",
                            value: function(r, e) {
                                var t = this,
                                    n = e.componentStack,
                                    o = this.props,
                                    i = o.beforeCapture,
                                    a = o.onError,
                                    g = o.showDialog,
                                    u = o.dialogOptions;
                                eF(function(o) {
                                    i && i(o, r, n);
                                    var b = function(r, e, t) {
                                        var n = e.componentStack;
                                        if (null !== (o = c.version.match(/^([^.]+)/)) && parseInt(o[0]) >= 17 && function(r) {
                                                switch (ee.call(r)) {
                                                    case "[object Error]":
                                                    case "[object Exception]":
                                                    case "[object DOMException]":
                                                    case "[object WebAssembly.Exception]":
                                                        return !0;
                                                    default:
                                                        var e = r,
                                                            t = Error;
                                                        try {
                                                            return null != t && "undefined" != typeof Symbol && t[Symbol.hasInstance] ? !!t[Symbol.hasInstance](e) : e instanceof t
                                                        } catch (r) {
                                                            return !1
                                                        }
                                                }
                                            }(r) && n) {
                                            var o, i, a = Error(r.message);
                                            a.name = "React ErrorBoundary ".concat(r.name), a.stack = n, i = new WeakSet,
                                                function r(e, t) {
                                                    if (!i.has(e)) {
                                                        if (e.cause) return i.add(e), r(e.cause, t);
                                                        e.cause = t
                                                    }
                                                }(r, a)
                                        }
                                        return eF(function(e) {
                                            return e.setContext("react", {
                                                componentStack: n
                                            }), ev().captureException(r, function(r) {
                                                if (r) return function(r) {
                                                    return (null != ec && "undefined" != typeof Symbol && ec[Symbol.hasInstance] ? !!ec[Symbol.hasInstance](r) : r instanceof ec) || "function" == typeof r
                                                }(r) || Object.keys(r).some(function(r) {
                                                    return ek.includes(r)
                                                }) ? {
                                                    captureContext: r
                                                } : r
                                            }(t))
                                        })
                                    }(r, e, {
                                        mechanism: {
                                            handled: null != t.props.handled ? t.props.handled : !!t.props.fallback,
                                            type: "auto.function.react.error_boundary"
                                        }
                                    });
                                    a && a(r, n, b), g && (t._lastEventId = b, t._openFallbackReportDialog && eP(eT(ej({}, u), {
                                        eventId: b
                                    }))), t.setState({
                                        error: r,
                                        componentStack: n,
                                        eventId: b
                                    })
                                })
                            }
                        }, {
                            key: "componentDidMount",
                            value: function() {
                                var r = this.props.onMount;
                                r && r()
                            }
                        }, {
                            key: "componentWillUnmount",
                            value: function() {
                                var r = this.state,
                                    e = r.error,
                                    t = r.componentStack,
                                    n = r.eventId,
                                    o = this.props.onUnmount;
                                o && (this.state === eD ? o(null, null, null) : o(e, t, n)), this._cleanupHook && (this._cleanupHook(), this._cleanupHook = void 0)
                            }
                        }, {
                            key: "resetErrorBoundary",
                            value: function() {
                                var r = this.props.onReset,
                                    e = this.state,
                                    t = e.error,
                                    n = e.componentStack,
                                    o = e.eventId;
                                r && r(t, n, o), this.setState(eD)
                            }
                        }, {
                            key: "render",
                            value: function() {
                                var r = this,
                                    e = this.props,
                                    t = e.fallback,
                                    n = e.children,
                                    o = this.state;
                                if (null === o.componentStack) return "function" == typeof n ? n() : n;
                                var i = "function" == typeof t ? c.createElement(t, {
                                    error: o.error,
                                    componentStack: o.componentStack,
                                    resetError: function() {
                                        return r.resetErrorBoundary()
                                    },
                                    eventId: o.eventId
                                }) : t;
                                return c.isValidElement(i) ? i : (t && eA && r6("fallback did not produce a valid ReactElement"), null)
                            }
                        }],
                        function(r, e) {
                            for (var t = 0; t < e.length; t++) {
                                var n = e[t];
                                n.enumerable = n.enumerable || !1, n.configurable = !0, "value" in n && (n.writable = !0), Object.defineProperty(r, n.key, n)
                            }
                        }(t.prototype, e), t
                }(c.Component),
                eR = function(r, e, t, n, o) {
                    (0, s.render)((0, p.jsx)(eC, {
                        fallback: n,
                        onError: o,
                        children: r
                    }), e, t)
                },
                ex = new Z.QueryClient({
                    defaultOptions: {
                        queries: {
                            retry: !1,
                            refetchOnMount: !1,
                            refetchOnWindowFocus: !1,
                            refetchOnReconnect: !1
                        }
                    }
                });
            Q(["Roblox", "core-scripts", "react"], g), Q("ReactUtilities", function(r) {
                for (var e = 1; e < arguments.length; e++) {
                    var t = null != arguments[e] ? arguments[e] : {},
                        n = Object.keys(t);
                    "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(t).filter(function(r) {
                        return Object.getOwnPropertyDescriptor(t, r).enumerable
                    }))), n.forEach(function(e) {
                        var n;
                        n = t[e], e in r ? Object.defineProperty(r, e, {
                            value: n,
                            enumerable: !0,
                            configurable: !0,
                            writable: !0
                        }) : r[e] = n
                    })
                }
                return r
            }({}, u)), Q(["RadixUI", "react-dismissable-layer"], i), Q(["RadixUI", "react-focus-guards"], a)
        }()
}(), window.Roblox && window.Roblox.BundleDetector && window.Roblox.BundleDetector.bundleDetected("ReactUtilities");
//# sourceMappingURL=https://sourcemaps.rbxcdn.com/reactUtilities-9ff0107bd507939c.js.map