! function() {
    try {
        var r = "u" > typeof window ? window : "u" > typeof global ? global : "u" > typeof globalThis ? globalThis : "u" > typeof self ? self : {};
        r.SENTRY_RELEASE = {
            id: "c4308a1c0507a2e9d81b507a1ac69b9772a2b9cf"
        };
        var e = (new r.Error).stack;
        e && (r._sentryDebugIds = r._sentryDebugIds || {}, r._sentryDebugIds[e] = "504e6cff-c145-4c21-8a12-c8086e49b01a", r._sentryDebugIdIdentifier = "sentry-dbid-504e6cff-c145-4c21-8a12-c8086e49b01a")
    } catch (r) {}
}(),
function() {
    var r = {
            982: function(r, e, t) {
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
                }), o(t(922), e), o(t(896), e), o(t(32), e), o(t(230), e)
            },
            922: function(r, e) {
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
            896: function(r, e) {
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
            32: function(r, e) {
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
            230: function(r, e) {
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
            611: function(r) {
                function e(r) {
                    return r && "u" > typeof Symbol && r.constructor === Symbol ? "symbol" : typeof r
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
            "u" > typeof Symbol && Symbol.toStringTag && Object.defineProperty(r, Symbol.toStringTag, {
                value: "Module"
            }), Object.defineProperty(r, "__esModule", {
                value: !0
            })
        }, t.rv = function() {
            return "1.7.12"
        }, t.ruid = "bundler=rspack@1.7.12",
        function() {
            "use strict";
            var r, e, n, o, i, a = {};
            t.r(a), t.d(a, {
                Branch: function() {
                    return Y
                },
                DismissableLayer: function() {
                    return N
                },
                DismissableLayerBranch: function() {
                    return H
                },
                Root: function() {
                    return U
                }
            });
            var u = {};
            t.r(u), t.d(u, {
                FocusGuards: function() {
                    return K
                },
                Root: function() {
                    return J
                },
                useFocusGuards: function() {
                    return $
                }
            });
            var g = {};
            t.r(g), t.d(g, {
                FocusScope: function() {
                    return ro
                },
                Root: function() {
                    return rl
                }
            });
            var c = {};
            t.r(c), t.d(c, {
                TranslationProvider: function() {
                    return rL
                },
                makeActionCreator: function() {
                    return r$
                },
                queryClient: function() {
                    return e1
                },
                renderWithErrorBoundary: function() {
                    return e2
                },
                useDebounce: function() {
                    return rV
                },
                useInterval: function() {
                    return rJ
                },
                useLocalStorage: function() {
                    return rQ
                },
                useOnClickOutside: function() {
                    return rZ
                },
                usePrevious: function() {
                    return r0
                },
                useTheme: function() {
                    return r7
                },
                useTokens: function() {
                    return r8
                },
                useTranslation: function() {
                    return rE
                },
                useWindowActiveState: function() {
                    return r5
                },
                withComponentStatus: function() {
                    return rq
                },
                withTranslations: function() {
                    return rD
                }
            });
            var l = {};
            t.r(l), t.d(l, {
                TranslationProvider: function() {
                    return rL
                },
                makeActionCreator: function() {
                    return r$
                },
                queryClient: function() {
                    return e1
                },
                renderWithErrorBoundary: function() {
                    return e2
                },
                useDebounce: function() {
                    return rV
                },
                useInterval: function() {
                    return rJ
                },
                useLocalStorage: function() {
                    return rQ
                },
                useOnClickOutside: function() {
                    return rZ
                },
                usePrevious: function() {
                    return r0
                },
                useTheme: function() {
                    return r7
                },
                useTokens: function() {
                    return r8
                },
                useTranslation: function() {
                    return rE
                },
                useWindowActiveState: function() {
                    return r5
                },
                withComponentStatus: function() {
                    return rq
                },
                withTranslations: function() {
                    return rD
                }
            });
            var b = window.React,
                s = t.n(b);

            function d(r, e) {
                var t = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {},
                    n = t.checkForDefaultPrevented,
                    o = void 0 === n || n;
                return function(t) {
                    if (null == r || r(t), !1 === o || !t.defaultPrevented) return null == e ? void 0 : e(t)
                }
            }
            var f = window.ReactDOM;

            function _(r, e) {
                (null == e || e > r.length) && (e = r.length);
                for (var t = 0, n = Array(e); t < e; t++) n[t] = r[t];
                return n
            }

            function S(r, e) {
                if ("function" == typeof r) return r(e);
                null != r && (r.current = e)
            }

            function p() {
                for (var r = arguments.length, e = Array(r), t = 0; t < r; t++) e[t] = arguments[t];
                return function(r) {
                    var t = !1,
                        n = e.map(function(e) {
                            var n = S(e, r);
                            return t || "function" != typeof n || (t = !0), n
                        });
                    if (t) return function() {
                        for (var r = 0; r < n.length; r++) {
                            var t = n[r];
                            "function" == typeof t ? t() : S(e[r], null)
                        }
                    }
                }
            }

            function h() {
                for (var r = arguments.length, e = Array(r), t = 0; t < r; t++) e[t] = arguments[t];
                return b.useCallback(p.apply(void 0, function(r) {
                    if (Array.isArray(r)) return _(r)
                }(e) || function(r) {
                    if ("u" > typeof Symbol && null != r[Symbol.iterator] || null != r["@@iterator"]) return Array.from(r)
                }(e) || function(r) {
                    if (r) {
                        if ("string" == typeof r) return _(r, void 0);
                        var e = Object.prototype.toString.call(r).slice(8, -1);
                        if ("Object" === e && r.constructor && (e = r.constructor.name), "Map" === e || "Set" === e) return Array.from(e);
                        if ("Arguments" === e || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(e)) return _(r, void 0)
                    }
                }(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()), e)
            }
            var y = window.ReactJSX;

            function m(r, e) {
                (null == e || e > r.length) && (e = r.length);
                for (var t = 0, n = Array(e); t < e; t++) n[t] = r[t];
                return n
            }

            function v(r) {
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

            function F(r, e) {
                return e = null != e ? e : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(r, Object.getOwnPropertyDescriptors(e)) : (function(r) {
                    var e = Object.keys(r);
                    if (Object.getOwnPropertySymbols) {
                        var t = Object.getOwnPropertySymbols(r);
                        e.push.apply(e, t)
                    }
                    return e
                })(Object(e)).forEach(function(t) {
                    Object.defineProperty(r, t, Object.getOwnPropertyDescriptor(e, t))
                }), r
            }

            function B(r, e) {
                if (null == r) return {};
                var t, n, o, i = {};
                if ("u" > typeof Reflect && Reflect.ownKeys) {
                    for (o = 0, t = Reflect.ownKeys(Object(r)); o < t.length; o++) n = t[o], !(e.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(r, n) && (i[n] = r[n]);
                    return i
                }
                if (i = function(r, e) {
                        if (null == r) return {};
                        var t, n, o = {},
                            i = Object.getOwnPropertyNames(r);
                        for (n = 0; n < i.length; n++) t = i[n], !(e.indexOf(t) >= 0) && Object.prototype.propertyIsEnumerable.call(r, t) && (o[t] = r[t]);
                        return o
                    }(r, e), Object.getOwnPropertySymbols)
                    for (o = 0, t = Object.getOwnPropertySymbols(r); o < t.length; o++) n = t[o], !(e.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(r, n) && (i[n] = r[n]);
                return i
            }

            function O(r) {
                return function(r) {
                    if (Array.isArray(r)) return m(r)
                }(r) || function(r) {
                    if ("u" > typeof Symbol && null != r[Symbol.iterator] || null != r["@@iterator"]) return Array.from(r)
                }(r) || function(r) {
                    if (r) {
                        if ("string" == typeof r) return m(r, void 0);
                        var e = Object.prototype.toString.call(r).slice(8, -1);
                        if ("Object" === e && r.constructor && (e = r.constructor.name), "Map" === e || "Set" === e) return Array.from(e);
                        if ("Arguments" === e || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(e)) return m(r, void 0)
                    }
                }(r) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var k = Symbol("radix.slottable");

            function w(r) {
                return b.isValidElement(r) && "function" == typeof r.type && "__radixId" in r.type && r.type.__radixId === k
            }

            function L(r, e, t) {
                return e in r ? Object.defineProperty(r, e, {
                    value: t,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : r[e] = t, r
            }

            function E(r) {
                for (var e = 1; e < arguments.length; e++) {
                    var t = null != arguments[e] ? arguments[e] : {},
                        n = Object.keys(t);
                    "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(t).filter(function(r) {
                        return Object.getOwnPropertyDescriptor(t, r).enumerable
                    }))), n.forEach(function(e) {
                        L(r, e, t[e])
                    })
                }
                return r
            }

            function z(r, e) {
                return e = null != e ? e : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(r, Object.getOwnPropertyDescriptors(e)) : (function(r) {
                    var e = Object.keys(r);
                    if (Object.getOwnPropertySymbols) {
                        var t = Object.getOwnPropertySymbols(r);
                        e.push.apply(e, t)
                    }
                    return e
                })(Object(e)).forEach(function(t) {
                    Object.defineProperty(r, t, Object.getOwnPropertyDescriptor(e, t))
                }), r
            }
            var P = ["a", "button", "div", "form", "h2", "h3", "img", "input", "label", "li", "nav", "ol", "p", "span", "svg", "ul"].reduce(function(r, e) {
                var t, n, o, i, a, u = (t = o = "Primitive.".concat(e), (n = b.forwardRef(function(r, e) {
                        var t = r.children,
                            n = B(r, ["children"]);
                        if (b.isValidElement(t)) {
                            var o, i, a, u, g, c = (g = (u = null == (i = Object.getOwnPropertyDescriptor((o = t).props, "ref")) ? void 0 : i.get) && "isReactWarning" in u && u.isReactWarning) ? o.ref : (g = (u = null == (a = Object.getOwnPropertyDescriptor(o, "ref")) ? void 0 : a.get) && "isReactWarning" in u && u.isReactWarning) ? o.props.ref : o.props.ref || o.ref,
                                l = function(r, e) {
                                    var t = v({}, e);
                                    for (var n in e) ! function(n) {
                                        var o = r[n],
                                            i = e[n];
                                        /^on[A-Z]/.test(n) ? o && i ? t[n] = function() {
                                            for (var r = arguments.length, e = Array(r), t = 0; t < r; t++) e[t] = arguments[t];
                                            i.apply(void 0, O(e)), o.apply(void 0, O(e))
                                        } : o && (t[n] = o) : "style" === n ? t[n] = v({}, o, i) : "className" === n && (t[n] = [o, i].filter(Boolean).join(" "))
                                    }(n);
                                    return v({}, r, t)
                                }(n, t.props);
                            return t.type !== b.Fragment && (l.ref = e ? p(e, c) : c), b.cloneElement(t, l)
                        }
                        return b.Children.count(t) > 1 ? b.Children.only(null) : null
                    })).displayName = "".concat(t, ".SlotClone"), i = n, (a = b.forwardRef(function(r, e) {
                        var t = r.children,
                            n = B(r, ["children"]),
                            o = b.Children.toArray(t),
                            a = o.find(w);
                        if (a) {
                            var u = a.props.children,
                                g = o.map(function(r) {
                                    return r !== a ? r : b.Children.count(u) > 1 ? b.Children.only(null) : b.isValidElement(u) ? u.props.children : null
                                });
                            return (0, y.jsx)(i, F(v({}, n), {
                                ref: e,
                                children: b.isValidElement(u) ? b.cloneElement(u, void 0, g) : null
                            }))
                        }
                        return (0, y.jsx)(i, F(v({}, n), {
                            ref: e,
                            children: t
                        }))
                    })).displayName = "".concat(o, ".Slot"), a),
                    g = b.forwardRef(function(r, t) {
                        var n = r.asChild,
                            o = function(r, e) {
                                if (null == r) return {};
                                var t, n, o, i = {};
                                if ("u" > typeof Reflect && Reflect.ownKeys) {
                                    for (o = 0, t = Reflect.ownKeys(Object(r)); o < t.length; o++) n = t[o], !(e.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(r, n) && (i[n] = r[n]);
                                    return i
                                }
                                if (i = function(r, e) {
                                        if (null == r) return {};
                                        var t, n, o = {},
                                            i = Object.getOwnPropertyNames(r);
                                        for (n = 0; n < i.length; n++) t = i[n], !(e.indexOf(t) >= 0) && Object.prototype.propertyIsEnumerable.call(r, t) && (o[t] = r[t]);
                                        return o
                                    }(r, e), Object.getOwnPropertySymbols)
                                    for (o = 0, t = Object.getOwnPropertySymbols(r); o < t.length; o++) n = t[o], !(e.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(r, n) && (i[n] = r[n]);
                                return i
                            }(r, ["asChild"]),
                            i = n ? u : e;
                        return "u" > typeof window && (window[Symbol.for("radix-ui")] = !0), (0, y.jsx)(i, z(E({}, o), {
                            ref: t
                        }))
                    });
                return g.displayName = "Primitive.".concat(e), z(E({}, r), L({}, e, g))
            }, {});

            function A(r, e) {
                (null == e || e > r.length) && (e = r.length);
                for (var t = 0, n = Array(e); t < e; t++) n[t] = r[t];
                return n
            }

            function M(r) {
                var e = b.useRef(r);
                return b.useEffect(function() {
                    e.current = r
                }), b.useMemo(function() {
                    return function() {
                        for (var r, t = arguments.length, n = Array(t), o = 0; o < t; o++) n[o] = arguments[o];
                        return null == (r = e.current) ? void 0 : r.call.apply(r, [e].concat(function(r) {
                            if (Array.isArray(r)) return A(r)
                        }(n) || function(r) {
                            if ("u" > typeof Symbol && null != r[Symbol.iterator] || null != r["@@iterator"]) return Array.from(r)
                        }(n) || function(r) {
                            if (r) {
                                if ("string" == typeof r) return A(r, void 0);
                                var e = Object.prototype.toString.call(r).slice(8, -1);
                                if ("Object" === e && r.constructor && (e = r.constructor.name), "Map" === e || "Set" === e) return Array.from(e);
                                if ("Arguments" === e || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(e)) return A(r, void 0)
                            }
                        }(n) || function() {
                            throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                        }()))
                    }
                }, [])
            }

            function j(r, e) {
                (null == e || e > r.length) && (e = r.length);
                for (var t = 0, n = Array(e); t < e; t++) n[t] = r[t];
                return n
            }

            function I(r) {
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

            function T(r, e) {
                return e = null != e ? e : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(r, Object.getOwnPropertyDescriptors(e)) : (function(r) {
                    var e = Object.keys(r);
                    if (Object.getOwnPropertySymbols) {
                        var t = Object.getOwnPropertySymbols(r);
                        e.push.apply(e, t)
                    }
                    return e
                })(Object(e)).forEach(function(t) {
                    Object.defineProperty(r, t, Object.getOwnPropertyDescriptor(e, t))
                }), r
            }

            function W(r, e) {
                return function(r) {
                    if (Array.isArray(r)) return r
                }(r) || function(r, e) {
                    var t, n, o = null == r ? null : "u" > typeof Symbol && r[Symbol.iterator] || r["@@iterator"];
                    if (null != o) {
                        var i = [],
                            a = !0,
                            u = !1;
                        try {
                            for (o = o.call(r); !(a = (t = o.next()).done) && (i.push(t.value), !e || i.length !== e); a = !0);
                        } catch (r) {
                            u = !0, n = r
                        } finally {
                            try {
                                a || null == o.return || o.return()
                            } finally {
                                if (u) throw n
                            }
                        }
                        return i
                    }
                }(r, e) || C(r, e) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function D(r) {
                return function(r) {
                    if (Array.isArray(r)) return j(r)
                }(r) || function(r) {
                    if ("u" > typeof Symbol && null != r[Symbol.iterator] || null != r["@@iterator"]) return Array.from(r)
                }(r) || C(r) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function C(r, e) {
                if (r) {
                    if ("string" == typeof r) return j(r, e);
                    var t = Object.prototype.toString.call(r).slice(8, -1);
                    if ("Object" === t && r.constructor && (t = r.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                    if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return j(r, e)
                }
            }
            var R = "dismissableLayer.update",
                x = b.createContext({
                    layers: new Set,
                    layersWithOutsidePointerEventsDisabled: new Set,
                    branches: new Set
                }),
                N = b.forwardRef(function(r, t) {
                    var n, o, i = r.disableOutsidePointerEvents,
                        a = void 0 !== i && i,
                        u = r.onEscapeKeyDown,
                        g = r.onPointerDownOutside,
                        c = r.onFocusOutside,
                        l = r.onInteractOutside,
                        s = r.onDismiss,
                        f = function(r, e) {
                            if (null == r) return {};
                            var t, n, o, i = {};
                            if ("u" > typeof Reflect && Reflect.ownKeys) {
                                for (o = 0, t = Reflect.ownKeys(Object(r)); o < t.length; o++) n = t[o], !(e.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(r, n) && (i[n] = r[n]);
                                return i
                            }
                            if (i = function(r, e) {
                                    if (null == r) return {};
                                    var t, n, o = {},
                                        i = Object.getOwnPropertyNames(r);
                                    for (n = 0; n < i.length; n++) t = i[n], !(e.indexOf(t) >= 0) && Object.prototype.propertyIsEnumerable.call(r, t) && (o[t] = r[t]);
                                    return o
                                }(r, e), Object.getOwnPropertySymbols)
                                for (o = 0, t = Object.getOwnPropertySymbols(r); o < t.length; o++) n = t[o], !(e.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(r, n) && (i[n] = r[n]);
                            return i
                        }(r, ["disableOutsidePointerEvents", "onEscapeKeyDown", "onPointerDownOutside", "onFocusOutside", "onInteractOutside", "onDismiss"]),
                        _ = b.useContext(x),
                        S = W(b.useState(null), 2),
                        p = S[0],
                        m = S[1],
                        v = null != (n = null == p ? void 0 : p.ownerDocument) ? n : null == (o = globalThis) ? void 0 : o.document,
                        F = W(b.useState({}), 2)[1],
                        B = h(t, function(r) {
                            return m(r)
                        }),
                        O = Array.from(_.layers),
                        k = W(D(_.layersWithOutsidePointerEventsDisabled).slice(-1), 1)[0],
                        w = O.indexOf(k),
                        L = p ? O.indexOf(p) : -1,
                        E = _.layersWithOutsidePointerEventsDisabled.size > 0,
                        z = L >= w,
                        A = function(r) {
                            var e, t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : null == (e = globalThis) ? void 0 : e.document,
                                n = M(r),
                                o = b.useRef(!1),
                                i = b.useRef(function() {});
                            return b.useEffect(function() {
                                var r = function(r) {
                                        if (r.target && !o.current) {
                                            var e = function() {
                                                    X("dismissableLayer.pointerDownOutside", n, a, {
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
                                t = D(_.branches).some(function(r) {
                                    return r.contains(e)
                                });
                            z && !t && (null == g || g(r), null == l || l(r), r.defaultPrevented || null == s || s())
                        }, v),
                        j = function(r) {
                            var e, t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : null == (e = globalThis) ? void 0 : e.document,
                                n = M(r),
                                o = b.useRef(!1);
                            return b.useEffect(function() {
                                var r = function(r) {
                                    r.target && !o.current && X("dismissableLayer.focusOutside", n, {
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
                            !D(_.branches).some(function(r) {
                                return r.contains(e)
                            }) && (null == c || c(r), null == l || l(r), r.defaultPrevented || null == s || s())
                        }, v);
                    return ! function(r) {
                        var e, t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : null == (e = globalThis) ? void 0 : e.document,
                            n = M(r);
                        b.useEffect(function() {
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
                        L === _.layers.size - 1 && (null == u || u(r), !r.defaultPrevented && s && (r.preventDefault(), s()))
                    }, v), b.useEffect(function() {
                        if (p) return a && (0 === _.layersWithOutsidePointerEventsDisabled.size && (e = v.body.style.pointerEvents, v.body.style.pointerEvents = "none"), _.layersWithOutsidePointerEventsDisabled.add(p)), _.layers.add(p), G(),
                            function() {
                                a && 1 === _.layersWithOutsidePointerEventsDisabled.size && (v.body.style.pointerEvents = e)
                            }
                    }, [p, v, a, _]), b.useEffect(function() {
                        return function() {
                            p && (_.layers.delete(p), _.layersWithOutsidePointerEventsDisabled.delete(p), G())
                        }
                    }, [p, _]), b.useEffect(function() {
                        var r = function() {
                            return F({})
                        };
                        return document.addEventListener(R, r),
                            function() {
                                return document.removeEventListener(R, r)
                            }
                    }, []), (0, y.jsx)(P.div, T(I({}, f), {
                        ref: B,
                        style: I({
                            pointerEvents: E ? z ? "auto" : "none" : void 0
                        }, r.style),
                        onFocusCapture: d(r.onFocusCapture, j.onFocusCapture),
                        onBlurCapture: d(r.onBlurCapture, j.onBlurCapture),
                        onPointerDownCapture: d(r.onPointerDownCapture, A.onPointerDownCapture)
                    }))
                });
            N.displayName = "DismissableLayer";
            var H = b.forwardRef(function(r, e) {
                var t = b.useContext(x),
                    n = b.useRef(null),
                    o = h(e, n);
                return b.useEffect(function() {
                    var r = n.current;
                    if (r) return t.branches.add(r),
                        function() {
                            t.branches.delete(r)
                        }
                }, [t.branches]), (0, y.jsx)(P.div, T(I({}, r), {
                    ref: o
                }))
            });

            function G() {
                var r = new CustomEvent(R);
                document.dispatchEvent(r)
            }

            function X(r, e, t, n) {
                var o = n.discrete,
                    i = t.originalEvent.target,
                    a = new CustomEvent(r, {
                        bubbles: !1,
                        cancelable: !0,
                        detail: t
                    });
                (e && i.addEventListener(r, e, {
                    once: !0
                }), o) ? i && f.flushSync(function() {
                    return i.dispatchEvent(a)
                }): i.dispatchEvent(a)
            }
            H.displayName = "DismissableLayerBranch";
            var U = N,
                Y = H,
                q = 0;

            function K(r) {
                return $(), r.children
            }

            function $() {
                b.useEffect(function() {
                    var r, e, t = document.querySelectorAll("[data-radix-focus-guard]");
                    return document.body.insertAdjacentElement("afterbegin", null != (r = t[0]) ? r : V()), document.body.insertAdjacentElement("beforeend", null != (e = t[1]) ? e : V()), q++,
                        function() {
                            1 === q && document.querySelectorAll("[data-radix-focus-guard]").forEach(function(r) {
                                return r.remove()
                            }), q--
                        }
                }, [])
            }

            function V() {
                var r = document.createElement("span");
                return r.setAttribute("data-radix-focus-guard", ""), r.tabIndex = 0, r.style.outline = "none", r.style.opacity = "0", r.style.position = "fixed", r.style.pointerEvents = "none", r
            }
            var J = K;

            function Q(r, e) {
                (null == e || e > r.length) && (e = r.length);
                for (var t = 0, n = Array(e); t < e; t++) n[t] = r[t];
                return n
            }

            function Z(r, e) {
                return function(r) {
                    if (Array.isArray(r)) return r
                }(r) || function(r, e) {
                    var t, n, o = null == r ? null : "u" > typeof Symbol && r[Symbol.iterator] || r["@@iterator"];
                    if (null != o) {
                        var i = [],
                            a = !0,
                            u = !1;
                        try {
                            for (o = o.call(r); !(a = (t = o.next()).done) && (i.push(t.value), !e || i.length !== e); a = !0);
                        } catch (r) {
                            u = !0, n = r
                        } finally {
                            try {
                                a || null == o.return || o.return()
                            } finally {
                                if (u) throw n
                            }
                        }
                        return i
                    }
                }(r, e) || rr(r, e) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function rr(r, e) {
                if (r) {
                    if ("string" == typeof r) return Q(r, e);
                    var t = Object.prototype.toString.call(r).slice(8, -1);
                    if ("Object" === t && r.constructor && (t = r.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                    if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return Q(r, e)
                }
            }
            var re = "focusScope.autoFocusOnMount",
                rt = "focusScope.autoFocusOnUnmount",
                rn = {
                    bubbles: !1,
                    cancelable: !0
                },
                ro = b.forwardRef(function(r, e) {
                    var t, n, o = r.loop,
                        i = void 0 !== o && o,
                        a = r.trapped,
                        u = void 0 !== a && a,
                        g = r.onMountAutoFocus,
                        c = r.onUnmountAutoFocus,
                        l = function(r, e) {
                            if (null == r) return {};
                            var t, n, o, i = {};
                            if ("u" > typeof Reflect && Reflect.ownKeys) {
                                for (o = 0, t = Reflect.ownKeys(Object(r)); o < t.length; o++) n = t[o], !(e.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(r, n) && (i[n] = r[n]);
                                return i
                            }
                            if (i = function(r, e) {
                                    if (null == r) return {};
                                    var t, n, o = {},
                                        i = Object.getOwnPropertyNames(r);
                                    for (n = 0; n < i.length; n++) t = i[n], !(e.indexOf(t) >= 0) && Object.prototype.propertyIsEnumerable.call(r, t) && (o[t] = r[t]);
                                    return o
                                }(r, e), Object.getOwnPropertySymbols)
                                for (o = 0, t = Object.getOwnPropertySymbols(r); o < t.length; o++) n = t[o], !(e.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(r, n) && (i[n] = r[n]);
                            return i
                        }(r, ["loop", "trapped", "onMountAutoFocus", "onUnmountAutoFocus"]),
                        s = Z(b.useState(null), 2),
                        d = s[0],
                        f = s[1],
                        _ = M(g),
                        S = M(c),
                        p = b.useRef(null),
                        m = h(e, function(r) {
                            return f(r)
                        }),
                        v = b.useRef({
                            paused: !1,
                            pause: function() {
                                this.paused = !0
                            },
                            resume: function() {
                                this.paused = !1
                            }
                        }).current;
                    b.useEffect(function() {
                        if (u) {
                            var r = function(r) {
                                    if (!v.paused && d) {
                                        var e = r.target;
                                        d.contains(e) ? p.current = e : ru(p.current, {
                                            select: !0
                                        })
                                    }
                                },
                                e = function(r) {
                                    if (!v.paused && d) {
                                        var e = r.relatedTarget;
                                        null !== e && (d.contains(e) || ru(p.current, {
                                            select: !0
                                        }))
                                    }
                                };
                            document.addEventListener("focusin", r), document.addEventListener("focusout", e);
                            var t = new MutationObserver(function(r) {
                                if (document.activeElement === document.body) {
                                    var e = !0,
                                        t = !1,
                                        n = void 0;
                                    try {
                                        for (var o, i = r[Symbol.iterator](); !(e = (o = i.next()).done); e = !0) o.value.removedNodes.length > 0 && ru(d)
                                    } catch (r) {
                                        t = !0, n = r
                                    } finally {
                                        try {
                                            e || null == i.return || i.return()
                                        } finally {
                                            if (t) throw n
                                        }
                                    }
                                }
                            });
                            return d && t.observe(d, {
                                    childList: !0,
                                    subtree: !0
                                }),
                                function() {
                                    document.removeEventListener("focusin", r), document.removeEventListener("focusout", e), t.disconnect()
                                }
                        }
                    }, [u, d, v.paused]), b.useEffect(function() {
                        if (d) {
                            rg.add(v);
                            var r = document.activeElement;
                            if (!d.contains(r)) {
                                var e = new CustomEvent(re, rn);
                                d.addEventListener(re, _), d.dispatchEvent(e), e.defaultPrevented || (function(r) {
                                    var e = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {},
                                        t = e.select,
                                        n = void 0 !== t && t,
                                        o = document.activeElement,
                                        i = !0,
                                        a = !1,
                                        u = void 0;
                                    try {
                                        for (var g, c = r[Symbol.iterator](); !(i = (g = c.next()).done); i = !0) {
                                            var l = g.value;
                                            if (ru(l, {
                                                    select: n
                                                }), document.activeElement !== o) return
                                        }
                                    } catch (r) {
                                        a = !0, u = r
                                    } finally {
                                        try {
                                            i || null == c.return || c.return()
                                        } finally {
                                            if (a) throw u
                                        }
                                    }
                                }(ri(d).filter(function(r) {
                                    return "A" !== r.tagName
                                }), {
                                    select: !0
                                }), document.activeElement === r && ru(d))
                            }
                            return function() {
                                d.removeEventListener(re, _), setTimeout(function() {
                                    var e = new CustomEvent(rt, rn);
                                    d.addEventListener(rt, S), d.dispatchEvent(e), e.defaultPrevented || ru(null != r ? r : document.body, {
                                        select: !0
                                    }), d.removeEventListener(rt, S), rg.remove(v)
                                }, 0)
                            }
                        }
                    }, [d, _, S, v]);
                    var F = b.useCallback(function(r) {
                        if ((i || u) && !v.paused) {
                            var e = "Tab" === r.key && !r.altKey && !r.ctrlKey && !r.metaKey,
                                t = document.activeElement;
                            if (e && t) {
                                var n, o, a = r.currentTarget,
                                    g = Z([ra(o = ri(n = a), n), ra(o.reverse(), n)], 2),
                                    c = g[0],
                                    l = g[1];
                                c && l ? r.shiftKey || t !== l ? r.shiftKey && t === c && (r.preventDefault(), i && ru(l, {
                                    select: !0
                                })) : (r.preventDefault(), i && ru(c, {
                                    select: !0
                                })) : t === a && r.preventDefault()
                            }
                        }
                    }, [i, u, v.paused]);
                    return (0, y.jsx)(P.div, (t = function(r) {
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
                    }({
                        tabIndex: -1
                    }, l), n = n = {
                        ref: m,
                        onKeyDown: F
                    }, Object.getOwnPropertyDescriptors ? Object.defineProperties(t, Object.getOwnPropertyDescriptors(n)) : (function(r) {
                        var e = Object.keys(r);
                        if (Object.getOwnPropertySymbols) {
                            var t = Object.getOwnPropertySymbols(r);
                            e.push.apply(e, t)
                        }
                        return e
                    })(Object(n)).forEach(function(r) {
                        Object.defineProperty(t, r, Object.getOwnPropertyDescriptor(n, r))
                    }), t))
                });

            function ri(r) {
                for (var e = [], t = document.createTreeWalker(r, NodeFilter.SHOW_ELEMENT, {
                        acceptNode: function(r) {
                            var e = "INPUT" === r.tagName && "hidden" === r.type;
                            return r.disabled || r.hidden || e ? NodeFilter.FILTER_SKIP : r.tabIndex >= 0 ? NodeFilter.FILTER_ACCEPT : NodeFilter.FILTER_SKIP
                        }
                    }); t.nextNode();) e.push(t.currentNode);
                return e
            }

            function ra(r, e) {
                var t = !0,
                    n = !1,
                    o = void 0;
                try {
                    for (var i, a = r[Symbol.iterator](); !(t = (i = a.next()).done); t = !0) {
                        var u = i.value;
                        if (! function(r, e) {
                                var t = e.upTo;
                                if ("hidden" === getComputedStyle(r).visibility) return !0;
                                for (; r && (void 0 === t || r !== t);) {
                                    if ("none" === getComputedStyle(r).display) return !0;
                                    r = r.parentElement
                                }
                                return !1
                            }(u, {
                                upTo: e
                            })) return u
                    }
                } catch (r) {
                    n = !0, o = r
                } finally {
                    try {
                        t || null == a.return || a.return()
                    } finally {
                        if (n) throw o
                    }
                }
            }

            function ru(r) {
                var e = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {},
                    t = e.select;
                if (r && r.focus) {
                    var n, o, i, a = document.activeElement;
                    r.focus({
                        preventScroll: !0
                    }), r !== a && (o = n = r, null != (i = HTMLInputElement) && "u" > typeof Symbol && i[Symbol.hasInstance] ? !!i[Symbol.hasInstance](o) : o instanceof i) && "select" in n && void 0 !== t && t && r.select()
                }
            }
            ro.displayName = "FocusScope";
            var rg = (r = [], {
                add: function(e) {
                    var t = r[0];
                    e !== t && (null == t || t.pause()), (r = rc(r, e)).unshift(e)
                },
                remove: function(e) {
                    var t;
                    null == (t = (r = rc(r, e))[0]) || t.resume()
                }
            });

            function rc(r, e) {
                var t = function(r) {
                        if (Array.isArray(r)) return Q(r)
                    }(r) || function(r) {
                        if ("u" > typeof Symbol && null != r[Symbol.iterator] || null != r["@@iterator"]) return Array.from(r)
                    }(r) || rr(r) || function() {
                        throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                    }(),
                    n = t.indexOf(e);
                return -1 !== n && t.splice(n, 1), t
            }
            var rl = ro;

            function rb(r, e) {
                (null == e || e > r.length) && (e = r.length);
                for (var t = 0, n = Array(e); t < e; t++) n[t] = r[t];
                return n
            }
            var rs = function(r, e) {
                    var t = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : window;
                    if ("string" == typeof r) t[r] = e;
                    else {
                        var n = function(r) {
                                if (Array.isArray(r)) return rb(r)
                            }(r) || function(r) {
                                if ("u" > typeof Symbol && null != r[Symbol.iterator] || null != r["@@iterator"]) return Array.from(r)
                            }(r) || function(r) {
                                if (r) {
                                    if ("string" == typeof r) return rb(r, void 0);
                                    var e = Object.prototype.toString.call(r).slice(8, -1);
                                    if ("Object" === e && r.constructor && (e = r.constructor.name), "Map" === e || "Set" === e) return Array.from(e);
                                    if ("Arguments" === e || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(e)) return rb(r, void 0)
                                }
                            }(r) || function() {
                                throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                            }(),
                            o = n.pop(),
                            i = t,
                            a = !0,
                            u = !1,
                            g = void 0;
                        try {
                            for (var c, l = n[Symbol.iterator](); !(a = (c = l.next()).done); a = !0) {
                                var b, s = c.value;
                                null != (b = i)[s] || (b[s] = {}), i = i[s]
                            }
                        } catch (r) {
                            u = !0, g = r
                        } finally {
                            try {
                                a || null == l.return || l.return()
                            } finally {
                                if (u) throw g
                            }
                        }
                        i[o] = e
                    }
                },
                rd = function(r, e) {
                    rs(r, e)
                },
                rf = window.TanstackQuery,
                r_ = window.Roblox["core-scripts"].intl.intl,
                rS = t.n(r_),
                rp = window.Roblox["core-scripts"].intl.translation;

            function rh(r, e) {
                (null == e || e > r.length) && (e = r.length);
                for (var t = 0, n = Array(e); t < e; t++) n[t] = r[t];
                return n
            }

            function ry(r) {
                return function(r) {
                    if (Array.isArray(r)) return rh(r)
                }(r) || function(r) {
                    if ("u" > typeof Symbol && null != r[Symbol.iterator] || null != r["@@iterator"]) return Array.from(r)
                }(r) || function(r) {
                    if (r) {
                        if ("string" == typeof r) return rh(r, void 0);
                        var e = Object.prototype.toString.call(r).slice(8, -1);
                        if ("Object" === e && r.constructor && (e = r.constructor.name), "Map" === e || "Set" === e) return Array.from(e);
                        if ("Arguments" === e || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(e)) return rh(r, void 0)
                    }
                }(r) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var rm = function(r) {
                    return 2 === r.split(".").length
                },
                rv = function(r) {
                    return Array.isArray(r) && r.every(function(r) {
                        return "string" == typeof r
                    })
                },
                rF = function(r) {
                    var e = r.common,
                        t = r.feature,
                        n = r.features;
                    if (!rv(e) || void 0 !== t && void 0 !== n || null != t && "string" != typeof t || null != n && !rv(n)) throw Error("Invalid namespaces config!");
                    return ry(e).concat(ry(null == t ? [] : [t]), ry(null != n ? n : [])).filter(rm)
                },
                rB = function(r) {
                    if (!Array.isArray(r)) return rF(r);
                    if (rv(r)) return r.filter(rm);
                    throw TypeError("Translation Config must be an array of strings.")
                };

            function rO(r, e) {
                (null == e || e > r.length) && (e = r.length);
                for (var t = 0, n = Array(e); t < e; t++) n[t] = r[t];
                return n
            }
            var rk = function(r, e) {
                    var t = rB(r),
                        n = new(rS()),
                        o = new rp.TranslationResourceProvider(n),
                        i = t.map(function(r) {
                            return o.getTranslationResource(r)
                        }),
                        a = o.mergeTranslationResources.apply(o, function(r) {
                            if (Array.isArray(r)) return rO(r)
                        }(i) || function(r) {
                            if ("u" > typeof Symbol && null != r[Symbol.iterator] || null != r["@@iterator"]) return Array.from(r)
                        }(i) || function(r) {
                            if (r) {
                                if ("string" == typeof r) return rO(r, void 0);
                                var e = Object.prototype.toString.call(r).slice(8, -1);
                                if ("Object" === e && r.constructor && (e = r.constructor.name), "Map" === e || "Set" === e) return Array.from(e);
                                if ("Arguments" === e || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(e)) return rO(r, void 0)
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
                rw = (0, b.createContext)(void 0);

            function rL(r) {
                var e = r.config,
                    t = r.children,
                    n = r.onEmptyString;
                return (0, y.jsx)(rw.Provider, {
                    value: rk(e, n),
                    children: t
                })
            }
            var rE = function() {
                var r = (0, b.useContext)(rw);
                if (!r) throw Error("invalid use of `useTranslation` hook. Ensure your component has an ancestor wrapped in `TranslationProvider`");
                return r
            };

            function rz(r, e) {
                (null == e || e > r.length) && (e = r.length);
                for (var t = 0, n = Array(e); t < e; t++) n[t] = r[t];
                return n
            }
            var rP = function(r, e) {
                    return "".concat(e, "(").concat(r.displayName || r.name || "Component", ")")
                },
                rA = function(r) {
                    var e = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : "withHOC";
                    return function(t) {
                        for (var n = arguments.length, o = Array(n > 1 ? n - 1 : 0), i = 1; i < n; i++) o[i - 1] = arguments[i];
                        var a = r.apply(void 0, [t].concat(function(r) {
                            if (Array.isArray(r)) return rz(r)
                        }(o) || function(r) {
                            if ("u" > typeof Symbol && null != r[Symbol.iterator] || null != r["@@iterator"]) return Array.from(r)
                        }(o) || function(r) {
                            if (r) {
                                if ("string" == typeof r) return rz(r, void 0);
                                var e = Object.prototype.toString.call(r).slice(8, -1);
                                if ("Object" === e && r.constructor && (e = r.constructor.name), "Map" === e || "Set" === e) return Array.from(e);
                                if ("Arguments" === e || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(e)) return rz(r, void 0)
                            }
                        }(o) || function() {
                            throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                        }()));
                        return a.displayName = rP(t, e), a
                    }
                };

            function rM(r, e) {
                (null == e || e > r.length) && (e = r.length);
                for (var t = 0, n = Array(e); t < e; t++) n[t] = r[t];
                return n
            }

            function rj(r, e, t) {
                return e in r ? Object.defineProperty(r, e, {
                    value: t,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : r[e] = t, r
            }

            function rI(r) {
                return (rI = Object.setPrototypeOf ? Object.getPrototypeOf : function(r) {
                    return r.__proto__ || Object.getPrototypeOf(r)
                })(r)
            }

            function rT(r, e) {
                return (rT = Object.setPrototypeOf || function(r, e) {
                    return r.__proto__ = e, r
                })(r, e)
            }

            function rW() {
                try {
                    var r = !Boolean.prototype.valueOf.call(Reflect.construct(Boolean, [], function() {}))
                } catch (r) {}
                return (rW = function() {
                    return !!r
                })()
            }
            var rD = rA(function(r, e) {
                    var t = rB(e);
                    return function(e) {
                        var n;
                        if ("function" != typeof e && null !== e) throw TypeError("Super expression must either be null or a function");

                        function o(r) {
                            if (!(this instanceof o)) throw TypeError("Cannot call a class as a function");
                            e = o, n = [r], e = rI(e), rj(i = function(r, e) {
                                var t;
                                if (e && ("object" == ((t = e) && "u" > typeof Symbol && t.constructor === Symbol ? "symbol" : typeof t) || "function" == typeof e)) return e;
                                if (void 0 === r) throw ReferenceError("this hasn't been initialised - super() hasn't been called");
                                return r
                            }(this, rW() ? Reflect.construct(e, n || [], rI(this).constructor) : e.apply(this, n)), "intl", void 0), i.intl = new(rS()), i.translate = i.translate.bind(i);
                            var e, n, i, a = new rp.TranslationResourceProvider(i.intl),
                                u = t.map(function(r) {
                                    return a.getTranslationResource(r)
                                });
                            return i.state = {
                                languageResources: a.mergeTranslationResources.apply(a, function(r) {
                                    if (Array.isArray(r)) return rM(r)
                                }(u) || function(r) {
                                    if ("u" > typeof Symbol && null != r[Symbol.iterator] || null != r["@@iterator"]) return Array.from(r)
                                }(u) || function(r) {
                                    if (r) {
                                        if ("string" == typeof r) return rM(r, void 0);
                                        var e = Object.prototype.toString.call(r).slice(8, -1);
                                        if ("Object" === e && r.constructor && (e = r.constructor.name), "Map" === e || "Set" === e) return Array.from(e);
                                        if ("Arguments" === e || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(e)) return rM(r, void 0)
                                    }
                                }(u) || function() {
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
                            }), e && rT(o, e), n = [{
                                key: "translate",
                                value: function(r, e) {
                                    return this.state.languageResources.get(r, e)
                                }
                            }, {
                                key: "render",
                                value: function() {
                                    var e, t, n = this;
                                    return (0, y.jsx)(r, (e = function(r) {
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
                                    }({}, this.props), t = t = {
                                        translate: function(r, e) {
                                            return n.translate(r, e)
                                        },
                                        intl: this.intl
                                    }, Object.getOwnPropertyDescriptors ? Object.defineProperties(e, Object.getOwnPropertyDescriptors(t)) : (function(r) {
                                        var e = Object.keys(r);
                                        if (Object.getOwnPropertySymbols) {
                                            var t = Object.getOwnPropertySymbols(r);
                                            e.push.apply(e, t)
                                        }
                                        return e
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
                    }(s().Component)
                }, "withTranslations"),
                rC = window.PropTypes,
                rR = t.n(rC),
                rx = t(611),
                rN = t.n(rx),
                rH = function(r, e) {
                    console.warn("The following exception has been caught with the captured component stack:"), console.group(), console.info("".concat(r)), console.info("".concat(e.componentStack)), console.groupEnd()
                };

            function rG(r, e) {
                for (var t = 0; t < e.length; t++) {
                    var n = e[t];
                    n.enumerable = n.enumerable || !1, n.configurable = !0, "value" in n && (n.writable = !0), Object.defineProperty(r, n.key, n)
                }
            }

            function rX(r) {
                return (rX = Object.setPrototypeOf ? Object.getPrototypeOf : function(r) {
                    return r.__proto__ || Object.getPrototypeOf(r)
                })(r)
            }

            function rU(r, e) {
                return (rU = Object.setPrototypeOf || function(r, e) {
                    return r.__proto__ = e, r
                })(r, e)
            }

            function rY() {
                try {
                    var r = !Boolean.prototype.valueOf.call(Reflect.construct(Boolean, [], function() {}))
                } catch (r) {}
                return (rY = function() {
                    return !!r
                })()
            }
            var rq = rA(function(r) {
                var e = function(e) {
                    var t, n;
                    if ("function" != typeof e && null !== e) throw TypeError("Super expression must either be null or a function");

                    function o(r) {
                        if (!(this instanceof o)) throw TypeError("Cannot call a class as a function");
                        e = o, t = [r], e = rX(e);
                        var e, t, n, i = (n = function(r, e) {
                            var t;
                            if (e && ("object" == ((t = e) && "u" > typeof Symbol && t.constructor === Symbol ? "symbol" : typeof t) || "function" == typeof e)) return e;
                            if (void 0 === r) throw ReferenceError("this hasn't been initialised - super() hasn't been called");
                            return r
                        }(this, rY() ? Reflect.construct(e, t || [], rX(this).constructor) : e.apply(this, t))).props.showAppOnInit;
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
                    }), e && rU(o, e), n = [{
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
                            rH(r, e)
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
                                u = i.errorStates,
                                g = function(r, e) {
                                    if (null == r) return {};
                                    var t, n, o, i = {};
                                    if ("u" > typeof Reflect && Reflect.ownKeys) {
                                        for (o = 0, t = Reflect.ownKeys(Object(r)); o < t.length; o++) n = t[o], !(e.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(r, n) && (i[n] = r[n]);
                                        return i
                                    }
                                    if (i = function(r, e) {
                                            if (null == r) return {};
                                            var t, n, o = {},
                                                i = Object.getOwnPropertyNames(r);
                                            for (n = 0; n < i.length; n++) t = i[n], !(e.indexOf(t) >= 0) && Object.prototype.propertyIsEnumerable.call(r, t) && (o[t] = r[t]);
                                            return o
                                        }(r, e), Object.getOwnPropertySymbols)
                                        for (o = 0, t = Object.getOwnPropertySymbols(r); o < t.length; o++) n = t[o], !(e.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(r, n) && (i[n] = r[n]);
                                    return i
                                }(i, ["defaultMessage", "errorStates"]),
                                c = this.state,
                                l = c.isLoading,
                                b = c.hasError,
                                s = c.errorState;
                            b ? n = (0, y.jsx)("h3", {
                                children: u[s] ? u[s] : a
                            }) : (n = (0, y.jsx)("span", {
                                className: "spinner spinner-default"
                            }), o = (0, y.jsx)(r, (e = function(r) {
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
                            }({}, g), t = t = {
                                isLoading: l,
                                hasError: b,
                                errorState: s,
                                onLoadStart: this.onLoadStart,
                                onLoadEnd: this.onLoadEnd,
                                onError: this.onError
                            }, Object.getOwnPropertyDescriptors ? Object.defineProperties(e, Object.getOwnPropertyDescriptors(t)) : (function(r) {
                                var e = Object.keys(r);
                                if (Object.getOwnPropertySymbols) {
                                    var t = Object.getOwnPropertySymbols(r);
                                    e.push.apply(e, t)
                                }
                                return e
                            })(Object(t)).forEach(function(r) {
                                Object.defineProperty(e, r, Object.getOwnPropertyDescriptor(t, r))
                            }), e)));
                            var d = b || l,
                                f = rN()("component-status-container", {
                                    hidden: !d
                                }),
                                _ = rN()("component-container", {
                                    hidden: d
                                });
                            return (0, y.jsxs)("div", {
                                className: "component-status",
                                children: [(0, y.jsx)("div", {
                                    className: f,
                                    children: n
                                }), (0, y.jsx)("div", {
                                    className: _,
                                    children: o
                                })]
                            })
                        }
                    }], rG(o.prototype, t), n && rG(o, n), o
                }(s().Component);
                return e.defaultProps = {
                    showAppOnInit: !1,
                    defaultMessage: "",
                    errorStates: {}
                }, e.propTypes = {
                    showAppOnInit: rR().bool,
                    defaultMessage: rR().string,
                    errorStates: rR().objectOf(rR().string)
                }, e
            }, "withComponentStatus");

            function rK(r, e, t) {
                return e in r ? Object.defineProperty(r, e, {
                    value: t,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : r[e] = t, r
            }

            function r$(r) {
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
                                rK(r, e, t[e])
                            })
                        }
                        return r
                    }({
                        type: r
                    }, t.reduce(function(r, e, t) {
                        return Object.assign(r, rK({}, e, n[t]))
                    }, {}))
                }
            }
            var rV = function(r, e) {
                    var t = (0, b.useState)(r),
                        n = t[0],
                        o = t[1];
                    return (0, b.useEffect)(function() {
                        var t = setTimeout(function() {
                            o(r)
                        }, e);
                        return function() {
                            clearTimeout(t)
                        }
                    }, [r, e]), n
                },
                rJ = function(r, e) {
                    var t = (0, b.useRef)(r);
                    (0, b.useEffect)(function() {
                        t.current = r
                    }, [r]), (0, b.useEffect)(function() {
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
                rQ = function(r, e) {
                    var t = function() {
                            if ("u" < typeof window) return e;
                            try {
                                var t = window.localStorage.getItem(r);
                                return t ? JSON.parse(t) : e
                            } catch (t) {
                                return console.warn("Error reading localStorage key “" + r + "”:", t), e
                            }
                        },
                        n = (0, b.useState)(t),
                        o = n[0],
                        i = n[1],
                        a = (0, b.useCallback)(function(e) {
                            "u" < typeof window && console.warn("Tried setting localStorage key “" + r + "” even though environment is not a client");
                            try {
                                var t, n = (t = Function, null != t && "u" > typeof Symbol && t[Symbol.hasInstance] ? !!t[Symbol.hasInstance](e) : e instanceof t) ? e(o) : e;
                                window.localStorage.setItem(r, JSON.stringify(n)), i(n), window.dispatchEvent(new Event("local-storage"))
                            } catch (e) {
                                console.warn("Error setting localStorage key “" + r + "”:", e)
                            }
                        }, [r, o]);
                    return (0, b.useEffect)(function() {
                        i(t())
                    }, []), (0, b.useEffect)(function() {
                        var r = function() {
                            i(t())
                        };
                        return window.addEventListener("storage", r), window.addEventListener("local-storage", r),
                            function() {
                                window.removeEventListener("storage", r), window.removeEventListener("local-storage", r)
                            }
                    }, []), [o, a]
                },
                rZ = function(r, e) {
                    (0, b.useEffect)(function() {
                        var t = function(t) {
                            r.every(function(r) {
                                return !(null == r ? void 0 : r.current)
                            }) || r.findIndex(function(r) {
                                var e, n, o;
                                return n = t.target, (null != (o = Node) && "u" > typeof Symbol && o[Symbol.hasInstance] ? !!o[Symbol.hasInstance](n) : n instanceof o) && (null == (e = null == r ? void 0 : r.current) ? void 0 : e.contains(t.target))
                            }) > -1 || e(t)
                        };
                        return document.addEventListener("mousedown", t), document.addEventListener("touchstart", t),
                            function() {
                                document.removeEventListener("mousedown", t), document.removeEventListener("touchstart", t)
                            }
                    }, [r, e])
                },
                r0 = function(r) {
                    var e = (0, b.useRef)();
                    return (0, b.useEffect)(function() {
                        e.current = r
                    }, [r]), e.current
                },
                r2 = ["focus", "click", "hover", "scroll", "mouseover", "mouseenter", "mousedown", "dblclick", "keypress", "touchstart", "touchmove"],
                r1 = ["blur"],
                r5 = function() {
                    var r = (0, b.useState)(!1),
                        e = r[0],
                        t = r[1],
                        n = (0, b.useCallback)(function() {
                            t(!0)
                        }, []),
                        o = (0, b.useCallback)(function() {
                            t(!1)
                        }, []);
                    return (0, b.useEffect)(function() {
                        return r2.forEach(function(r) {
                                window.addEventListener(r, n)
                            }), r1.forEach(function(r) {
                                window.addEventListener(r, o)
                            }),
                            function() {
                                r2.forEach(function(r) {
                                    window.removeEventListener(r, n)
                                }), r1.forEach(function(r) {
                                    window.removeEventListener(r, o)
                                })
                            }
                    }, [n, o]), e
                };

            function r4(r, e) {
                (null == e || e > r.length) && (e = r.length);
                for (var t = 0, n = Array(e); t < e; t++) n[t] = r[t];
                return n
            }
            var r7 = function() {
                    var r, e = function(r) {
                            if (Array.isArray(r)) return r
                        }(r = (0, b.useState)(document.body.classList.contains("dark-theme"))) || function(r) {
                            var e, t, n = null == r ? null : "u" > typeof Symbol && r[Symbol.iterator] || r["@@iterator"];
                            if (null != n) {
                                var o = [],
                                    i = !0,
                                    a = !1;
                                try {
                                    for (n = n.call(r); !(i = (e = n.next()).done) && (o.push(e.value), 2 !== o.length); i = !0);
                                } catch (r) {
                                    a = !0, t = r
                                } finally {
                                    try {
                                        i || null == n.return || n.return()
                                    } finally {
                                        if (a) throw t
                                    }
                                }
                                return o
                            }
                        }(r) || function(r) {
                            if (r) {
                                if ("string" == typeof r) return r4(r, 2);
                                var e = Object.prototype.toString.call(r).slice(8, -1);
                                if ("Object" === e && r.constructor && (e = r.constructor.name), "Map" === e || "Set" === e) return Array.from(e);
                                if ("Arguments" === e || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(e)) return r4(r, 2)
                            }
                        }(r) || function() {
                            throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                        }(),
                        t = e[0],
                        n = e[1];
                    return (0, b.useEffect)(function() {
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
                r3 = t(982),
                r8 = function() {
                    var r = r7();
                    return (0, b.useMemo)(function() {
                        return "dark" === r ? r3.FoundationDark : r3.FoundationLight
                    }, [r])
                },
                r9 = "10.50.0",
                r6 = globalThis;

            function er() {
                return ee(r6), r6
            }

            function ee(r) {
                var e = r.__SENTRY__ = r.__SENTRY__ || {};
                return e.version = e.version || r9, e[r9] = e[r9] || {}
            }

            function et(r, e) {
                var t = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : r6,
                    n = t.__SENTRY__ = t.__SENTRY__ || {},
                    o = n[r9] = n[r9] || {};
                return o[r] || (o[r] = e())
            }
            var en = "u" < typeof __SENTRY_DEBUG__ || __SENTRY_DEBUG__;

            function eo(r) {
                if (void 0 !== n) return n ? n(r) : r();
                var e = Symbol.for("__SENTRY_SAFE_RANDOM_ID_WRAPPER__");
                return e in r6 && "function" == typeof r6[e] ? (n = r6[e])(r) : (n = null, r())
            }

            function ei() {
                return eo(function() {
                    return Math.random()
                })
            }

            function ea() {
                var r = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : r6.crypto || r6.msCrypto;
                try {
                    if (null == r ? void 0 : r.randomUUID) return eo(function() {
                        return r.randomUUID()
                    }).replace(/-/g, "")
                } catch (r) {}
                return o || (o = "10000000100040008000100000000000"), o.replace(/[018]/g, function(r) {
                    return (r ^ (15 & 16 * ei()) >> r / 4).toString(16)
                })
            }

            function eu() {
                return eo(function() {
                    return Date.now()
                }) / 1e3
            }

            function eg(r, e) {
                (null == e || e > r.length) && (e = r.length);
                for (var t = 0, n = Array(e); t < e; t++) n[t] = r[t];
                return n
            }

            function ec(r) {
                return function(r) {
                    if (Array.isArray(r)) return eg(r)
                }(r) || function(r) {
                    if ("u" > typeof Symbol && null != r[Symbol.iterator] || null != r["@@iterator"]) return Array.from(r)
                }(r) || function(r) {
                    if (r) {
                        if ("string" == typeof r) return eg(r, void 0);
                        var e = Object.prototype.toString.call(r).slice(8, -1);
                        if ("Object" === e && r.constructor && (e = r.constructor.name), "Map" === e || "Set" === e) return Array.from(e);
                        if ("Arguments" === e || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(e)) return eg(r, void 0)
                    }
                }(r) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var el = {};

            function eb(r) {
                if (!("console" in r6)) return r();
                var e = r6.console,
                    t = {},
                    n = Object.keys(el);
                n.forEach(function(r) {
                    var n = el[r];
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

            function es(r) {
                for (var e = arguments.length, t = Array(e > 1 ? e - 1 : 0), n = 1; n < e; n++) t[n - 1] = arguments[n];
                en && function() {
                    return en ? et("loggerSettings", function() {
                        return {
                            enabled: !1
                        }
                    }) : {
                        enabled: !1
                    }
                }().enabled && eb(function() {
                    var e;
                    (e = r6.console)[r].apply(e, ["".concat("Sentry Logger ", "[").concat(r, "]:")].concat(ec(t)))
                })
            }
            var ed = function() {
                    for (var r = arguments.length, e = Array(r), t = 0; t < r; t++) e[t] = arguments[t];
                    es.apply(void 0, ["log"].concat(ec(e)))
                },
                ef = function() {
                    for (var r = arguments.length, e = Array(r), t = 0; t < r; t++) e[t] = arguments[t];
                    es.apply(void 0, ["warn"].concat(ec(e)))
                },
                e_ = function() {
                    for (var r = arguments.length, e = Array(r), t = 0; t < r; t++) e[t] = arguments[t];
                    es.apply(void 0, ["error"].concat(ec(e)))
                },
                eS = Object.prototype.toString,
                ep = "_sentrySpan";

            function eh(r, e) {
                if (e) try {
                    Object.defineProperty(r, ep, {
                        value: e,
                        writable: !0,
                        configurable: !0
                    })
                } catch (e) {
                    en && ed('Failed to add non-enumerable property "'.concat(ep, '" to object'), r)
                } else delete r[ep]
            }

            function ey(r, e) {
                (null == e || e > r.length) && (e = r.length);
                for (var t = 0, n = Array(e); t < e; t++) n[t] = r[t];
                return n
            }

            function em(r, e, t) {
                return e in r ? Object.defineProperty(r, e, {
                    value: t,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : r[e] = t, r
            }

            function ev(r) {
                for (var e = 1; e < arguments.length; e++) {
                    var t = null != arguments[e] ? arguments[e] : {},
                        n = Object.keys(t);
                    "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(t).filter(function(r) {
                        return Object.getOwnPropertyDescriptor(t, r).enumerable
                    }))), n.forEach(function(e) {
                        em(r, e, t[e])
                    })
                }
                return r
            }

            function eF(r, e) {
                return e = null != e ? e : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(r, Object.getOwnPropertyDescriptors(e)) : (function(r) {
                    var e = Object.keys(r);
                    if (Object.getOwnPropertySymbols) {
                        var t = Object.getOwnPropertySymbols(r);
                        e.push.apply(e, t)
                    }
                    return e
                })(Object(e)).forEach(function(t) {
                    Object.defineProperty(r, t, Object.getOwnPropertyDescriptor(e, t))
                }), r
            }

            function eB(r) {
                return function(r) {
                    if (Array.isArray(r)) return ey(r)
                }(r) || function(r) {
                    if ("u" > typeof Symbol && null != r[Symbol.iterator] || null != r["@@iterator"]) return Array.from(r)
                }(r) || function(r) {
                    if (r) {
                        if ("string" == typeof r) return ey(r, void 0);
                        var e = Object.prototype.toString.call(r).slice(8, -1);
                        if ("Object" === e && r.constructor && (e = r.constructor.name), "Map" === e || "Set" === e) return Array.from(e);
                        if ("Arguments" === e || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(e)) return ey(r, void 0)
                    }
                }(r) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var eO = function() {
                    var r;

                    function e() {
                        if (!(this instanceof e)) throw TypeError("Cannot call a class as a function");
                        this._notifyingListeners = !1, this._scopeListeners = [], this._eventProcessors = [], this._breadcrumbs = [], this._attachments = [], this._user = {}, this._tags = {}, this._attributes = {}, this._extra = {}, this._contexts = {}, this._sdkProcessingMetadata = {}, this._propagationContext = {
                            traceId: ea(),
                            sampleRand: ei()
                        }
                    }
                    return r = [{
                            key: "clone",
                            value: function() {
                                var r = new e;
                                return r._breadcrumbs = eB(this._breadcrumbs), r._tags = ev({}, this._tags), r._attributes = ev({}, this._attributes), r._extra = ev({}, this._extra), r._contexts = ev({}, this._contexts), this._contexts.flags && (r._contexts.flags = {
                                    values: eB(this._contexts.flags.values)
                                }), r._user = this._user, r._level = this._level, r._session = this._session, r._transactionName = this._transactionName, r._fingerprint = this._fingerprint, r._eventProcessors = eB(this._eventProcessors), r._attachments = eB(this._attachments), r._sdkProcessingMetadata = ev({}, this._sdkProcessingMetadata), r._propagationContext = ev({}, this._propagationContext), r._client = this._client, r._lastEventId = this._lastEventId, r._conversationId = this._conversationId, eh(r, this[ep]), r
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
                                    if (e.user && (!r.ipAddress && e.user.ip_address && (r.ipAddress = e.user.ip_address), r.did || e.did || (r.did = e.user.id || e.user.email || e.user.username)), r.timestamp = e.timestamp || (null != i ? i : i = function() {
                                            var r = r6.performance;
                                            if (!(null == r ? void 0 : r.now) || !r.timeOrigin) return eu;
                                            var e = r.timeOrigin;
                                            return function() {
                                                return (e + eo(function() {
                                                    return r.now()
                                                })) / 1e3
                                            }
                                        }())(), e.abnormal_mechanism && (r.abnormal_mechanism = e.abnormal_mechanism), e.ignoreDuration && (r.ignoreDuration = e.ignoreDuration), e.sid && (r.sid = 32 === e.sid.length ? e.sid : ea()), void 0 !== e.init && (r.init = e.init), !r.did && e.did && (r.did = "".concat(e.did)), "number" == typeof e.started && (r.started = e.started), r.ignoreDuration) r.duration = void 0;
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
                                return this._tags = ev({}, this._tags, r), this._notifyScopeListeners(), this
                            }
                        }, {
                            key: "setTag",
                            value: function(r, e) {
                                return this.setTags(em({}, r, e))
                            }
                        }, {
                            key: "setAttributes",
                            value: function(r) {
                                return this._attributes = ev({}, this._attributes, r), this._notifyScopeListeners(), this
                            }
                        }, {
                            key: "setAttribute",
                            value: function(r, e) {
                                return this.setAttributes(em({}, r, e))
                            }
                        }, {
                            key: "removeAttribute",
                            value: function(r) {
                                return r in this._attributes && (delete this._attributes[r], this._notifyScopeListeners()), this
                            }
                        }, {
                            key: "setExtras",
                            value: function(r) {
                                return this._extra = ev({}, this._extra, r), this._notifyScopeListeners(), this
                            }
                        }, {
                            key: "setExtra",
                            value: function(r, e) {
                                return this._extra = eF(ev({}, this._extra), em({}, r, e)), this._notifyScopeListeners(), this
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
                                    n = ((null != e && "u" > typeof Symbol && e[Symbol.hasInstance] ? !!e[Symbol.hasInstance](t) : t instanceof e) ? t.getScopeData() : eS.call(t) === "[object ".concat("Object", "]") ? r : void 0) || {},
                                    o = n.tags,
                                    i = n.attributes,
                                    a = n.extra,
                                    u = n.user,
                                    g = n.contexts,
                                    c = n.level,
                                    l = n.fingerprint,
                                    b = void 0 === l ? [] : l,
                                    s = n.propagationContext,
                                    d = n.conversationId;
                                return this._tags = ev({}, this._tags, o), this._attributes = ev({}, this._attributes, i), this._extra = ev({}, this._extra, a), this._contexts = ev({}, this._contexts, g), u && Object.keys(u).length && (this._user = u), c && (this._level = c), b.length && (this._fingerprint = b), s && (this._propagationContext = s), d && (this._conversationId = d), this
                            }
                        }, {
                            key: "clear",
                            value: function() {
                                return this._breadcrumbs = [], this._tags = {}, this._attributes = {}, this._extra = {}, this._user = {}, this._contexts = {}, this._level = void 0, this._transactionName = void 0, this._fingerprint = void 0, this._session = void 0, this._conversationId = void 0, eh(this, void 0), this._attachments = [], this.setPropagationContext({
                                    traceId: ea(),
                                    sampleRand: ei()
                                }), this._notifyScopeListeners(), this
                            }
                        }, {
                            key: "addBreadcrumb",
                            value: function(r, e) {
                                var t, n = "number" == typeof e ? e : 100;
                                if (n <= 0) return this;
                                var o = eF(ev({
                                    timestamp: eu()
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
                                    span: this[ep],
                                    conversationId: this._conversationId
                                }
                            }
                        }, {
                            key: "setSDKProcessingMetadata",
                            value: function(r) {
                                return this._sdkProcessingMetadata = function r(e, t) {
                                    var n = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : 2;
                                    if (!t || (void 0 === t ? "undefined" : t && "u" > typeof Symbol && t.constructor === Symbol ? "symbol" : typeof t) != "object" || n <= 0) return t;
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
                                var t = (null == e ? void 0 : e.event_id) || ea();
                                if (!this._client) return en && ef("No client configured on scope - will not capture exception!"), t;
                                var n = Error("Sentry syntheticException");
                                return this._client.captureException(r, eF(ev({
                                    originalException: r,
                                    syntheticException: n
                                }, e), {
                                    event_id: t
                                }), this), t
                            }
                        }, {
                            key: "captureMessage",
                            value: function(r, e, t) {
                                var n, o = (null == t ? void 0 : t.event_id) || ea();
                                if (!this._client) return en && ef("No client configured on scope - will not capture message!"), o;
                                var i = null != (n = null == t ? void 0 : t.syntheticException) ? n : Error(r);
                                return this._client.captureMessage(r, e, eF(ev({
                                    originalException: r,
                                    syntheticException: i
                                }, t), {
                                    event_id: o
                                }), this), o
                            }
                        }, {
                            key: "captureEvent",
                            value: function(r, e) {
                                var t = r.event_id || (null == e ? void 0 : e.event_id) || ea();
                                return this._client ? this._client.captureEvent(r, eF(ev({}, e), {
                                    event_id: t
                                }), this) : en && ef("No client configured on scope - will not capture event!"), t
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
                ek = function(r) {
                    var e;
                    return (null != (e = Promise) && "u" > typeof Symbol && e[Symbol.hasInstance] ? !!e[Symbol.hasInstance](r) : r instanceof e) && !r[ew]
                },
                ew = Symbol("chained PromiseLike"),
                eL = function(r, e, t) {
                    var n = r.then(function(r) {
                        return e(r), r
                    }, function(r) {
                        throw t(r), r
                    });
                    return ek(n) && ek(r) ? n : eE(r, n)
                },
                eE = function(r, e) {
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
                    return n && Object.assign(e, (ew in (t = {}) ? Object.defineProperty(t, ew, {
                        value: !0,
                        enumerable: !0,
                        configurable: !0,
                        writable: !0
                    }) : t[ew] = !0, t)), e
                },
                ez = function() {
                    var r;

                    function e(r, t) {
                        var n, o;
                        if (!(this instanceof e)) throw TypeError("Cannot call a class as a function");
                        n = r || new eO, o = t || new eO, this._stack = [{
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
                                return (null == (e = t) ? void 0 : e.then) && "function" == typeof e.then ? eL(t, function() {
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

            function eP() {
                var r = ee(er());
                return r.stack = r.stack || new ez(et("defaultCurrentScope", function() {
                    return new eO
                }), et("defaultIsolationScope", function() {
                    return new eO
                }))
            }

            function eA(r) {
                return eP().withScope(r)
            }

            function eM(r, e) {
                var t = eP();
                return t.withScope(function() {
                    return t.getStackTop().scope = r, e(r)
                })
            }

            function ej(r) {
                return eP().withScope(function() {
                    return r(eP().getIsolationScope())
                })
            }

            function eI(r) {
                var e = ee(r);
                return e.acs ? e.acs : {
                    withIsolationScope: ej,
                    withScope: eA,
                    withSetScope: eM,
                    withSetIsolationScope: function(r, e) {
                        return ej(e)
                    },
                    getCurrentScope: function() {
                        return eP().getScope()
                    },
                    getIsolationScope: function() {
                        return eP().getIsolationScope()
                    }
                }
            }

            function eT(r, e) {
                (null == e || e > r.length) && (e = r.length);
                for (var t = 0, n = Array(e); t < e; t++) n[t] = r[t];
                return n
            }

            function eW() {
                return eI(er()).getCurrentScope()
            }

            function eD() {
                for (var r = arguments.length, e = Array(r), t = 0; t < r; t++) e[t] = arguments[t];
                var n = eI(er());
                if (2 === e.length) {
                    var o = function(r) {
                            if (Array.isArray(r)) return r
                        }(e) || function(r) {
                            var e, t, n = null == r ? null : "u" > typeof Symbol && r[Symbol.iterator] || r["@@iterator"];
                            if (null != n) {
                                var o = [],
                                    i = !0,
                                    a = !1;
                                try {
                                    for (n = n.call(r); !(i = (e = n.next()).done) && (o.push(e.value), 2 !== o.length); i = !0);
                                } catch (r) {
                                    a = !0, t = r
                                } finally {
                                    try {
                                        i || null == n.return || n.return()
                                    } finally {
                                        if (a) throw t
                                    }
                                }
                                return o
                            }
                        }(e) || function(r) {
                            if (r) {
                                if ("string" == typeof r) return eT(r, 2);
                                var e = Object.prototype.toString.call(r).slice(8, -1);
                                if ("Object" === e && r.constructor && (e = r.constructor.name), "Map" === e || "Set" === e) return Array.from(e);
                                if ("Arguments" === e || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(e)) return eT(r, 2)
                            }
                        }(e) || function() {
                            throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                        }(),
                        i = o[0],
                        a = o[1];
                    return i ? n.withSetScope(i, a) : n.withScope(a)
                }
                return n.withScope(e[0])
            }

            function eC() {
                return eW().getClient()
            }
            var eR = ["user", "level", "extra", "contexts", "tags", "fingerprint", "propagationContext"];

            function ex(r, e) {
                (null == e || e > r.length) && (e = r.length);
                for (var t = 0, n = Array(e); t < e; t++) n[t] = r[t];
                return n
            }
            var eN = /^(?:(\w+):)\/\/(?:(\w+)(?::(\w+)?)?@)((?:\[[:.%\w]+\]|[\w.-]+))(?::(\d+))?\/(.+)/;

            function eH(r) {
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
            var eG = "u" < typeof __SENTRY_DEBUG__ || __SENTRY_DEBUG__;

            function eX(r) {
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

            function eU() {
                var r, e, t = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {},
                    n = r6.document,
                    o = (null == n ? void 0 : n.head) || (null == n ? void 0 : n.body);
                if (!o) {
                    eG && e_("[showReportDialog] Global document not defined");
                    return
                }
                var i = eW(),
                    a = eC(),
                    u = null == a ? void 0 : a.getDsn();
                if (!u) {
                    eG && e_("[showReportDialog] DSN not configured");
                    return
                }
                var g = (r = eX({}, t), e = e = {
                        user: eX({}, i.getUser(), t.user),
                        eventId: t.eventId || eI(er()).getIsolationScope().lastEventId()
                    }, Object.getOwnPropertyDescriptors ? Object.defineProperties(r, Object.getOwnPropertyDescriptors(e)) : (function(r) {
                        var e = Object.keys(r);
                        if (Object.getOwnPropertySymbols) {
                            var t = Object.getOwnPropertySymbols(r);
                            e.push.apply(e, t)
                        }
                        return e
                    })(Object(e)).forEach(function(t) {
                        Object.defineProperty(r, t, Object.getOwnPropertyDescriptor(e, t))
                    }), r),
                    c = r6.document.createElement("script");
                c.async = !0, c.crossOrigin = "anonymous", c.src = function(r, e) {
                    var t, n, o = function(r) {
                        var e = "string" == typeof r ? function(r) {
                            var e, t = eN.exec(r);
                            if (!t) return void eb(function() {
                                console.error("Invalid Sentry Dsn: ".concat(r))
                            });
                            var n = function(r) {
                                    if (Array.isArray(r)) return r
                                }(e = t.slice(1)) || function(r) {
                                    var e, t, n = null == r ? null : "u" > typeof Symbol && r[Symbol.iterator] || r["@@iterator"];
                                    if (null != n) {
                                        var o = [],
                                            i = !0,
                                            a = !1;
                                        try {
                                            for (n = n.call(r); !(i = (e = n.next()).done) && (o.push(e.value), 6 !== o.length); i = !0);
                                        } catch (r) {
                                            a = !0, t = r
                                        } finally {
                                            try {
                                                i || null == n.return || n.return()
                                            } finally {
                                                if (a) throw t
                                            }
                                        }
                                        return o
                                    }
                                }(e) || function(r) {
                                    if (r) {
                                        if ("string" == typeof r) return ex(r, 6);
                                        var e = Object.prototype.toString.call(r).slice(8, -1);
                                        if ("Object" === e && r.constructor && (e = r.constructor.name), "Map" === e || "Set" === e) return Array.from(e);
                                        if ("Arguments" === e || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(e)) return ex(r, 6)
                                    }
                                }(e) || function() {
                                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                                }(),
                                o = n[0],
                                i = n[1],
                                a = n[2],
                                u = n[3],
                                g = n[4],
                                c = n[5],
                                l = "",
                                b = void 0 === c ? "" : c,
                                s = b.split("/");
                            if (s.length > 1 && (l = s.slice(0, -1).join("/"), b = s.pop()), b) {
                                var d = b.match(/^\d+/);
                                d && (b = d[0])
                            }
                            return eH({
                                host: void 0 === u ? "" : u,
                                pass: void 0 === a ? "" : a,
                                path: l,
                                projectId: b,
                                port: void 0 === g ? "" : g,
                                protocol: o,
                                publicKey: i
                            })
                        }(r) : eH(r);
                        if (e && function(r) {
                                if (!en) return !0;
                                var e = r.port,
                                    t = r.projectId,
                                    n = r.protocol;
                                return !["protocol", "publicKey", "host", "projectId"].find(function(e) {
                                    return !r[e] && (e_("Invalid Sentry Dsn: ".concat(e, " missing")), !0)
                                }) && (t.match(/^\d+$/) ? "http" !== n && "https" !== n ? (e_("Invalid Sentry Dsn: Invalid protocol ".concat(n)), !1) : !(e && isNaN(parseInt(e, 10))) || (e_("Invalid Sentry Dsn: Invalid port ".concat(e)), !1) : (e_("Invalid Sentry Dsn: Invalid projectId ".concat(t)), !1))
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
                                u = r.protocol,
                                g = r.publicKey;
                            return "".concat(u, "://").concat(g).concat(e && o ? ":".concat(o) : "") + "@".concat(t).concat(i ? ":".concat(i) : "", "/").concat(n ? "".concat(n, "/") : n).concat(a)
                        }(o));
                    for (var u in e)
                        if ("dsn" !== u && "onClose" !== u)
                            if ("user" === u) {
                                var g = e.user;
                                if (!g) continue;
                                g.name && (a += "&name=".concat(encodeURIComponent(g.name))), g.email && (a += "&email=".concat(encodeURIComponent(g.email)))
                            } else a += "&".concat(encodeURIComponent(u), "=").concat(encodeURIComponent(e[u]));
                    return "".concat(i, "?").concat(a)
                }(u, g);
                var l = g.onLoad,
                    b = g.onClose;
                if (l && (c.onload = l), b) {
                    var s = function(r) {
                        if ("__sentry_reportdialog_closed__" === r.data) try {
                            b()
                        } finally {
                            r6.removeEventListener("message", s)
                        }
                    };
                    r6.addEventListener("message", s)
                }
                o.appendChild(c)
            }
            var eY = "u" < typeof __SENTRY_DEBUG__ || __SENTRY_DEBUG__;

            function eq(r) {
                return (eq = Object.setPrototypeOf ? Object.getPrototypeOf : function(r) {
                    return r.__proto__ || Object.getPrototypeOf(r)
                })(r)
            }

            function eK(r) {
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

            function e$(r, e) {
                return e = null != e ? e : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(r, Object.getOwnPropertyDescriptors(e)) : (function(r) {
                    var e = Object.keys(r);
                    if (Object.getOwnPropertySymbols) {
                        var t = Object.getOwnPropertySymbols(r);
                        e.push.apply(e, t)
                    }
                    return e
                })(Object(e)).forEach(function(t) {
                    Object.defineProperty(r, t, Object.getOwnPropertyDescriptor(e, t))
                }), r
            }

            function eV(r, e) {
                return (eV = Object.setPrototypeOf || function(r, e) {
                    return r.__proto__ = e, r
                })(r, e)
            }

            function eJ() {
                try {
                    var r = !Boolean.prototype.valueOf.call(Reflect.construct(Boolean, [], function() {}))
                } catch (r) {}
                return (eJ = function() {
                    return !!r
                })()
            }
            var eQ = {
                    componentStack: null,
                    error: null,
                    eventId: null
                },
                eZ = function(r) {
                    var e;
                    if ("function" != typeof r && null !== r) throw TypeError("Super expression must either be null or a function");

                    function t(r) {
                        if (!(this instanceof t)) throw TypeError("Cannot call a class as a function");
                        e = t, n = [r], e = eq(e), (o = function(r, e) {
                            var t;
                            if (e && ("object" == ((t = e) && "u" > typeof Symbol && t.constructor === Symbol ? "symbol" : typeof t) || "function" == typeof e)) return e;
                            if (void 0 === r) throw ReferenceError("this hasn't been initialised - super() hasn't been called");
                            return r
                        }(this, eJ() ? Reflect.construct(e, n || [], eq(this).constructor) : e.apply(this, n))).state = eQ, o._openFallbackReportDialog = !0;
                        var e, n, o, i = eC();
                        return i && r.showDialog && (o._openFallbackReportDialog = !1, o._cleanupHook = i.on("afterSendEvent", function(e) {
                            !e.type && o._lastEventId && e.event_id === o._lastEventId && eU(e$(eK({}, r.dialogOptions), {
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
                        }), r && eV(t, r), e = [{
                            key: "componentDidCatch",
                            value: function(r, e) {
                                var t = this,
                                    n = e.componentStack,
                                    o = this.props,
                                    i = o.beforeCapture,
                                    a = o.onError,
                                    u = o.showDialog,
                                    g = o.dialogOptions;
                                eD(function(o) {
                                    i && i(o, r, n);
                                    var c = function(r, e, t) {
                                        var n = e.componentStack;
                                        if (null !== (o = b.version.match(/^([^.]+)/)) && parseInt(o[0]) >= 17 && function(r) {
                                                switch (eS.call(r)) {
                                                    case "[object Error]":
                                                    case "[object Exception]":
                                                    case "[object DOMException]":
                                                    case "[object WebAssembly.Exception]":
                                                        return !0;
                                                    default:
                                                        var e = r,
                                                            t = Error;
                                                        try {
                                                            return null != t && "u" > typeof Symbol && t[Symbol.hasInstance] ? !!t[Symbol.hasInstance](e) : e instanceof t
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
                                        return eD(function(e) {
                                            return e.setContext("react", {
                                                componentStack: n
                                            }), eW().captureException(r, function(r) {
                                                if (r) return function(r) {
                                                    return (null != eO && "u" > typeof Symbol && eO[Symbol.hasInstance] ? !!eO[Symbol.hasInstance](r) : r instanceof eO) || "function" == typeof r
                                                }(r) || Object.keys(r).some(function(r) {
                                                    return eR.includes(r)
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
                                    a && a(r, n, c), u && (t._lastEventId = c, t._openFallbackReportDialog && eU(e$(eK({}, g), {
                                        eventId: c
                                    }))), t.setState({
                                        error: r,
                                        componentStack: n,
                                        eventId: c
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
                                o && (this.state === eQ ? o(null, null, null) : o(e, t, n)), this._cleanupHook && (this._cleanupHook(), this._cleanupHook = void 0)
                            }
                        }, {
                            key: "resetErrorBoundary",
                            value: function() {
                                var r = this.props.onReset,
                                    e = this.state,
                                    t = e.error,
                                    n = e.componentStack,
                                    o = e.eventId;
                                r && r(t, n, o), this.setState(eQ)
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
                                var i = "function" == typeof t ? b.createElement(t, {
                                    error: o.error,
                                    componentStack: o.componentStack,
                                    resetError: function() {
                                        return r.resetErrorBoundary()
                                    },
                                    eventId: o.eventId
                                }) : t;
                                return b.isValidElement(i) ? i : (t && eY && ef("fallback did not produce a valid ReactElement"), null)
                            }
                        }],
                        function(r, e) {
                            for (var t = 0; t < e.length; t++) {
                                var n = e[t];
                                n.enumerable = n.enumerable || !1, n.configurable = !0, "value" in n && (n.writable = !0), Object.defineProperty(r, n.key, n)
                            }
                        }(t.prototype, e), t
                }(b.Component),
                e0 = function(r, e) {
                    var t;
                    console.error(r, e), null == (t = "u" < typeof window ? void 0 : window.Sentry) || t.captureException(r, e ? {
                        extra: e
                    } : void 0)
                },
                e2 = function(r, e, t, n, o) {
                    e || e0(Error("renderWithErrorBoundary was given no container.")), (0, f.render)((0, y.jsx)(eZ, {
                        fallback: n,
                        onError: o,
                        children: r
                    }), e, t)
                },
                e1 = new rf.QueryClient({
                    defaultOptions: {
                        queries: {
                            retry: !1,
                            refetchOnMount: !1,
                            refetchOnWindowFocus: !1,
                            refetchOnReconnect: !1
                        }
                    }
                });
            rd(["Roblox", "core-scripts", "react"], c), rd("ReactUtilities", function(r) {
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
            }({}, l)), rd(["RadixUI", "react-dismissable-layer"], a), rd(["RadixUI", "react-focus-guards"], u), rd(["RadixUI", "react-focus-scope"], g)
        }()
}(), window.Roblox && window.Roblox.BundleDetector && window.Roblox.BundleDetector.bundleDetected("ReactUtilities");
//# sourceMappingURL=https://sourcemaps.rbxcdn.com/reactUtilities-53128728ea0d67bf.js.map