;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "c1802508-5256-679c-2f07-054242be8711")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 587347, (r, e, g) => {
    "use strict";
    Object.defineProperty(g, "__esModule", {
        value: !0
    }), g.FoundationDark = void 0, g.FoundationDark = {
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
}, 598400, (r, e, g) => {
    "use strict";
    Object.defineProperty(g, "__esModule", {
        value: !0
    }), g.FoundationLight = void 0, g.FoundationLight = {
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
}, 192819, (r, e, g) => {
    "use strict";
    Object.defineProperty(g, "__esModule", {
        value: !0
    }), g.UIBloxDark = void 0, g.UIBloxDark = {
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
}, 155536, (r, e, g) => {
    "use strict";
    Object.defineProperty(g, "__esModule", {
        value: !0
    }), g.UIBloxLight = void 0, g.UIBloxLight = {
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
}, 974657, (r, e, g) => {
    "use strict";
    var a = r.e && r.e.__createBinding || (Object.create ? function(r, e, g, a) {
            void 0 === a && (a = g), Object.defineProperty(r, a, {
                enumerable: !0,
                get: function() {
                    return e[g]
                }
            })
        } : function(r, e, g, a) {
            void 0 === a && (a = g), r[a] = e[g]
        }),
        i = r.e && r.e.__exportStar || function(r, e) {
            for (var g in r) "default" === g || Object.prototype.hasOwnProperty.call(e, g) || a(e, r, g)
        };
    Object.defineProperty(g, "__esModule", {
        value: !0
    }), i(r.r(587347), g), i(r.r(598400), g), i(r.r(192819), g), i(r.r(155536), g)
}, 431545, 372589, r => {
    "use strict";
    r.i(19836);
    var e = r.i(420482),
        g = r.i(745911),
        a = r.i(953882),
        i = r.i(974657),
        n = r.i(250646);
    let b = ["color-mode-dark", "color-mode-light", "color-mode-system"];

    function t() {
        let r = (0, n.useMediaQuery)("(prefers-color-scheme: dark)", {
                defaultValue: !1,
                initializeWithValue: !1
            }),
            g = (0, e.useCallback)(() => {
                if ("u" > typeof document) {
                    let r = [document.body, document.documentElement].find(r => b.some(e => r.classList.contains(e)));
                    if (r?.classList.contains("color-mode-dark")) return "dark";
                    if (r?.classList.contains("color-mode-light")) return "light"
                }
                return r ? "dark" : "light"
            }, [r]),
            [a, i] = (0, e.useState)("light");
        return (0, e.useEffect)(() => {
            if (i(g()), "u" < typeof document || "u" < typeof MutationObserver) return;
            let r = new MutationObserver(() => {
                    i(g())
                }),
                e = {
                    attributes: !0,
                    attributeFilter: ["class"]
                };
            return r.observe(document.documentElement, e), r.observe(document.body, e), () => {
                r.disconnect()
            }
        }, [g]), a
    }
    r.s(["useResolvedColorMode", 0, t], 372589);
    let o = (0, e.createContext)(void 0);

    function _() {
        return t()
    }
    r.s(["TranslationProvider", 0, function(r) {
        let {
            children: e
        } = r;
        return e
    }, "useDebounce", 0, (r, g) => {
        let [a, i] = (0, e.useState)(r);
        return (0, e.useEffect)(() => {
            let e = setTimeout(() => {
                i(r)
            }, g);
            return () => {
                clearTimeout(e)
            }
        }, [r, g]), a
    }, "usePrevious", 0, r => {
        let g = (0, e.useRef)(void 0);
        return (0, e.useEffect)(() => {
            g.current = r
        }, [r]), g.current
    }, "useTheme", 0, _, "useTokens", 0, function() {
        return "dark" === _() ? i.FoundationDark : i.FoundationLight
    }, "useTranslation", 0, function() {
        let r = (0, e.useContext)(o),
            i = (0, a.useTranslations)(),
            n = (0, g.useMessages)(),
            b = (0, e.useMemo)(() => (function r(e) {
                let g = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : "",
                    a = [];
                for (let i of Object.keys(e)) {
                    let n = e[i];
                    if (null != n && "object" == typeof n && !Array.isArray(n)) {
                        let e = g ? `${g}.${i}` : i;
                        a.push(e), a.push(...r(n, e))
                    }
                }
                return a
            })(n), [n]),
            t = (0, e.useCallback)((r, e, g) => {
                let a = r.replaceAll(".", ":");
                for (let r of b) {
                    let g = `${r}.${a}`;
                    if (i.has(g)) return i(g, e)
                }
                return g ?? ""
            }, [i, b]);
        return (0, e.useMemo)(() => r ?? {
            translate: t,
            intl: {}
        }, [r, t])
    }], 431545)
}]);

//# debugId=c1802508-5256-679c-2f07-054242be8711
//# sourceMappingURL=https://internal-assets.rbxcdn.com/_next/static/chunks/01lax58.llrtv.js.map