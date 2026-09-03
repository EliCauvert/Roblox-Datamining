local var1 = nil

function make_assets_1x()
	-- upvalues: var1 (write)
	var1 = {
		["chat_bubble/chat-bubble"] = {
			ImageSet = "img_set_1x_4",
			ImageRectOffset = Vector2.new(490, 120),
			ImageRectSize = Vector2.new(21, 21)
		},
		["chat_bubble/chat-bubble-bottom"] = {
			ImageSet = "img_set_1x_4",
			ImageRectOffset = Vector2.new(0, 464),
			ImageRectSize = Vector2.new(41, 41)
		},
		["chat_bubble/chat-bubble-middle"] = {
			ImageSet = "img_set_1x_3",
			ImageRectOffset = Vector2.new(390, 456),
			ImageRectSize = Vector2.new(41, 41)
		},
		["chat_bubble/chat-bubble-self"] = {
			ImageSet = "img_set_1x_4",
			ImageRectOffset = Vector2.new(490, 70),
			ImageRectSize = Vector2.new(21, 21)
		},
		["chat_bubble/chat-bubble-self-bottom"] = {
			ImageSet = "img_set_1x_3",
			ImageRectOffset = Vector2.new(262, 464),
			ImageRectSize = Vector2.new(41, 41)
		},
		["chat_bubble/chat-bubble-self-middle"] = {
			ImageSet = "img_set_1x_3",
			ImageRectOffset = Vector2.new(219, 464),
			ImageRectSize = Vector2.new(41, 41)
		},
		["chat_bubble/chat-bubble-self-tip"] = {
			ImageSet = "img_set_1x_1",
			ImageRectOffset = Vector2.new(356, 448),
			ImageRectSize = Vector2.new(6, 6)
		},
		["chat_bubble/chat-bubble-self-top"] = {
			ImageSet = "img_set_1x_3",
			ImageRectOffset = Vector2.new(176, 464),
			ImageRectSize = Vector2.new(41, 41)
		},
		["chat_bubble/chat-bubble-self2"] = {
			ImageSet = "img_set_1x_4",
			ImageRectOffset = Vector2.new(490, 93),
			ImageRectSize = Vector2.new(21, 21)
		},
		["chat_bubble/chat-bubble-single"] = {
			ImageSet = "img_set_1x_3",
			ImageRectOffset = Vector2.new(133, 464),
			ImageRectSize = Vector2.new(41, 41)
		},
		["chat_bubble/chat-bubble-tip"] = {
			ImageSet = "img_set_1x_1",
			ImageRectOffset = Vector2.new(356, 440),
			ImageRectSize = Vector2.new(6, 6)
		},
		["chat_bubble/chat-bubble-top"] = {
			ImageSet = "img_set_1x_3",
			ImageRectOffset = Vector2.new(90, 464),
			ImageRectSize = Vector2.new(41, 41)
		},
		["chat_bubble/chat-bubble2"] = {
			ImageSet = "img_set_1x_3",
			ImageRectOffset = Vector2.new(484, 335),
			ImageRectSize = Vector2.new(21, 21)
		},
		["component_assets/avatarBG_dark"] = {
			ImageSet = "img_set_1x_4",
			ImageRectOffset = Vector2.new(0, 0),
			ImageRectSize = Vector2.new(338, 338)
		},
		["component_assets/avatarBG_light"] = {
			ImageSet = "img_set_1x_3",
			ImageRectOffset = Vector2.new(0, 0),
			ImageRectSize = Vector2.new(338, 338)
		},
		["component_assets/bulletDown_17_stroke_3"] = {
			ImageSet = "img_set_1x_1",
			ImageRectOffset = Vector2.new(440, 494),
			ImageRectSize = Vector2.new(17, 17)
		},
		["component_assets/bulletLeft_17"] = {
			ImageSet = "img_set_1x_1",
			ImageRectOffset = Vector2.new(421, 494),
			ImageRectSize = Vector2.new(17, 17)
		},
		["component_assets/bulletLeft_17_stroke_3"] = {
			ImageSet = "img_set_1x_1",
			ImageRectOffset = Vector2.new(402, 494),
			ImageRectSize = Vector2.new(17, 17)
		},
		["component_assets/bulletRight_17"] = {
			ImageSet = "img_set_1x_1",
			ImageRectOffset = Vector2.new(159, 494),
			ImageRectSize = Vector2.new(17, 17)
		},
		["component_assets/bulletRight_17_stroke_3"] = {
			ImageSet = "img_set_1x_1",
			ImageRectOffset = Vector2.new(140, 494),
			ImageRectSize = Vector2.new(17, 17)
		},
		["component_assets/bulletUp_17_stroke_3"] = {
			ImageSet = "img_set_1x_1",
			ImageRectOffset = Vector2.new(121, 494),
			ImageRectSize = Vector2.new(17, 17)
		},
		["component_assets/bullet_17"] = {
			ImageSet = "img_set_1x_1",
			ImageRectOffset = Vector2.new(102, 494),
			ImageRectSize = Vector2.new(17, 17)
		},
		["component_assets/checkerboard_12"] = {
			ImageSet = "img_set_1x_1",
			ImageRectOffset = Vector2.new(308, 440),
			ImageRectSize = Vector2.new(12, 12)
		},
		["component_assets/circle_15_stroke_3"] = {
			ImageSet = "img_set_1x_6",
			ImageRectOffset = Vector2.new(456, 402),
			ImageRectSize = Vector2.new(15, 15)
		},
		["component_assets/circle_16"] = {
			ImageSet = "img_set_1x_2",
			ImageRectOffset = Vector2.new(493, 154),
			ImageRectSize = Vector2.new(16, 16)
		},
		["component_assets/circle_17"] = {
			ImageSet = "img_set_1x_1",
			ImageRectOffset = Vector2.new(83, 494),
			ImageRectSize = Vector2.new(17, 17)
		},
		["component_assets/circle_17_mask"] = {
			ImageSet = "img_set_1x_1",
			ImageRectOffset = Vector2.new(64, 494),
			ImageRectSize = Vector2.new(17, 17)
		},
		["component_assets/circle_17_stroke_1"] = {
			ImageSet = "img_set_1x_1",
			ImageRectOffset = Vector2.new(45, 494),
			ImageRectSize = Vector2.new(17, 17)
		},
		["component_assets/circle_17_stroke_3"] = {
			ImageSet = "img_set_1x_1",
			ImageRectOffset = Vector2.new(26, 494),
			ImageRectSize = Vector2.new(17, 17)
		},
		["component_assets/circle_21"] = {
			ImageSet = "img_set_1x_3",
			ImageRectOffset = Vector2.new(461, 335),
			ImageRectSize = Vector2.new(21, 21)
		},
		["component_assets/circle_21_stroke_1"] = {
			ImageSet = "img_set_1x_3",
			ImageRectOffset = Vector2.new(438, 335),
			ImageRectSize = Vector2.new(21, 21)
		},
		["component_assets/circle_22_stroke_3"] = {
			ImageSet = "img_set_1x_4",
			ImageRectOffset = Vector2.new(340, 486),
			ImageRectSize = Vector2.new(22, 22)
		},
		["component_assets/circle_24_stroke_1"] = {
			ImageSet = "img_set_1x_3",
			ImageRectOffset = Vector2.new(486, 218),
			ImageRectSize = Vector2.new(24, 24)
		},
		["component_assets/circle_25"] = {
			ImageSet = "img_set_1x_1",
			ImageRectOffset = Vector2.new(217, 486),
			ImageRectSize = Vector2.new(25, 25)
		},
		["component_assets/circle_26_stroke_3"] = {
			ImageSet = "img_set_1x_2",
			ImageRectOffset = Vector2.new(354, 485),
			ImageRectSize = Vector2.new(26, 26)
		},
		["component_assets/circle_28_padding_10"] = {
			ImageSet = "img_set_1x_4",
			ImageRectOffset = Vector2.new(230, 340),
			ImageRectSize = Vector2.new(48, 48)
		},
		["component_assets/circle_29"] = {
			ImageSet = "img_set_1x_4",
			ImageRectOffset = Vector2.new(309, 464),
			ImageRectSize = Vector2.new(29, 29)
		},
		["component_assets/circle_29_mask"] = {
			ImageSet = "img_set_1x_5",
			ImageRectOffset = Vector2.new(482, 395),
			ImageRectSize = Vector2.new(29, 29)
		},
		["component_assets/circle_29_stroke_1"] = {
			ImageSet = "img_set_1x_5",
			ImageRectOffset = Vector2.new(482, 364),
			ImageRectSize = Vector2.new(29, 29)
		},
		["component_assets/circle_30_stroke_3"] = {
			ImageSet = "img_set_1x_6",
			ImageRectOffset = Vector2.new(476, 364),
			ImageRectSize = Vector2.new(30, 30)
		},
		["component_assets/circle_36"] = {
			ImageSet = "img_set_1x_2",
			ImageRectOffset = Vector2.new(471, 457),
			ImageRectSize = Vector2.new(36, 36)
		},
		["component_assets/circle_36_stroke_1"] = {
			ImageSet = "img_set_1x_4",
			ImageRectOffset = Vector2.new(43, 464),
			ImageRectSize = Vector2.new(36, 36)
		},
		["component_assets/circle_42_stroke_3"] = {
			ImageSet = "img_set_1x_3",
			ImageRectOffset = Vector2.new(46, 464),
			ImageRectSize = Vector2.new(42, 42)
		},
		["component_assets/circle_49"] = {
			ImageSet = "img_set_1x_2",
			ImageRectOffset = Vector2.new(395, 172),
			ImageRectSize = Vector2.new(49, 49)
		},
		["component_assets/circle_49_mask"] = {
			ImageSet = "img_set_1x_2",
			ImageRectOffset = Vector2.new(446, 172),
			ImageRectSize = Vector2.new(49, 49)
		},
		["component_assets/circle_49_stroke_1"] = {
			ImageSet = "img_set_1x_1",
			ImageRectOffset = Vector2.new(311, 456),
			ImageRectSize = Vector2.new(49, 49)
		},
		["component_assets/circle_52_stroke_3"] = {
			ImageSet = "img_set_1x_1",
			ImageRectOffset = Vector2.new(257, 456),
			ImageRectSize = Vector2.new(52, 52)
		},
		["component_assets/circle_60_stroke_2"] = {
			ImageSet = "img_set_1x_2",
			ImageRectOffset = Vector2.new(230, 446),
			ImageRectSize = Vector2.new(60, 60)
		},
		["component_assets/circle_68_stroke_2"] = {
			ImageSet = "img_set_1x_4",
			ImageRectOffset = Vector2.new(340, 0),
			ImageRectSize = Vector2.new(68, 68)
		},
		["component_assets/circle_69_stroke_3"] = {
			ImageSet = "img_set_1x_3",
			ImageRectOffset = Vector2.new(438, 432),
			ImageRectSize = Vector2.new(69, 69)
		},
		["component_assets/circle_72_stroke_3"] = {
			ImageSet = "img_set_1x_2",
			ImageRectOffset = Vector2.new(395, 419),
			ImageRectSize = Vector2.new(74, 72)
		},
		["component_assets/circle_9"] = {
			ImageSet = "img_set_1x_1",
			ImageRectOffset = Vector2.new(336, 440),
			ImageRectSize = Vector2.new(9, 9)
		},
		["component_assets/circle_9_stroke_1"] = {
			ImageSet = "img_set_1x_1",
			ImageRectOffset = Vector2.new(322, 440),
			ImageRectSize = Vector2.new(9, 9)
		},
		["component_assets/contactFullAvatar_large"] = {
			ImageSet = "img_set_1x_1",
			ImageRectOffset = Vector2.new(0, 0),
			ImageRectSize = Vector2.new(400, 400)
		},
		["component_assets/contactFullAvatar_small"] = {
			ImageSet = "img_set_1x_3",
			ImageRectOffset = Vector2.new(340, 0),
			ImageRectSize = Vector2.new(160, 160)
		},
		["component_assets/contactHeadshot"] = {
			ImageSet = "img_set_1x_1",
			ImageRectOffset = Vector2.new(402, 0),
			ImageRectSize = Vector2.new(100, 100)
		},
		["component_assets/dragger_small"] = {
			ImageSet = "img_set_1x_1",
			ImageRectOffset = Vector2.new(0, 494),
			ImageRectSize = Vector2.new(24, 16)
		},
		["component_assets/dropshadow_16_20"] = {
			ImageSet = "img_set_1x_3",
			ImageRectOffset = Vector2.new(230, 340),
			ImageRectSize = Vector2.new(56, 56)
		},
		["component_assets/dropshadow_17_16"] = {
			ImageSet = "img_set_1x_3",
			ImageRectOffset = Vector2.new(438, 260),
			ImageRectSize = Vector2.new(73, 73)
		},
		["component_assets/dropshadow_17_4"] = {
			ImageSet = "img_set_1x_1",
			ImageRectOffset = Vector2.new(190, 486),
			ImageRectSize = Vector2.new(25, 25)
		},
		["component_assets/dropshadow_17_8"] = {
			ImageSet = "img_set_1x_3",
			ImageRectOffset = Vector2.new(305, 464),
			ImageRectSize = Vector2.new(33, 33)
		},
		["component_assets/dropshadow_24_6"] = {
			ImageSet = "img_set_1x_1",
			ImageRectOffset = Vector2.new(365, 456),
			ImageRectSize = Vector2.new(34, 34)
		},
		["component_assets/dropshadow_25"] = {
			ImageSet = "img_set_1x_2",
			ImageRectOffset = Vector2.new(354, 446),
			ImageRectSize = Vector2.new(37, 37)
		},
		["component_assets/dropshadow_28"] = {
			ImageSet = "img_set_1x_4",
			ImageRectOffset = Vector2.new(280, 340),
			ImageRectSize = Vector2.new(48, 48)
		},
		["component_assets/dropshadow_56_8"] = {
			ImageSet = "img_set_1x_3",
			ImageRectOffset = Vector2.new(438, 358),
			ImageRectSize = Vector2.new(72, 72)
		},
		["component_assets/dropshadow_chatOff"] = {
			ImageSet = "img_set_1x_4",
			ImageRectOffset = Vector2.new(81, 464),
			ImageRectSize = Vector2.new(36, 36)
		},
		["component_assets/dropshadow_chatOn"] = {
			ImageSet = "img_set_1x_4",
			ImageRectOffset = Vector2.new(119, 464),
			ImageRectSize = Vector2.new(36, 36)
		},
		["component_assets/dropshadow_more"] = {
			ImageSet = "img_set_1x_4",
			ImageRectOffset = Vector2.new(157, 464),
			ImageRectSize = Vector2.new(36, 36)
		},
		["component_assets/dropshadow_square_4"] = {
			ImageSet = "img_set_1x_1",
			ImageRectOffset = Vector2.new(278, 440),
			ImageRectSize = Vector2.new(14, 14)
		},
		["component_assets/dropshadow_thumbnail_28"] = {
			ImageSet = "img_set_1x_1",
			ImageRectOffset = Vector2.new(190, 456),
			ImageRectSize = Vector2.new(65, 28)
		},
		["component_assets/genreBG"] = {
			ImageSet = "img_set_1x_1",
			ImageRectOffset = Vector2.new(0, 402),
			ImageRectSize = Vector2.new(240, 52)
		},
		["component_assets/halfcircleLeft_17"] = {
			ImageSet = "img_set_1x_1",
			ImageRectOffset = Vector2.new(244, 486),
			ImageRectSize = Vector2.new(8, 17)
		},
		["component_assets/halfcircleRight_17"] = {
			ImageSet = "img_set_1x_1",
			ImageRectOffset = Vector2.new(178, 494),
			ImageRectSize = Vector2.new(8, 17)
		},
		["component_assets/hexagon_12"] = {
			ImageSet = "img_set_1x_1",
			ImageRectOffset = Vector2.new(294, 440),
			ImageRectSize = Vector2.new(12, 14)
		},
		["component_assets/hexagon_24"] = {
			ImageSet = "img_set_1x_3",
			ImageRectOffset = Vector2.new(486, 162),
			ImageRectSize = Vector2.new(24, 28)
		},
		["component_assets/itemBG_dark"] = {
			ImageSet = "img_set_1x_8",
			ImageRectOffset = Vector2.new(0, 0),
			ImageRectSize = Vector2.new(300, 300)
		},
		["component_assets/itemBG_light"] = {
			ImageSet = "img_set_1x_9",
			ImageRectOffset = Vector2.new(0, 0),
			ImageRectSize = Vector2.new(300, 300)
		},
		["component_assets/profileHeaderBG"] = {
			ImageSet = "img_set_1x_2",
			ImageRectOffset = Vector2.new(395, 0),
			ImageRectSize = Vector2.new(110, 72)
		},
		["component_assets/square_7_stroke_3"] = {
			ImageSet = "img_set_1x_1",
			ImageRectOffset = Vector2.new(347, 440),
			ImageRectSize = Vector2.new(7, 7)
		},
		["component_assets/triangleDown_16"] = {
			ImageSet = "img_set_1x_1",
			ImageRectOffset = Vector2.new(260, 440),
			ImageRectSize = Vector2.new(16, 8)
		},
		["component_assets/triangleLeft_16"] = {
			ImageSet = "img_set_1x_1",
			ImageRectOffset = Vector2.new(500, 102),
			ImageRectSize = Vector2.new(8, 16)
		},
		["component_assets/triangleRight_16"] = {
			ImageSet = "img_set_1x_1",
			ImageRectOffset = Vector2.new(385, 492),
			ImageRectSize = Vector2.new(8, 16)
		},
		["component_assets/triangleUp_16"] = {
			ImageSet = "img_set_1x_1",
			ImageRectOffset = Vector2.new(242, 440),
			ImageRectSize = Vector2.new(16, 8)
		},
		["component_assets/userBG_dark"] = {
			ImageSet = "img_set_1x_4",
			ImageRectOffset = Vector2.new(230, 402),
			ImageRectSize = Vector2.new(48, 48)
		},
		["component_assets/user_60_mask"] = {
			ImageSet = "img_set_1x_2",
			ImageRectOffset = Vector2.new(292, 446),
			ImageRectSize = Vector2.new(60, 60)
		},
		["component_assets/user_glow"] = {
			ImageSet = "img_set_1x_3",
			ImageRectOffset = Vector2.new(340, 162),
			ImageRectSize = Vector2.new(144, 96)
		},
		["component_assets/vignette_246"] = {
			ImageSet = "img_set_1x_10",
			ImageRectOffset = Vector2.new(0, 0),
			ImageRectSize = Vector2.new(246, 246)
		},
		["gradient/gradient_0_100"] = {
			ImageSet = "img_set_1x_1",
			ImageRectOffset = Vector2.new(362, 456),
			ImageRectSize = Vector2.new(1, 40)
		},
		["icons/actions/accept"] = {
			ImageSet = "img_set_1x_4",
			ImageRectOffset = Vector2.new(195, 464),
			ImageRectSize = Vector2.new(36, 36)
		},
		["icons/actions/edit/redo"] = {
			ImageSet = "img_set_1x_4",
			ImageRectOffset = Vector2.new(233, 464),
			ImageRectSize = Vector2.new(36, 36)
		},
		["icons/actions/edit/undo"] = {
			ImageSet = "img_set_1x_4",
			ImageRectOffset = Vector2.new(271, 464),
			ImageRectSize = Vector2.new(36, 36)
		},
		["icons/actions/feedback_on"] = {
			ImageSet = "img_set_1x_4",
			ImageRectOffset = Vector2.new(390, 170),
			ImageRectSize = Vector2.new(36, 36)
		},
		["icons/brands/moments-fill"] = {
			ImageSet = "img_set_1x_3",
			ImageRectOffset = Vector2.new(486, 192),
			ImageRectSize = Vector2.new(24, 24)
		},
		["icons/brands/moments_large-fill"] = {
			ImageSet = "img_set_1x_4",
			ImageRectOffset = Vector2.new(280, 402),
			ImageRectSize = Vector2.new(48, 48)
		},
		["icons/common/gender_female"] = {
			ImageSet = "img_set_1x_4",
			ImageRectOffset = Vector2.new(428, 170),
			ImageRectSize = Vector2.new(36, 36)
		},
		["icons/common/gender_female_selected"] = {
			ImageSet = "img_set_1x_4",
			ImageRectOffset = Vector2.new(466, 170),
			ImageRectSize = Vector2.new(36, 36)
		},
		["icons/common/gender_male"] = {
			ImageSet = "img_set_1x_4",
			ImageRectOffset = Vector2.new(340, 220),
			ImageRectSize = Vector2.new(36, 36)
		},
		["icons/common/gender_male_selected"] = {
			ImageSet = "img_set_1x_4",
			ImageRectOffset = Vector2.new(378, 220),
			ImageRectSize = Vector2.new(36, 36)
		},
		["icons/common/muteNotifications"] = {
			ImageSet = "img_set_1x_2",
			ImageRectOffset = Vector2.new(471, 419),
			ImageRectSize = Vector2.new(37, 36)
		},
		["icons/controls/close-ingame"] = {
			ImageSet = "img_set_1x_4",
			ImageRectOffset = Vector2.new(416, 220),
			ImageRectSize = Vector2.new(36, 36)
		},
		["icons/controls/keys/apostrophe"] = {
			ImageSet = "img_set_1x_4",
			ImageRectOffset = Vector2.new(454, 220),
			ImageRectSize = Vector2.new(36, 36)
		},
		["icons/controls/keys/arrowDown"] = {
			ImageSet = "img_set_1x_2",
			ImageRectOffset = Vector2.new(493, 303),
			ImageRectSize = Vector2.new(16, 16)
		},
		["icons/controls/keys/arrowLeft"] = {
			ImageSet = "img_set_1x_2",
			ImageRectOffset = Vector2.new(493, 401),
			ImageRectSize = Vector2.new(16, 16)
		},
		["icons/controls/keys/arrowRight"] = {
			ImageSet = "img_set_1x_2",
			ImageRectOffset = Vector2.new(471, 495),
			ImageRectSize = Vector2.new(16, 16)
		},
		["icons/controls/keys/arrowUp"] = {
			ImageSet = "img_set_1x_2",
			ImageRectOffset = Vector2.new(489, 495),
			ImageRectSize = Vector2.new(16, 16)
		},
		["icons/controls/keys/asterisk"] = {
			ImageSet = "img_set_1x_4",
			ImageRectOffset = Vector2.new(340, 258),
			ImageRectSize = Vector2.new(36, 36)
		},
		["icons/controls/keys/backspace"] = {
			ImageSet = "img_set_1x_4",
			ImageRectOffset = Vector2.new(378, 258),
			ImageRectSize = Vector2.new(36, 36)
		},
		["icons/controls/keys/capslock"] = {
			ImageSet = "img_set_1x_4",
			ImageRectOffset = Vector2.new(416, 258),
			ImageRectSize = Vector2.new(36, 36)
		},
		["icons/controls/keys/caret"] = {
			ImageSet = "img_set_1x_4",
			ImageRectOffset = Vector2.new(454, 258),
			ImageRectSize = Vector2.new(36, 36)
		},
		["icons/controls/keys/comma"] = {
			ImageSet = "img_set_1x_4",
			ImageRectOffset = Vector2.new(340, 296),
			ImageRectSize = Vector2.new(36, 36)
		},
		["icons/controls/keys/command"] = {
			ImageSet = "img_set_1x_4",
			ImageRectOffset = Vector2.new(378, 296),
			ImageRectSize = Vector2.new(36, 36)
		},
		["icons/controls/keys/control"] = {
			ImageSet = "img_set_1x_4",
			ImageRectOffset = Vector2.new(416, 296),
			ImageRectSize = Vector2.new(36, 36)
		},
		["icons/controls/keys/dpadDown"] = {
			ImageSet = "img_set_1x_4",
			ImageRectOffset = Vector2.new(454, 296),
			ImageRectSize = Vector2.new(36, 36)
		},
		["icons/controls/keys/dpadLeft"] = {
			ImageSet = "img_set_1x_4",
			ImageRectOffset = Vector2.new(340, 334),
			ImageRectSize = Vector2.new(36, 36)
		},
		["icons/controls/keys/dpadRight"] = {
			ImageSet = "img_set_1x_4",
			ImageRectOffset = Vector2.new(378, 334),
			ImageRectSize = Vector2.new(36, 36)
		},
		["icons/controls/keys/dpadUp"] = {
			ImageSet = "img_set_1x_4",
			ImageRectOffset = Vector2.new(416, 334),
			ImageRectSize = Vector2.new(36, 36)
		},
		["icons/controls/keys/graveaccent"] = {
			ImageSet = "img_set_1x_4",
			ImageRectOffset = Vector2.new(454, 334),
			ImageRectSize = Vector2.new(36, 36)
		},
		["icons/controls/keys/hold_button_assets/hold_Pressed_Arrow"] = {
			ImageSet = "img_set_1x_5",
			ImageRectOffset = Vector2.new(322, 334),
			ImageRectSize = Vector2.new(28, 28)
		},
		["icons/controls/keys/hold_button_assets/hold_Pressed_RadialFill"] = {
			ImageSet = "img_set_1x_5",
			ImageRectOffset = Vector2.new(474, 152),
			ImageRectSize = Vector2.new(28, 28)
		},
		["icons/controls/keys/hold_button_assets/hold_Pressed_XboxA"] = {
			ImageSet = "img_set_1x_5",
			ImageRectOffset = Vector2.new(436, 152),
			ImageRectSize = Vector2.new(28, 28)
		},
		["icons/controls/keys/hold_button_assets/hold_Unpressed_Arrow"] = {
			ImageSet = "img_set_1x_5",
			ImageRectOffset = Vector2.new(398, 152),
			ImageRectSize = Vector2.new(28, 28)
		},
		["icons/controls/keys/hold_button_assets/hold_Unpressed_RadialFill"] = {
			ImageSet = "img_set_1x_5",
			ImageRectOffset = Vector2.new(360, 152),
			ImageRectSize = Vector2.new(28, 28)
		},
		["icons/controls/keys/hold_button_assets/hold_Unpressed_XboxA"] = {
			ImageSet = "img_set_1x_5",
			ImageRectOffset = Vector2.new(322, 152),
			ImageRectSize = Vector2.new(28, 28)
		},
		["icons/controls/keys/key_alt"] = {
			ImageSet = "img_set_1x_4",
			ImageRectOffset = Vector2.new(340, 372),
			ImageRectSize = Vector2.new(36, 36)
		},
		["icons/controls/keys/key_esc"] = {
			ImageSet = "img_set_1x_4",
			ImageRectOffset = Vector2.new(340, 410),
			ImageRectSize = Vector2.new(36, 36)
		},
		["icons/controls/keys/key_l"] = {
			ImageSet = "img_set_1x_4",
			ImageRectOffset = Vector2.new(340, 448),
			ImageRectSize = Vector2.new(36, 36)
		},
		["icons/controls/keys/key_r"] = {
			ImageSet = "img_set_1x_4",
			ImageRectOffset = Vector2.new(378, 372),
			ImageRectSize = Vector2.new(36, 36)
		},
		["icons/controls/keys/key_shift"] = {
			ImageSet = "img_set_1x_4",
			ImageRectOffset = Vector2.new(416, 372),
			ImageRectSize = Vector2.new(36, 36)
		},
		["icons/controls/keys/key_single"] = {
			ImageSet = "img_set_1x_4",
			ImageRectOffset = Vector2.new(454, 372),
			ImageRectSize = Vector2.new(36, 36)
		},
		["icons/controls/keys/key_wide"] = {
			ImageSet = "img_set_1x_1",
			ImageRectOffset = Vector2.new(336, 402),
			ImageRectSize = Vector2.new(64, 36)
		},
		["icons/controls/keys/key_xwide"] = {
			ImageSet = "img_set_1x_1",
			ImageRectOffset = Vector2.new(242, 402),
			ImageRectSize = Vector2.new(92, 36)
		},
		["icons/controls/keys/period"] = {
			ImageSet = "img_set_1x_4",
			ImageRectOffset = Vector2.new(378, 410),
			ImageRectSize = Vector2.new(36, 36)
		},
		["icons/controls/keys/return"] = {
			ImageSet = "img_set_1x_4",
			ImageRectOffset = Vector2.new(378, 448),
			ImageRectSize = Vector2.new(36, 36)
		},
		["icons/controls/keys/shift"] = {
			ImageSet = "img_set_1x_4",
			ImageRectOffset = Vector2.new(416, 410),
			ImageRectSize = Vector2.new(36, 36)
		},
		["icons/controls/keys/spacebar"] = {
			ImageSet = "img_set_1x_4",
			ImageRectOffset = Vector2.new(454, 410),
			ImageRectSize = Vector2.new(36, 36)
		},
		["icons/controls/keys/tab"] = {
			ImageSet = "img_set_1x_4",
			ImageRectOffset = Vector2.new(416, 448),
			ImageRectSize = Vector2.new(36, 36)
		},
		["icons/controls/keys/xboxA"] = {
			ImageSet = "img_set_1x_4",
			ImageRectOffset = Vector2.new(454, 448),
			ImageRectSize = Vector2.new(36, 36)
		},
		["icons/controls/keys/xboxB"] = {
			ImageSet = "img_set_1x_6",
			ImageRectOffset = Vector2.new(322, 0),
			ImageRectSize = Vector2.new(36, 36)
		},
		["icons/controls/keys/xboxLB"] = {
			ImageSet = "img_set_1x_6",
			ImageRectOffset = Vector2.new(322, 38),
			ImageRectSize = Vector2.new(36, 36)
		},
		["icons/controls/keys/xboxLS"] = {
			ImageSet = "img_set_1x_6",
			ImageRectOffset = Vector2.new(322, 76),
			ImageRectSize = Vector2.new(36, 36)
		},
		["icons/controls/keys/xboxLSDirectional"] = {
			ImageSet = "img_set_1x_6",
			ImageRectOffset = Vector2.new(322, 114),
			ImageRectSize = Vector2.new(36, 36)
		},
		["icons/controls/keys/xboxLSHorizontal"] = {
			ImageSet = "img_set_1x_6",
			ImageRectOffset = Vector2.new(360, 0),
			ImageRectSize = Vector2.new(36, 36)
		},
		["icons/controls/keys/xboxLSVertical"] = {
			ImageSet = "img_set_1x_6",
			ImageRectOffset = Vector2.new(398, 0),
			ImageRectSize = Vector2.new(36, 36)
		},
		["icons/controls/keys/xboxLT"] = {
			ImageSet = "img_set_1x_6",
			ImageRectOffset = Vector2.new(436, 0),
			ImageRectSize = Vector2.new(36, 36)
		},
		["icons/controls/keys/xboxRB"] = {
			ImageSet = "img_set_1x_6",
			ImageRectOffset = Vector2.new(474, 0),
			ImageRectSize = Vector2.new(36, 36)
		},
		["icons/controls/keys/xboxRS"] = {
			ImageSet = "img_set_1x_6",
			ImageRectOffset = Vector2.new(360, 38),
			ImageRectSize = Vector2.new(36, 36)
		},
		["icons/controls/keys/xboxRSDirectional"] = {
			ImageSet = "img_set_1x_6",
			ImageRectOffset = Vector2.new(360, 76),
			ImageRectSize = Vector2.new(36, 36)
		},
		["icons/controls/keys/xboxRSHorizontal"] = {
			ImageSet = "img_set_1x_6",
			ImageRectOffset = Vector2.new(360, 114),
			ImageRectSize = Vector2.new(36, 36)
		},
		["icons/controls/keys/xboxRSVertical"] = {
			ImageSet = "img_set_1x_6",
			ImageRectOffset = Vector2.new(398, 38),
			ImageRectSize = Vector2.new(36, 36)
		},
		["icons/controls/keys/xboxRT"] = {
			ImageSet = "img_set_1x_6",
			ImageRectOffset = Vector2.new(436, 38),
			ImageRectSize = Vector2.new(36, 36)
		},
		["icons/controls/keys/xboxView"] = {
			ImageSet = "img_set_1x_6",
			ImageRectOffset = Vector2.new(474, 38),
			ImageRectSize = Vector2.new(36, 36)
		},
		["icons/controls/keys/xboxX"] = {
			ImageSet = "img_set_1x_6",
			ImageRectOffset = Vector2.new(398, 76),
			ImageRectSize = Vector2.new(36, 36)
		},
		["icons/controls/keys/xboxY"] = {
			ImageSet = "img_set_1x_6",
			ImageRectOffset = Vector2.new(398, 114),
			ImageRectSize = Vector2.new(36, 36)
		},
		["icons/controls/keys/xboxmenu"] = {
			ImageSet = "img_set_1x_6",
			ImageRectOffset = Vector2.new(436, 76),
			ImageRectSize = Vector2.new(36, 36)
		},
		["icons/controls/mediaStop_small"] = {
			ImageSet = "img_set_1x_4",
			ImageRectOffset = Vector2.new(309, 495),
			ImageRectSize = Vector2.new(16, 16)
		},
		["icons/controls/vehicle/driver"] = {
			ImageSet = "img_set_1x_6",
			ImageRectOffset = Vector2.new(474, 76),
			ImageRectSize = Vector2.new(36, 36)
		},
		["icons/controls/vehicle/flip"] = {
			ImageSet = "img_set_1x_6",
			ImageRectOffset = Vector2.new(436, 114),
			ImageRectSize = Vector2.new(36, 36)
		},
		["icons/controls/vehicle/passenger"] = {
			ImageSet = "img_set_1x_6",
			ImageRectOffset = Vector2.new(474, 114),
			ImageRectSize = Vector2.new(36, 36)
		},
		["icons/controls/voice/microphone_0_dark"] = {
			ImageSet = "img_set_1x_6",
			ImageRectOffset = Vector2.new(322, 182),
			ImageRectSize = Vector2.new(36, 36)
		},
		["icons/controls/voice/microphone_0_light"] = {
			ImageSet = "img_set_1x_6",
			ImageRectOffset = Vector2.new(322, 220),
			ImageRectSize = Vector2.new(36, 36)
		},
		["icons/controls/voice/microphone_0_small_dark"] = {
			ImageSet = "img_set_1x_4",
			ImageRectOffset = Vector2.new(492, 240),
			ImageRectSize = Vector2.new(16, 16)
		},
		["icons/controls/voice/microphone_0_small_light"] = {
			ImageSet = "img_set_1x_4",
			ImageRectOffset = Vector2.new(492, 278),
			ImageRectSize = Vector2.new(16, 16)
		},
		["icons/controls/voice/microphone_100_dark"] = {
			ImageSet = "img_set_1x_6",
			ImageRectOffset = Vector2.new(322, 258),
			ImageRectSize = Vector2.new(36, 36)
		},
		["icons/controls/voice/microphone_100_light"] = {
			ImageSet = "img_set_1x_6",
			ImageRectOffset = Vector2.new(322, 258),
			ImageRectSize = Vector2.new(36, 36)
		},
		["icons/controls/voice/microphone_100_small_dark"] = {
			ImageSet = "img_set_1x_4",
			ImageRectOffset = Vector2.new(492, 316),
			ImageRectSize = Vector2.new(16, 16)
		},
		["icons/controls/voice/microphone_100_small_light"] = {
			ImageSet = "img_set_1x_4",
			ImageRectOffset = Vector2.new(492, 316),
			ImageRectSize = Vector2.new(16, 16)
		},
		["icons/controls/voice/microphone_20_dark"] = {
			ImageSet = "img_set_1x_6",
			ImageRectOffset = Vector2.new(322, 296),
			ImageRectSize = Vector2.new(36, 36)
		},
		["icons/controls/voice/microphone_20_light"] = {
			ImageSet = "img_set_1x_6",
			ImageRectOffset = Vector2.new(360, 182),
			ImageRectSize = Vector2.new(36, 36)
		},
		["icons/controls/voice/microphone_20_small_dark"] = {
			ImageSet = "img_set_1x_4",
			ImageRectOffset = Vector2.new(492, 354),
			ImageRectSize = Vector2.new(16, 16)
		},
		["icons/controls/voice/microphone_20_small_light"] = {
			ImageSet = "img_set_1x_4",
			ImageRectOffset = Vector2.new(492, 392),
			ImageRectSize = Vector2.new(16, 16)
		},
		["icons/controls/voice/microphone_40_dark"] = {
			ImageSet = "img_set_1x_6",
			ImageRectOffset = Vector2.new(398, 182),
			ImageRectSize = Vector2.new(36, 36)
		},
		["icons/controls/voice/microphone_40_light"] = {
			ImageSet = "img_set_1x_6",
			ImageRectOffset = Vector2.new(436, 182),
			ImageRectSize = Vector2.new(36, 36)
		},
		["icons/controls/voice/microphone_40_small_dark"] = {
			ImageSet = "img_set_1x_4",
			ImageRectOffset = Vector2.new(398, 486),
			ImageRectSize = Vector2.new(16, 16)
		},
		["icons/controls/voice/microphone_40_small_light"] = {
			ImageSet = "img_set_1x_4",
			ImageRectOffset = Vector2.new(492, 430),
			ImageRectSize = Vector2.new(16, 16)
		},
		["icons/controls/voice/microphone_60_dark"] = {
			ImageSet = "img_set_1x_6",
			ImageRectOffset = Vector2.new(474, 182),
			ImageRectSize = Vector2.new(36, 36)
		},
		["icons/controls/voice/microphone_60_light"] = {
			ImageSet = "img_set_1x_6",
			ImageRectOffset = Vector2.new(360, 220),
			ImageRectSize = Vector2.new(36, 36)
		},
		["icons/controls/voice/microphone_60_small_dark"] = {
			ImageSet = "img_set_1x_4",
			ImageRectOffset = Vector2.new(436, 486),
			ImageRectSize = Vector2.new(16, 16)
		},
		["icons/controls/voice/microphone_60_small_light"] = {
			ImageSet = "img_set_1x_4",
			ImageRectOffset = Vector2.new(492, 468),
			ImageRectSize = Vector2.new(16, 16)
		},
		["icons/controls/voice/microphone_80_dark"] = {
			ImageSet = "img_set_1x_6",
			ImageRectOffset = Vector2.new(360, 258),
			ImageRectSize = Vector2.new(36, 36)
		},
		["icons/controls/voice/microphone_80_light"] = {
			ImageSet = "img_set_1x_6",
			ImageRectOffset = Vector2.new(360, 296),
			ImageRectSize = Vector2.new(36, 36)
		},
		["icons/controls/voice/microphone_80_small_dark"] = {
			ImageSet = "img_set_1x_4",
			ImageRectOffset = Vector2.new(494, 486),
			ImageRectSize = Vector2.new(16, 16)
		},
		["icons/controls/voice/microphone_80_small_light"] = {
			ImageSet = "img_set_1x_6",
			ImageRectOffset = Vector2.new(322, 152),
			ImageRectSize = Vector2.new(16, 16)
		},
		["icons/controls/voice/microphone_error_dark"] = {
			ImageSet = "img_set_1x_6",
			ImageRectOffset = Vector2.new(398, 220),
			ImageRectSize = Vector2.new(36, 36)
		},
		["icons/controls/voice/microphone_error_light"] = {
			ImageSet = "img_set_1x_6",
			ImageRectOffset = Vector2.new(436, 220),
			ImageRectSize = Vector2.new(36, 36)
		},
		["icons/controls/voice/microphone_error_small_dark"] = {
			ImageSet = "img_set_1x_6",
			ImageRectOffset = Vector2.new(340, 152),
			ImageRectSize = Vector2.new(16, 16)
		},
		["icons/controls/voice/microphone_error_small_light"] = {
			ImageSet = "img_set_1x_6",
			ImageRectOffset = Vector2.new(360, 152),
			ImageRectSize = Vector2.new(16, 16)
		},
		["icons/controls/voice/microphone_off_dark"] = {
			ImageSet = "img_set_1x_6",
			ImageRectOffset = Vector2.new(474, 220),
			ImageRectSize = Vector2.new(36, 36)
		},
		["icons/controls/voice/microphone_off_light"] = {
			ImageSet = "img_set_1x_6",
			ImageRectOffset = Vector2.new(398, 258),
			ImageRectSize = Vector2.new(36, 36)
		},
		["icons/controls/voice/microphone_off_small_dark"] = {
			ImageSet = "img_set_1x_6",
			ImageRectOffset = Vector2.new(378, 152),
			ImageRectSize = Vector2.new(16, 16)
		},
		["icons/controls/voice/microphone_off_small_light"] = {
			ImageSet = "img_set_1x_6",
			ImageRectOffset = Vector2.new(398, 152),
			ImageRectSize = Vector2.new(16, 16)
		},
		["icons/controls/voice/microphone_on_dark"] = {
			ImageSet = "img_set_1x_6",
			ImageRectOffset = Vector2.new(322, 182),
			ImageRectSize = Vector2.new(36, 36)
		},
		["icons/controls/voice/microphone_on_light"] = {
			ImageSet = "img_set_1x_6",
			ImageRectOffset = Vector2.new(322, 220),
			ImageRectSize = Vector2.new(36, 36)
		},
		["icons/controls/voice/microphone_on_small_dark"] = {
			ImageSet = "img_set_1x_4",
			ImageRectOffset = Vector2.new(492, 240),
			ImageRectSize = Vector2.new(16, 16)
		},
		["icons/controls/voice/microphone_on_small_light"] = {
			ImageSet = "img_set_1x_4",
			ImageRectOffset = Vector2.new(492, 278),
			ImageRectSize = Vector2.new(16, 16)
		},
		["icons/controls/voice/red_speaker_0_dark"] = {
			ImageSet = "img_set_1x_6",
			ImageRectOffset = Vector2.new(398, 296),
			ImageRectSize = Vector2.new(36, 36)
		},
		["icons/controls/voice/red_speaker_0_light"] = {
			ImageSet = "img_set_1x_6",
			ImageRectOffset = Vector2.new(436, 258),
			ImageRectSize = Vector2.new(36, 36)
		},
		["icons/controls/voice/red_speaker_0_small_dark"] = {
			ImageSet = "img_set_1x_6",
			ImageRectOffset = Vector2.new(416, 152),
			ImageRectSize = Vector2.new(16, 16)
		},
		["icons/controls/voice/red_speaker_0_small_light"] = {
			ImageSet = "img_set_1x_6",
			ImageRectOffset = Vector2.new(436, 152),
			ImageRectSize = Vector2.new(16, 16)
		},
		["icons/controls/voice/red_speaker_100_dark"] = {
			ImageSet = "img_set_1x_6",
			ImageRectOffset = Vector2.new(474, 258),
			ImageRectSize = Vector2.new(36, 36)
		},
		["icons/controls/voice/red_speaker_100_light"] = {
			ImageSet = "img_set_1x_6",
			ImageRectOffset = Vector2.new(474, 258),
			ImageRectSize = Vector2.new(36, 36)
		},
		["icons/controls/voice/red_speaker_100_small_dark"] = {
			ImageSet = "img_set_1x_6",
			ImageRectOffset = Vector2.new(454, 152),
			ImageRectSize = Vector2.new(16, 16)
		},
		["icons/controls/voice/red_speaker_100_small_light"] = {
			ImageSet = "img_set_1x_6",
			ImageRectOffset = Vector2.new(454, 152),
			ImageRectSize = Vector2.new(16, 16)
		},
		["icons/controls/voice/red_speaker_20_dark"] = {
			ImageSet = "img_set_1x_6",
			ImageRectOffset = Vector2.new(436, 296),
			ImageRectSize = Vector2.new(36, 36)
		},
		["icons/controls/voice/red_speaker_20_light"] = {
			ImageSet = "img_set_1x_6",
			ImageRectOffset = Vector2.new(474, 296),
			ImageRectSize = Vector2.new(36, 36)
		},
		["icons/controls/voice/red_speaker_20_small_dark"] = {
			ImageSet = "img_set_1x_6",
			ImageRectOffset = Vector2.new(474, 152),
			ImageRectSize = Vector2.new(16, 16)
		},
		["icons/controls/voice/red_speaker_20_small_light"] = {
			ImageSet = "img_set_1x_6",
			ImageRectOffset = Vector2.new(492, 152),
			ImageRectSize = Vector2.new(16, 16)
		},
		["icons/controls/voice/red_speaker_40_dark"] = {
			ImageSet = "img_set_1x_6",
			ImageRectOffset = Vector2.new(438, 364),
			ImageRectSize = Vector2.new(36, 36)
		},
		["icons/controls/voice/red_speaker_40_light"] = {
			ImageSet = "img_set_1x_6",
			ImageRectOffset = Vector2.new(438, 426),
			ImageRectSize = Vector2.new(36, 36)
		},
		["icons/controls/voice/red_speaker_40_small_dark"] = {
			ImageSet = "img_set_1x_6",
			ImageRectOffset = Vector2.new(322, 334),
			ImageRectSize = Vector2.new(16, 16)
		},
		["icons/controls/voice/red_speaker_40_small_light"] = {
			ImageSet = "img_set_1x_6",
			ImageRectOffset = Vector2.new(340, 334),
			ImageRectSize = Vector2.new(16, 16)
		},
		["icons/controls/voice/red_speaker_60_dark"] = {
			ImageSet = "img_set_1x_7",
			ImageRectOffset = Vector2.new(436, 76),
			ImageRectSize = Vector2.new(36, 36)
		},
		["icons/controls/voice/red_speaker_60_light"] = {
			ImageSet = "img_set_1x_7",
			ImageRectOffset = Vector2.new(398, 114),
			ImageRectSize = Vector2.new(36, 36)
		},
		["icons/controls/voice/red_speaker_60_small_dark"] = {
			ImageSet = "img_set_1x_6",
			ImageRectOffset = Vector2.new(360, 334),
			ImageRectSize = Vector2.new(16, 16)
		},
		["icons/controls/voice/red_speaker_60_small_light"] = {
			ImageSet = "img_set_1x_6",
			ImageRectOffset = Vector2.new(378, 334),
			ImageRectSize = Vector2.new(16, 16)
		},
		["icons/controls/voice/red_speaker_80_dark"] = {
			ImageSet = "img_set_1x_7",
			ImageRectOffset = Vector2.new(398, 76),
			ImageRectSize = Vector2.new(36, 36)
		},
		["icons/controls/voice/red_speaker_80_light"] = {
			ImageSet = "img_set_1x_7",
			ImageRectOffset = Vector2.new(474, 38),
			ImageRectSize = Vector2.new(36, 36)
		},
		["icons/controls/voice/red_speaker_80_small_dark"] = {
			ImageSet = "img_set_1x_6",
			ImageRectOffset = Vector2.new(398, 334),
			ImageRectSize = Vector2.new(16, 16)
		},
		["icons/controls/voice/red_speaker_80_small_light"] = {
			ImageSet = "img_set_1x_6",
			ImageRectOffset = Vector2.new(416, 334),
			ImageRectSize = Vector2.new(16, 16)
		},
		["icons/controls/voice/speaker_0_dark"] = {
			ImageSet = "img_set_1x_7",
			ImageRectOffset = Vector2.new(436, 38),
			ImageRectSize = Vector2.new(36, 36)
		},
		["icons/controls/voice/speaker_0_light"] = {
			ImageSet = "img_set_1x_7",
			ImageRectOffset = Vector2.new(398, 38),
			ImageRectSize = Vector2.new(36, 36)
		},
		["icons/controls/voice/speaker_0_small_dark"] = {
			ImageSet = "img_set_1x_6",
			ImageRectOffset = Vector2.new(416, 152),
			ImageRectSize = Vector2.new(16, 16)
		},
		["icons/controls/voice/speaker_0_small_light"] = {
			ImageSet = "img_set_1x_6",
			ImageRectOffset = Vector2.new(436, 334),
			ImageRectSize = Vector2.new(16, 16)
		},
		["icons/controls/voice/speaker_100_dark"] = {
			ImageSet = "img_set_1x_7",
			ImageRectOffset = Vector2.new(360, 114),
			ImageRectSize = Vector2.new(36, 36)
		},
		["icons/controls/voice/speaker_100_light"] = {
			ImageSet = "img_set_1x_7",
			ImageRectOffset = Vector2.new(360, 114),
			ImageRectSize = Vector2.new(36, 36)
		},
		["icons/controls/voice/speaker_100_small_dark"] = {
			ImageSet = "img_set_1x_6",
			ImageRectOffset = Vector2.new(454, 334),
			ImageRectSize = Vector2.new(16, 16)
		},
		["icons/controls/voice/speaker_100_small_light"] = {
			ImageSet = "img_set_1x_6",
			ImageRectOffset = Vector2.new(454, 334),
			ImageRectSize = Vector2.new(16, 16)
		},
		["icons/controls/voice/speaker_20_dark"] = {
			ImageSet = "img_set_1x_7",
			ImageRectOffset = Vector2.new(360, 76),
			ImageRectSize = Vector2.new(36, 36)
		},
		["icons/controls/voice/speaker_20_light"] = {
			ImageSet = "img_set_1x_7",
			ImageRectOffset = Vector2.new(360, 38),
			ImageRectSize = Vector2.new(36, 36)
		},
		["icons/controls/voice/speaker_20_small_dark"] = {
			ImageSet = "img_set_1x_6",
			ImageRectOffset = Vector2.new(474, 334),
			ImageRectSize = Vector2.new(16, 16)
		},
		["icons/controls/voice/speaker_20_small_light"] = {
			ImageSet = "img_set_1x_6",
			ImageRectOffset = Vector2.new(492, 334),
			ImageRectSize = Vector2.new(16, 16)
		},
		["icons/controls/voice/speaker_40_dark"] = {
			ImageSet = "img_set_1x_7",
			ImageRectOffset = Vector2.new(474, 0),
			ImageRectSize = Vector2.new(36, 36)
		},
		["icons/controls/voice/speaker_40_light"] = {
			ImageSet = "img_set_1x_7",
			ImageRectOffset = Vector2.new(436, 0),
			ImageRectSize = Vector2.new(36, 36)
		},
		["icons/controls/voice/speaker_40_small_dark"] = {
			ImageSet = "img_set_1x_6",
			ImageRectOffset = Vector2.new(438, 402),
			ImageRectSize = Vector2.new(16, 16)
		},
		["icons/controls/voice/speaker_40_small_light"] = {
			ImageSet = "img_set_1x_5",
			ImageRectOffset = Vector2.new(489, 488),
			ImageRectSize = Vector2.new(16, 16)
		},
		["icons/controls/voice/speaker_60_dark"] = {
			ImageSet = "img_set_1x_7",
			ImageRectOffset = Vector2.new(398, 0),
			ImageRectSize = Vector2.new(36, 36)
		},
		["icons/controls/voice/speaker_60_light"] = {
			ImageSet = "img_set_1x_7",
			ImageRectOffset = Vector2.new(360, 0),
			ImageRectSize = Vector2.new(36, 36)
		},
		["icons/controls/voice/speaker_60_small_dark"] = {
			ImageSet = "img_set_1x_5",
			ImageRectOffset = Vector2.new(471, 488),
			ImageRectSize = Vector2.new(16, 16)
		},
		["icons/controls/voice/speaker_60_small_light"] = {
			ImageSet = "img_set_1x_5",
			ImageRectOffset = Vector2.new(453, 488),
			ImageRectSize = Vector2.new(16, 16)
		},
		["icons/controls/voice/speaker_80_dark"] = {
			ImageSet = "img_set_1x_7",
			ImageRectOffset = Vector2.new(322, 114),
			ImageRectSize = Vector2.new(36, 36)
		},
		["icons/controls/voice/speaker_80_light"] = {
			ImageSet = "img_set_1x_7",
			ImageRectOffset = Vector2.new(322, 76),
			ImageRectSize = Vector2.new(36, 36)
		},
		["icons/controls/voice/speaker_80_small_dark"] = {
			ImageSet = "img_set_1x_5",
			ImageRectOffset = Vector2.new(435, 488),
			ImageRectSize = Vector2.new(16, 16)
		},
		["icons/controls/voice/speaker_80_small_light"] = {
			ImageSet = "img_set_1x_5",
			ImageRectOffset = Vector2.new(417, 488),
			ImageRectSize = Vector2.new(16, 16)
		},
		["icons/controls/voice/speaker_error_dark"] = {
			ImageSet = "img_set_1x_7",
			ImageRectOffset = Vector2.new(322, 38),
			ImageRectSize = Vector2.new(36, 36)
		},
		["icons/controls/voice/speaker_error_light"] = {
			ImageSet = "img_set_1x_7",
			ImageRectOffset = Vector2.new(322, 0),
			ImageRectSize = Vector2.new(36, 36)
		},
		["icons/controls/voice/speaker_error_small_dark"] = {
			ImageSet = "img_set_1x_5",
			ImageRectOffset = Vector2.new(399, 488),
			ImageRectSize = Vector2.new(16, 16)
		},
		["icons/controls/voice/speaker_error_small_light"] = {
			ImageSet = "img_set_1x_5",
			ImageRectOffset = Vector2.new(381, 488),
			ImageRectSize = Vector2.new(16, 16)
		},
		["icons/controls/voice/speaker_off_dark"] = {
			ImageSet = "img_set_1x_5",
			ImageRectOffset = Vector2.new(438, 426),
			ImageRectSize = Vector2.new(36, 36)
		},
		["icons/controls/voice/speaker_off_light"] = {
			ImageSet = "img_set_1x_5",
			ImageRectOffset = Vector2.new(444, 364),
			ImageRectSize = Vector2.new(36, 36)
		},
		["icons/controls/voice/speaker_off_small_dark"] = {
			ImageSet = "img_set_1x_5",
			ImageRectOffset = Vector2.new(363, 488),
			ImageRectSize = Vector2.new(16, 16)
		},
		["icons/controls/voice/speaker_off_small_light"] = {
			ImageSet = "img_set_1x_5",
			ImageRectOffset = Vector2.new(345, 488),
			ImageRectSize = Vector2.new(16, 16)
		},
		["icons/controls/voice/speaker_on_dark"] = {
			ImageSet = "img_set_1x_7",
			ImageRectOffset = Vector2.new(436, 38),
			ImageRectSize = Vector2.new(36, 36)
		},
		["icons/controls/voice/speaker_on_light"] = {
			ImageSet = "img_set_1x_7",
			ImageRectOffset = Vector2.new(398, 38),
			ImageRectSize = Vector2.new(36, 36)
		},
		["icons/controls/voice/speaker_on_small_dark"] = {
			ImageSet = "img_set_1x_6",
			ImageRectOffset = Vector2.new(416, 152),
			ImageRectSize = Vector2.new(16, 16)
		},
		["icons/controls/voice/speaker_on_small_light"] = {
			ImageSet = "img_set_1x_6",
			ImageRectOffset = Vector2.new(436, 334),
			ImageRectSize = Vector2.new(16, 16)
		},
		["icons/controls/voice/video_error_dark"] = {
			ImageSet = "img_set_1x_5",
			ImageRectOffset = Vector2.new(474, 296),
			ImageRectSize = Vector2.new(36, 36)
		},
		["icons/controls/voice/video_error_light"] = {
			ImageSet = "img_set_1x_5",
			ImageRectOffset = Vector2.new(436, 296),
			ImageRectSize = Vector2.new(36, 36)
		},
		["icons/controls/voice/video_error_small_dark"] = {
			ImageSet = "img_set_1x_5",
			ImageRectOffset = Vector2.new(327, 488),
			ImageRectSize = Vector2.new(16, 16)
		},
		["icons/controls/voice/video_error_small_light"] = {
			ImageSet = "img_set_1x_5",
			ImageRectOffset = Vector2.new(309, 488),
			ImageRectSize = Vector2.new(16, 16)
		},
		["icons/controls/voice/video_off_dark"] = {
			ImageSet = "img_set_1x_5",
			ImageRectOffset = Vector2.new(474, 258),
			ImageRectSize = Vector2.new(36, 36)
		},
		["icons/controls/voice/video_off_light"] = {
			ImageSet = "img_set_1x_5",
			ImageRectOffset = Vector2.new(436, 258),
			ImageRectSize = Vector2.new(36, 36)
		},
		["icons/controls/voice/video_off_small_dark"] = {
			ImageSet = "img_set_1x_5",
			ImageRectOffset = Vector2.new(291, 488),
			ImageRectSize = Vector2.new(16, 16)
		},
		["icons/controls/voice/video_off_small_light"] = {
			ImageSet = "img_set_1x_5",
			ImageRectOffset = Vector2.new(273, 488),
			ImageRectSize = Vector2.new(16, 16)
		},
		["icons/controls/voice/video_on_dark"] = {
			ImageSet = "img_set_1x_5",
			ImageRectOffset = Vector2.new(398, 296),
			ImageRectSize = Vector2.new(36, 36)
		},
		["icons/controls/voice/video_on_light"] = {
			ImageSet = "img_set_1x_5",
			ImageRectOffset = Vector2.new(398, 258),
			ImageRectSize = Vector2.new(36, 36)
		},
		["icons/controls/voice/video_on_small_dark"] = {
			ImageSet = "img_set_1x_5",
			ImageRectOffset = Vector2.new(255, 488),
			ImageRectSize = Vector2.new(16, 16)
		},
		["icons/controls/voice/video_on_small_light"] = {
			ImageSet = "img_set_1x_5",
			ImageRectOffset = Vector2.new(237, 488),
			ImageRectSize = Vector2.new(16, 16)
		},
		["icons/graphic/blocktheft_2xl"] = {
			ImageSet = "img_set_1x_2",
			ImageRectOffset = Vector2.new(395, 74),
			ImageRectSize = Vector2.new(96, 96)
		},
		["icons/graphic/camera_on_off"] = {
			ImageSet = "img_set_1x_3",
			ImageRectOffset = Vector2.new(0, 464),
			ImageRectSize = Vector2.new(44, 44)
		},
		["icons/graphic/clothes_category_art_dark"] = {
			ImageSet = "img_set_1x_6",
			ImageRectOffset = Vector2.new(0, 0),
			ImageRectSize = Vector2.new(320, 180)
		},
		["icons/graphic/clothes_category_art_light"] = {
			ImageSet = "img_set_1x_6",
			ImageRectOffset = Vector2.new(0, 182),
			ImageRectSize = Vector2.new(320, 180)
		},
		["icons/graphic/connectcontacts_xlarge"] = {
			ImageSet = "img_set_1x_2",
			ImageRectOffset = Vector2.new(395, 223),
			ImageRectSize = Vector2.new(96, 96)
		},
		["icons/graphic/connectdevices_2xl"] = {
			ImageSet = "img_set_1x_2",
			ImageRectOffset = Vector2.new(395, 321),
			ImageRectSize = Vector2.new(96, 96)
		},
		["icons/graphic/devices_xxlarge"] = {
			ImageSet = "img_set_1x_10",
			ImageRectOffset = Vector2.new(0, 248),
			ImageRectSize = Vector2.new(192, 192)
		},
		["icons/graphic/envelope_dark"] = {
			ImageSet = "img_set_1x_7",
			ImageRectOffset = Vector2.new(0, 182),
			ImageRectSize = Vector2.new(320, 180)
		},
		["icons/graphic/envelope_light"] = {
			ImageSet = "img_set_1x_7",
			ImageRectOffset = Vector2.new(0, 0),
			ImageRectSize = Vector2.new(320, 180)
		},
		["icons/graphic/error_xlarge"] = {
			ImageSet = "img_set_1x_3",
			ImageRectOffset = Vector2.new(340, 358),
			ImageRectSize = Vector2.new(96, 96)
		},
		["icons/graphic/findfriends_xlarge"] = {
			ImageSet = "img_set_1x_3",
			ImageRectOffset = Vector2.new(340, 260),
			ImageRectSize = Vector2.new(96, 96)
		},
		["icons/graphic/gamesanditems_2xl"] = {
			ImageSet = "img_set_1x_1",
			ImageRectOffset = Vector2.new(402, 396),
			ImageRectSize = Vector2.new(96, 96)
		},
		["icons/graphic/loadingspinner"] = {
			ImageSet = "img_set_1x_4",
			ImageRectOffset = Vector2.new(410, 0),
			ImageRectSize = Vector2.new(48, 48)
		},
		["icons/graphic/newclothing_3xl"] = {
			ImageSet = "img_set_1x_9",
			ImageRectOffset = Vector2.new(302, 194),
			ImageRectSize = Vector2.new(192, 192)
		},
		["icons/graphic/newclothing_xlarge"] = {
			ImageSet = "img_set_1x_1",
			ImageRectOffset = Vector2.new(402, 298),
			ImageRectSize = Vector2.new(96, 96)
		},
		["icons/graphic/passkey_upsell_dark"] = {
			ImageSet = "img_set_1x_2",
			ImageRectOffset = Vector2.new(0, 0),
			ImageRectSize = Vector2.new(393, 221)
		},
		["icons/graphic/passkey_upsell_light"] = {
			ImageSet = "img_set_1x_2",
			ImageRectOffset = Vector2.new(0, 223),
			ImageRectSize = Vector2.new(393, 221)
		},
		["icons/graphic/robuxcoin1_xxlarge"] = {
			ImageSet = "img_set_1x_8",
			ImageRectOffset = Vector2.new(0, 302),
			ImageRectSize = Vector2.new(193, 192)
		},
		["icons/graphic/robuxcoin2_xxlarge"] = {
			ImageSet = "img_set_1x_8",
			ImageRectOffset = Vector2.new(302, 0),
			ImageRectSize = Vector2.new(193, 192)
		},
		["icons/graphic/robuxcoin3_xxlarge"] = {
			ImageSet = "img_set_1x_8",
			ImageRectOffset = Vector2.new(302, 194),
			ImageRectSize = Vector2.new(193, 192)
		},
		["icons/graphic/robuxcoin4_xxlarge"] = {
			ImageSet = "img_set_1x_10",
			ImageRectOffset = Vector2.new(248, 0),
			ImageRectSize = Vector2.new(192, 190)
		},
		["icons/graphic/robuxcoin5_xxlarge"] = {
			ImageSet = "img_set_1x_9",
			ImageRectOffset = Vector2.new(302, 0),
			ImageRectSize = Vector2.new(192, 192)
		},
		["icons/graphic/robuxcoin6_xxlarge"] = {
			ImageSet = "img_set_1x_9",
			ImageRectOffset = Vector2.new(0, 302),
			ImageRectSize = Vector2.new(193, 192)
		},
		["icons/graphic/success_xlarge"] = {
			ImageSet = "img_set_1x_1",
			ImageRectOffset = Vector2.new(402, 200),
			ImageRectSize = Vector2.new(96, 96)
		},
		["icons/graphic/verifyCode_dark"] = {
			ImageSet = "img_set_1x_5",
			ImageRectOffset = Vector2.new(0, 182),
			ImageRectSize = Vector2.new(320, 180)
		},
		["icons/graphic/verifyCode_light"] = {
			ImageSet = "img_set_1x_5",
			ImageRectOffset = Vector2.new(0, 0),
			ImageRectSize = Vector2.new(320, 180)
		},
		["icons/graphic/voicechat_large"] = {
			ImageSet = "img_set_1x_4",
			ImageRectOffset = Vector2.new(460, 0),
			ImageRectSize = Vector2.new(48, 48)
		},
		["icons/logo/letterform"] = {
			ImageSet = "img_set_1x_1",
			ImageRectOffset = Vector2.new(0, 456),
			ImageRectSize = Vector2.new(188, 36)
		},
		["icons/logo/letterform_classic"] = {
			ImageSet = "img_set_1x_2",
			ImageRectOffset = Vector2.new(0, 446),
			ImageRectSize = Vector2.new(228, 60)
		},
		["icons/logo/letterform_dark"] = {
			ImageSet = "img_set_1x_6",
			ImageRectOffset = Vector2.new(0, 364),
			ImageRectSize = Vector2.new(217, 60)
		},
		["icons/logo/letterform_dark_01"] = {
			ImageSet = "img_set_1x_6",
			ImageRectOffset = Vector2.new(219, 364),
			ImageRectSize = Vector2.new(217, 60)
		},
		["icons/logo/letterform_dark_02"] = {
			ImageSet = "img_set_1x_5",
			ImageRectOffset = Vector2.new(222, 364),
			ImageRectSize = Vector2.new(220, 60)
		},
		["icons/logo/letterform_dark_03"] = {
			ImageSet = "img_set_1x_4",
			ImageRectOffset = Vector2.new(0, 340),
			ImageRectSize = Vector2.new(228, 60)
		},
		["icons/logo/letterform_dark_04"] = {
			ImageSet = "img_set_1x_4",
			ImageRectOffset = Vector2.new(0, 402),
			ImageRectSize = Vector2.new(228, 60)
		},
		["icons/logo/letterform_dark_05"] = {
			ImageSet = "img_set_1x_7",
			ImageRectOffset = Vector2.new(218, 364),
			ImageRectSize = Vector2.new(216, 60)
		},
		["icons/logo/letterform_dark_06"] = {
			ImageSet = "img_set_1x_2",
			ImageRectOffset = Vector2.new(0, 446),
			ImageRectSize = Vector2.new(228, 60)
		},
		["icons/logo/letterform_dark_hat"] = {
			ImageSet = "img_set_1x_6",
			ImageRectOffset = Vector2.new(0, 426),
			ImageRectSize = Vector2.new(217, 60)
		},
		["icons/logo/letterform_light"] = {
			ImageSet = "img_set_1x_6",
			ImageRectOffset = Vector2.new(219, 426),
			ImageRectSize = Vector2.new(217, 60)
		},
		["icons/logo/letterform_light_01"] = {
			ImageSet = "img_set_1x_5",
			ImageRectOffset = Vector2.new(219, 426),
			ImageRectSize = Vector2.new(217, 60)
		},
		["icons/logo/letterform_light_02"] = {
			ImageSet = "img_set_1x_5",
			ImageRectOffset = Vector2.new(0, 364),
			ImageRectSize = Vector2.new(220, 60)
		},
		["icons/logo/letterform_light_03"] = {
			ImageSet = "img_set_1x_3",
			ImageRectOffset = Vector2.new(0, 402),
			ImageRectSize = Vector2.new(228, 60)
		},
		["icons/logo/letterform_light_04"] = {
			ImageSet = "img_set_1x_3",
			ImageRectOffset = Vector2.new(0, 340),
			ImageRectSize = Vector2.new(228, 60)
		},
		["icons/logo/letterform_light_05"] = {
			ImageSet = "img_set_1x_7",
			ImageRectOffset = Vector2.new(0, 364),
			ImageRectSize = Vector2.new(216, 60)
		},
		["icons/logo/letterform_light_06"] = {
			ImageSet = "img_set_1x_2",
			ImageRectOffset = Vector2.new(0, 446),
			ImageRectSize = Vector2.new(228, 60)
		},
		["icons/logo/letterform_light_hat"] = {
			ImageSet = "img_set_1x_5",
			ImageRectOffset = Vector2.new(0, 426),
			ImageRectSize = Vector2.new(217, 60)
		},
		["icons/logo/studiologo"] = {
			ImageSet = "img_set_1x_5",
			ImageRectOffset = Vector2.new(474, 220),
			ImageRectSize = Vector2.new(36, 36)
		},
		["icons/logo/studiologo_small"] = {
			ImageSet = "img_set_1x_5",
			ImageRectOffset = Vector2.new(219, 488),
			ImageRectSize = Vector2.new(16, 16)
		},
		["icons/menu/2-person-with-bubble"] = {
			ImageSet = "img_set_1x_5",
			ImageRectOffset = Vector2.new(398, 220),
			ImageRectSize = Vector2.new(36, 36)
		},
		["icons/menu/2-person-with-bubble-on"] = {
			ImageSet = "img_set_1x_5",
			ImageRectOffset = Vector2.new(436, 220),
			ImageRectSize = Vector2.new(36, 36)
		},
		["icons/menu/AR_cube"] = {
			ImageSet = "img_set_1x_5",
			ImageRectOffset = Vector2.new(360, 296),
			ImageRectSize = Vector2.new(36, 36)
		},
		["icons/menu/AR_frame"] = {
			ImageSet = "img_set_1x_5",
			ImageRectOffset = Vector2.new(360, 258),
			ImageRectSize = Vector2.new(36, 36)
		},
		["icons/menu/adjust/position_small"] = {
			ImageSet = "img_set_1x_5",
			ImageRectOffset = Vector2.new(494, 458),
			ImageRectSize = Vector2.new(16, 16)
		},
		["icons/menu/adjust/rotationZ"] = {
			ImageSet = "img_set_1x_5",
			ImageRectOffset = Vector2.new(360, 220),
			ImageRectSize = Vector2.new(36, 36)
		},
		["icons/menu/avatar_off"] = {
			ImageSet = "img_set_1x_5",
			ImageRectOffset = Vector2.new(474, 182),
			ImageRectSize = Vector2.new(36, 36)
		},
		["icons/menu/avatar_on"] = {
			ImageSet = "img_set_1x_5",
			ImageRectOffset = Vector2.new(436, 182),
			ImageRectSize = Vector2.new(36, 36)
		},
		["icons/menu/body_female"] = {
			ImageSet = "img_set_1x_5",
			ImageRectOffset = Vector2.new(398, 182),
			ImageRectSize = Vector2.new(36, 36)
		},
		["icons/menu/body_heavy"] = {
			ImageSet = "img_set_1x_5",
			ImageRectOffset = Vector2.new(360, 182),
			ImageRectSize = Vector2.new(36, 36)
		},
		["icons/menu/body_male"] = {
			ImageSet = "img_set_1x_5",
			ImageRectOffset = Vector2.new(322, 296),
			ImageRectSize = Vector2.new(36, 36)
		},
		["icons/menu/body_neutral"] = {
			ImageSet = "img_set_1x_5",
			ImageRectOffset = Vector2.new(322, 258),
			ImageRectSize = Vector2.new(36, 36)
		},
		["icons/menu/body_short"] = {
			ImageSet = "img_set_1x_5",
			ImageRectOffset = Vector2.new(322, 220),
			ImageRectSize = Vector2.new(36, 36)
		},
		["icons/menu/body_tall"] = {
			ImageSet = "img_set_1x_5",
			ImageRectOffset = Vector2.new(322, 182),
			ImageRectSize = Vector2.new(36, 36)
		},
		["icons/menu/body_thin"] = {
			ImageSet = "img_set_1x_5",
			ImageRectOffset = Vector2.new(474, 114),
			ImageRectSize = Vector2.new(36, 36)
		},
		["icons/menu/clothing/accessories_on"] = {
			ImageSet = "img_set_1x_2",
			ImageRectOffset = Vector2.new(493, 74),
			ImageRectSize = Vector2.new(18, 18)
		},
		["icons/menu/clothing/animation_off"] = {
			ImageSet = "img_set_1x_2",
			ImageRectOffset = Vector2.new(493, 94),
			ImageRectSize = Vector2.new(18, 18)
		},
		["icons/menu/clothing/animation_on"] = {
			ImageSet = "img_set_1x_2",
			ImageRectOffset = Vector2.new(493, 114),
			ImageRectSize = Vector2.new(18, 18)
		},
		["icons/menu/clothing/back_on"] = {
			ImageSet = "img_set_1x_2",
			ImageRectOffset = Vector2.new(493, 134),
			ImageRectSize = Vector2.new(18, 18)
		},
		["icons/menu/clothing/body_off"] = {
			ImageSet = "img_set_1x_2",
			ImageRectOffset = Vector2.new(493, 223),
			ImageRectSize = Vector2.new(18, 18)
		},
		["icons/menu/clothing/body_on"] = {
			ImageSet = "img_set_1x_2",
			ImageRectOffset = Vector2.new(493, 243),
			ImageRectSize = Vector2.new(18, 18)
		},
		["icons/menu/clothing/build_off"] = {
			ImageSet = "img_set_1x_2",
			ImageRectOffset = Vector2.new(493, 263),
			ImageRectSize = Vector2.new(18, 18)
		},
		["icons/menu/clothing/build_on"] = {
			ImageSet = "img_set_1x_2",
			ImageRectOffset = Vector2.new(493, 283),
			ImageRectSize = Vector2.new(18, 18)
		},
		["icons/menu/clothing/characters_on"] = {
			ImageSet = "img_set_1x_2",
			ImageRectOffset = Vector2.new(493, 321),
			ImageRectSize = Vector2.new(18, 18)
		},
		["icons/menu/clothing/climb_off"] = {
			ImageSet = "img_set_1x_2",
			ImageRectOffset = Vector2.new(493, 341),
			ImageRectSize = Vector2.new(18, 18)
		},
		["icons/menu/clothing/climb_on"] = {
			ImageSet = "img_set_1x_2",
			ImageRectOffset = Vector2.new(493, 361),
			ImageRectSize = Vector2.new(18, 18)
		},
		["icons/menu/clothing/creations_off"] = {
			ImageSet = "img_set_1x_2",
			ImageRectOffset = Vector2.new(493, 381),
			ImageRectSize = Vector2.new(18, 18)
		},
		["icons/menu/clothing/creations_on"] = {
			ImageSet = "img_set_1x_2",
			ImageRectOffset = Vector2.new(395, 493),
			ImageRectSize = Vector2.new(18, 18)
		},
		["icons/menu/clothing/eyebrow_on"] = {
			ImageSet = "img_set_1x_2",
			ImageRectOffset = Vector2.new(415, 493),
			ImageRectSize = Vector2.new(18, 18)
		},
		["icons/menu/clothing/eyelash_on"] = {
			ImageSet = "img_set_1x_2",
			ImageRectOffset = Vector2.new(435, 493),
			ImageRectSize = Vector2.new(18, 18)
		},
		["icons/menu/clothing/face_on"] = {
			ImageSet = "img_set_1x_4",
			ImageRectOffset = Vector2.new(410, 50),
			ImageRectSize = Vector2.new(18, 18)
		},
		["icons/menu/clothing/faces_off"] = {
			ImageSet = "img_set_1x_4",
			ImageRectOffset = Vector2.new(430, 50),
			ImageRectSize = Vector2.new(18, 18)
		},
		["icons/menu/clothing/facialHair_off"] = {
			ImageSet = "img_set_1x_4",
			ImageRectOffset = Vector2.new(460, 50),
			ImageRectSize = Vector2.new(18, 18)
		},
		["icons/menu/clothing/facialHair_on"] = {
			ImageSet = "img_set_1x_4",
			ImageRectOffset = Vector2.new(480, 50),
			ImageRectSize = Vector2.new(18, 18)
		},
		["icons/menu/clothing/fall_off"] = {
			ImageSet = "img_set_1x_4",
			ImageRectOffset = Vector2.new(490, 143),
			ImageRectSize = Vector2.new(18, 18)
		},
		["icons/menu/clothing/fall_on"] = {
			ImageSet = "img_set_1x_4",
			ImageRectOffset = Vector2.new(492, 220),
			ImageRectSize = Vector2.new(18, 18)
		},
		["icons/menu/clothing/hair_off"] = {
			ImageSet = "img_set_1x_4",
			ImageRectOffset = Vector2.new(492, 258),
			ImageRectSize = Vector2.new(18, 18)
		},
		["icons/menu/clothing/hair_on"] = {
			ImageSet = "img_set_1x_4",
			ImageRectOffset = Vector2.new(492, 296),
			ImageRectSize = Vector2.new(18, 18)
		},
		["icons/menu/clothing/idle_off"] = {
			ImageSet = "img_set_1x_4",
			ImageRectOffset = Vector2.new(492, 334),
			ImageRectSize = Vector2.new(18, 18)
		},
		["icons/menu/clothing/idle_on"] = {
			ImageSet = "img_set_1x_4",
			ImageRectOffset = Vector2.new(492, 372),
			ImageRectSize = Vector2.new(18, 18)
		},
		["icons/menu/clothing/jump_off"] = {
			ImageSet = "img_set_1x_4",
			ImageRectOffset = Vector2.new(378, 486),
			ImageRectSize = Vector2.new(18, 18)
		},
		["icons/menu/clothing/jump_on"] = {
			ImageSet = "img_set_1x_4",
			ImageRectOffset = Vector2.new(492, 410),
			ImageRectSize = Vector2.new(18, 18)
		},
		["icons/menu/clothing/limited_off"] = {
			ImageSet = "img_set_1x_4",
			ImageRectOffset = Vector2.new(416, 486),
			ImageRectSize = Vector2.new(18, 18)
		},
		["icons/menu/clothing/limited_on"] = {
			ImageSet = "img_set_1x_4",
			ImageRectOffset = Vector2.new(492, 448),
			ImageRectSize = Vector2.new(18, 18)
		},
		["icons/menu/clothing/nose_on"] = {
			ImageSet = "img_set_1x_4",
			ImageRectOffset = Vector2.new(454, 486),
			ImageRectSize = Vector2.new(18, 18)
		},
		["icons/menu/clothing/shorts_on"] = {
			ImageSet = "img_set_1x_4",
			ImageRectOffset = Vector2.new(474, 486),
			ImageRectSize = Vector2.new(18, 18)
		},
		["icons/menu/clothing/shoulder_on"] = {
			ImageSet = "img_set_1x_5",
			ImageRectOffset = Vector2.new(120, 488),
			ImageRectSize = Vector2.new(18, 18)
		},
		["icons/menu/clothing/skin_on"] = {
			ImageSet = "img_set_1x_5",
			ImageRectOffset = Vector2.new(100, 488),
			ImageRectSize = Vector2.new(18, 18)
		},
		["icons/menu/clothing/sweaters_on"] = {
			ImageSet = "img_set_1x_5",
			ImageRectOffset = Vector2.new(80, 488),
			ImageRectSize = Vector2.new(18, 18)
		},
		["icons/menu/clothing/swim_off"] = {
			ImageSet = "img_set_1x_5",
			ImageRectOffset = Vector2.new(60, 488),
			ImageRectSize = Vector2.new(18, 18)
		},
		["icons/menu/clothing/swim_on"] = {
			ImageSet = "img_set_1x_5",
			ImageRectOffset = Vector2.new(40, 488),
			ImageRectSize = Vector2.new(18, 18)
		},
		["icons/menu/clothing/torsos_on"] = {
			ImageSet = "img_set_1x_5",
			ImageRectOffset = Vector2.new(20, 488),
			ImageRectSize = Vector2.new(18, 18)
		},
		["icons/menu/clothing/type_off"] = {
			ImageSet = "img_set_1x_5",
			ImageRectOffset = Vector2.new(0, 488),
			ImageRectSize = Vector2.new(18, 18)
		},
		["icons/menu/clothing/type_on"] = {
			ImageSet = "img_set_1x_5",
			ImageRectOffset = Vector2.new(444, 402),
			ImageRectSize = Vector2.new(18, 18)
		},
		["icons/menu/clothing/waist_on"] = {
			ImageSet = "img_set_1x_5",
			ImageRectOffset = Vector2.new(474, 334),
			ImageRectSize = Vector2.new(18, 18)
		},
		["icons/menu/clothing/walk_off"] = {
			ImageSet = "img_set_1x_5",
			ImageRectOffset = Vector2.new(436, 334),
			ImageRectSize = Vector2.new(18, 18)
		},
		["icons/menu/clothing/walk_on"] = {
			ImageSet = "img_set_1x_1",
			ImageRectOffset = Vector2.new(365, 492),
			ImageRectSize = Vector2.new(18, 18)
		},
		["icons/menu/customize"] = {
			ImageSet = "img_set_1x_5",
			ImageRectOffset = Vector2.new(436, 114),
			ImageRectSize = Vector2.new(36, 36)
		},
		["icons/menu/customize_large"] = {
			ImageSet = "img_set_1x_4",
			ImageRectOffset = Vector2.new(340, 70),
			ImageRectSize = Vector2.new(48, 48)
		},
		["icons/menu/gem_medium"] = {
			ImageSet = "img_set_1x_5",
			ImageRectOffset = Vector2.new(474, 76),
			ImageRectSize = Vector2.new(36, 36)
		},
		["icons/menu/gem_small"] = {
			ImageSet = "img_set_1x_5",
			ImageRectOffset = Vector2.new(476, 458),
			ImageRectSize = Vector2.new(16, 16)
		},
		["icons/menu/protection_off"] = {
			ImageSet = "img_set_1x_5",
			ImageRectOffset = Vector2.new(436, 76),
			ImageRectSize = Vector2.new(36, 36)
		},
		["icons/menu/protection_on"] = {
			ImageSet = "img_set_1x_5",
			ImageRectOffset = Vector2.new(398, 114),
			ImageRectSize = Vector2.new(36, 36)
		},
		["icons/menu/publicChatOff"] = {
			ImageSet = "img_set_1x_5",
			ImageRectOffset = Vector2.new(398, 76),
			ImageRectSize = Vector2.new(36, 36)
		},
		["icons/menu/publicChatOff_small"] = {
			ImageSet = "img_set_1x_5",
			ImageRectOffset = Vector2.new(456, 464),
			ImageRectSize = Vector2.new(16, 16)
		},
		["icons/menu/publicChatOn"] = {
			ImageSet = "img_set_1x_5",
			ImageRectOffset = Vector2.new(474, 38),
			ImageRectSize = Vector2.new(36, 36)
		},
		["icons/menu/publicChatOn_small"] = {
			ImageSet = "img_set_1x_5",
			ImageRectOffset = Vector2.new(438, 464),
			ImageRectSize = Vector2.new(16, 16)
		},
		["icons/menu/rocketShipOn_medium"] = {
			ImageSet = "img_set_1x_5",
			ImageRectOffset = Vector2.new(436, 38),
			ImageRectSize = Vector2.new(36, 36)
		},
		["icons/menu/rocketShip_medium"] = {
			ImageSet = "img_set_1x_5",
			ImageRectOffset = Vector2.new(398, 38),
			ImageRectSize = Vector2.new(36, 36)
		},
		["icons/menu/rocketShip_small"] = {
			ImageSet = "img_set_1x_5",
			ImageRectOffset = Vector2.new(194, 488),
			ImageRectSize = Vector2.new(16, 16)
		},
		["icons/menu/securityKey"] = {
			ImageSet = "img_set_1x_5",
			ImageRectOffset = Vector2.new(360, 114),
			ImageRectSize = Vector2.new(36, 36)
		},
		["icons/menu/transform"] = {
			ImageSet = "img_set_1x_5",
			ImageRectOffset = Vector2.new(360, 76),
			ImageRectSize = Vector2.new(36, 36)
		},
		["icons/menu/transform-small"] = {
			ImageSet = "img_set_1x_5",
			ImageRectOffset = Vector2.new(176, 488),
			ImageRectSize = Vector2.new(16, 16)
		},
		["icons/navigation/close"] = {
			ImageSet = "img_set_1x_5",
			ImageRectOffset = Vector2.new(360, 38),
			ImageRectSize = Vector2.new(36, 36)
		},
		["icons/navigation/externallink"] = {
			ImageSet = "img_set_1x_5",
			ImageRectOffset = Vector2.new(158, 488),
			ImageRectSize = Vector2.new(16, 16)
		},
		["icons/navigation/externallink_medium"] = {
			ImageSet = "img_set_1x_5",
			ImageRectOffset = Vector2.new(474, 0),
			ImageRectSize = Vector2.new(36, 36)
		},
		["icons/navigation/seeAllArrow_small"] = {
			ImageSet = "img_set_1x_5",
			ImageRectOffset = Vector2.new(140, 488),
			ImageRectSize = Vector2.new(16, 16)
		},
		["icons/navigation/swipe"] = {
			ImageSet = "img_set_1x_5",
			ImageRectOffset = Vector2.new(436, 0),
			ImageRectSize = Vector2.new(36, 36)
		},
		["icons/navigation/swipeDown"] = {
			ImageSet = "img_set_1x_5",
			ImageRectOffset = Vector2.new(398, 0),
			ImageRectSize = Vector2.new(36, 36)
		},
		["icons/navigation/swipeUp"] = {
			ImageSet = "img_set_1x_5",
			ImageRectOffset = Vector2.new(360, 0),
			ImageRectSize = Vector2.new(36, 36)
		},
		["icons/status/collectibles"] = {
			ImageSet = "img_set_1x_5",
			ImageRectOffset = Vector2.new(322, 114),
			ImageRectSize = Vector2.new(36, 36)
		},
		["icons/status/collectibles_large"] = {
			ImageSet = "img_set_1x_4",
			ImageRectOffset = Vector2.new(390, 70),
			ImageRectSize = Vector2.new(48, 48)
		},
		["icons/status/collectibles_small"] = {
			ImageSet = "img_set_1x_5",
			ImageRectOffset = Vector2.new(464, 402),
			ImageRectSize = Vector2.new(16, 16)
		},
		["icons/status/games/sessions_large"] = {
			ImageSet = "img_set_1x_4",
			ImageRectOffset = Vector2.new(440, 70),
			ImageRectSize = Vector2.new(48, 48)
		},
		["icons/status/games/sessions_small"] = {
			ImageSet = "img_set_1x_5",
			ImageRectOffset = Vector2.new(494, 334),
			ImageRectSize = Vector2.new(16, 16)
		},
		["icons/status/item/limited"] = {
			ImageSet = "img_set_1x_5",
			ImageRectOffset = Vector2.new(456, 334),
			ImageRectSize = Vector2.new(16, 16)
		},
		["icons/status/loading_large"] = {
			ImageSet = "img_set_1x_4",
			ImageRectOffset = Vector2.new(340, 120),
			ImageRectSize = Vector2.new(48, 48)
		},
		["icons/status/loading_medium"] = {
			ImageSet = "img_set_1x_5",
			ImageRectOffset = Vector2.new(322, 76),
			ImageRectSize = Vector2.new(36, 36)
		},
		["icons/status/loading_small"] = {
			ImageSet = "img_set_1x_1",
			ImageRectOffset = Vector2.new(495, 494),
			ImageRectSize = Vector2.new(16, 16)
		},
		["icons/status/oof_xlarge"] = {
			ImageSet = "img_set_1x_1",
			ImageRectOffset = Vector2.new(402, 102),
			ImageRectSize = Vector2.new(96, 96)
		},
		["icons/status/player/videostar"] = {
			ImageSet = "img_set_1x_1",
			ImageRectOffset = Vector2.new(477, 494),
			ImageRectSize = Vector2.new(16, 16)
		},
		["icons/status/trending_small"] = {
			ImageSet = "img_set_1x_1",
			ImageRectOffset = Vector2.new(459, 494),
			ImageRectSize = Vector2.new(16, 16)
		},
		["reactions/crying"] = {
			ImageSet = "img_set_1x_4",
			ImageRectOffset = Vector2.new(390, 120),
			ImageRectSize = Vector2.new(48, 48)
		},
		["reactions/fire"] = {
			ImageSet = "img_set_1x_4",
			ImageRectOffset = Vector2.new(440, 120),
			ImageRectSize = Vector2.new(48, 48)
		},
		["reactions/heart"] = {
			ImageSet = "img_set_1x_4",
			ImageRectOffset = Vector2.new(340, 170),
			ImageRectSize = Vector2.new(48, 48)
		},
		["reactions/laughJoy"] = {
			ImageSet = "img_set_1x_3",
			ImageRectOffset = Vector2.new(340, 456),
			ImageRectSize = Vector2.new(48, 48)
		},
		["reactions/skull"] = {
			ImageSet = "img_set_1x_3",
			ImageRectOffset = Vector2.new(280, 402),
			ImageRectSize = Vector2.new(48, 48)
		},
		["reactions/thumbsUp"] = {
			ImageSet = "img_set_1x_3",
			ImageRectOffset = Vector2.new(230, 402),
			ImageRectSize = Vector2.new(48, 48)
		},
		["reactions/wow"] = {
			ImageSet = "img_set_1x_3",
			ImageRectOffset = Vector2.new(288, 340),
			ImageRectSize = Vector2.new(48, 48)
		},
		["squircles/fill"] = {
			ImageSet = "img_set_1x_5",
			ImageRectOffset = Vector2.new(398, 334),
			ImageRectSize = Vector2.new(26, 26)
		},
		["squircles/hollow"] = {
			ImageSet = "img_set_1x_5",
			ImageRectOffset = Vector2.new(360, 334),
			ImageRectSize = Vector2.new(26, 26)
		},
		["squircles/hollowBold"] = {
			ImageSet = "img_set_1x_5",
			ImageRectOffset = Vector2.new(476, 426),
			ImageRectSize = Vector2.new(30, 30)
		},
		["truncate_arrows/actions_truncationCollapse"] = {
			ImageSet = "img_set_1x_5",
			ImageRectOffset = Vector2.new(322, 38),
			ImageRectSize = Vector2.new(36, 36)
		},
		["truncate_arrows/actions_truncationExpand"] = {
			ImageSet = "img_set_1x_5",
			ImageRectOffset = Vector2.new(322, 0),
			ImageRectSize = Vector2.new(36, 36)
		}
	}
end

local var2 = nil

function make_assets_2x()
	-- upvalues: var2 (write)
	var2 = {
		["chat_bubble/chat-bubble"] = {
			ImageSet = "img_set_2x_3",
			ImageRectOffset = Vector2.new(442, 434),
			ImageRectSize = Vector2.new(42, 42)
		},
		["chat_bubble/chat-bubble-bottom"] = {
			ImageSet = "img_set_2x_10",
			ImageRectOffset = Vector2.new(387, 196),
			ImageRectSize = Vector2.new(82, 82)
		},
		["chat_bubble/chat-bubble-middle"] = {
			ImageSet = "img_set_2x_10",
			ImageRectOffset = Vector2.new(387, 280),
			ImageRectSize = Vector2.new(82, 82)
		},
		["chat_bubble/chat-bubble-self"] = {
			ImageSet = "img_set_2x_4",
			ImageRectOffset = Vector2.new(436, 196),
			ImageRectSize = Vector2.new(42, 42)
		},
		["chat_bubble/chat-bubble-self-bottom"] = {
			ImageSet = "img_set_2x_10",
			ImageRectOffset = Vector2.new(0, 386),
			ImageRectSize = Vector2.new(82, 82)
		},
		["chat_bubble/chat-bubble-self-middle"] = {
			ImageSet = "img_set_2x_10",
			ImageRectOffset = Vector2.new(84, 386),
			ImageRectSize = Vector2.new(82, 82)
		},
		["chat_bubble/chat-bubble-self-tip"] = {
			ImageSet = "img_set_2x_1",
			ImageRectOffset = Vector2.new(98, 494),
			ImageRectSize = Vector2.new(12, 12)
		},
		["chat_bubble/chat-bubble-self-top"] = {
			ImageSet = "img_set_2x_10",
			ImageRectOffset = Vector2.new(168, 386),
			ImageRectSize = Vector2.new(82, 82)
		},
		["chat_bubble/chat-bubble-self2"] = {
			ImageSet = "img_set_2x_4",
			ImageRectOffset = Vector2.new(436, 76),
			ImageRectSize = Vector2.new(42, 42)
		},
		["chat_bubble/chat-bubble-single"] = {
			ImageSet = "img_set_2x_10",
			ImageRectOffset = Vector2.new(252, 386),
			ImageRectSize = Vector2.new(82, 82)
		},
		["chat_bubble/chat-bubble-tip"] = {
			ImageSet = "img_set_2x_1",
			ImageRectOffset = Vector2.new(84, 494),
			ImageRectSize = Vector2.new(12, 12)
		},
		["chat_bubble/chat-bubble-top"] = {
			ImageSet = "img_set_2x_10",
			ImageRectOffset = Vector2.new(336, 386),
			ImageRectSize = Vector2.new(82, 82)
		},
		["chat_bubble/chat-bubble2"] = {
			ImageSet = "img_set_2x_4",
			ImageRectOffset = Vector2.new(436, 318),
			ImageRectSize = Vector2.new(42, 42)
		},
		["component_assets/avatarBG_dark"] = {
			ImageSet = "img_set_2x_16",
			ImageRectOffset = Vector2.new(0, 0),
			ImageRectSize = Vector2.new(338, 338)
		},
		["component_assets/avatarBG_light"] = {
			ImageSet = "img_set_2x_17",
			ImageRectOffset = Vector2.new(0, 0),
			ImageRectSize = Vector2.new(338, 338)
		},
		["component_assets/bulletDown_17_stroke_3"] = {
			ImageSet = "img_set_2x_6",
			ImageRectOffset = Vector2.new(0, 476),
			ImageRectSize = Vector2.new(34, 34)
		},
		["component_assets/bulletLeft_17"] = {
			ImageSet = "img_set_2x_6",
			ImageRectOffset = Vector2.new(36, 476),
			ImageRectSize = Vector2.new(34, 34)
		},
		["component_assets/bulletLeft_17_stroke_3"] = {
			ImageSet = "img_set_2x_6",
			ImageRectOffset = Vector2.new(72, 476),
			ImageRectSize = Vector2.new(34, 34)
		},
		["component_assets/bulletRight_17"] = {
			ImageSet = "img_set_2x_6",
			ImageRectOffset = Vector2.new(108, 476),
			ImageRectSize = Vector2.new(34, 34)
		},
		["component_assets/bulletRight_17_stroke_3"] = {
			ImageSet = "img_set_2x_6",
			ImageRectOffset = Vector2.new(144, 476),
			ImageRectSize = Vector2.new(34, 34)
		},
		["component_assets/bulletUp_17_stroke_3"] = {
			ImageSet = "img_set_2x_6",
			ImageRectOffset = Vector2.new(180, 476),
			ImageRectSize = Vector2.new(34, 34)
		},
		["component_assets/bullet_17"] = {
			ImageSet = "img_set_2x_6",
			ImageRectOffset = Vector2.new(216, 476),
			ImageRectSize = Vector2.new(34, 34)
		},
		["component_assets/checkerboard_12"] = {
			ImageSet = "img_set_2x_2",
			ImageRectOffset = Vector2.new(482, 60),
			ImageRectSize = Vector2.new(24, 24)
		},
		["component_assets/circle_15_stroke_3"] = {
			ImageSet = "img_set_2x_3",
			ImageRectOffset = Vector2.new(458, 212),
			ImageRectSize = Vector2.new(30, 30)
		},
		["component_assets/circle_16"] = {
			ImageSet = "img_set_2x_8",
			ImageRectOffset = Vector2.new(152, 460),
			ImageRectSize = Vector2.new(32, 32)
		},
		["component_assets/circle_17"] = {
			ImageSet = "img_set_2x_6",
			ImageRectOffset = Vector2.new(252, 476),
			ImageRectSize = Vector2.new(34, 34)
		},
		["component_assets/circle_17_mask"] = {
			ImageSet = "img_set_2x_6",
			ImageRectOffset = Vector2.new(288, 476),
			ImageRectSize = Vector2.new(34, 34)
		},
		["component_assets/circle_17_stroke_1"] = {
			ImageSet = "img_set_2x_6",
			ImageRectOffset = Vector2.new(324, 476),
			ImageRectSize = Vector2.new(34, 34)
		},
		["component_assets/circle_17_stroke_3"] = {
			ImageSet = "img_set_2x_6",
			ImageRectOffset = Vector2.new(360, 476),
			ImageRectSize = Vector2.new(34, 34)
		},
		["component_assets/circle_21"] = {
			ImageSet = "img_set_2x_3",
			ImageRectOffset = Vector2.new(442, 314),
			ImageRectSize = Vector2.new(42, 42)
		},
		["component_assets/circle_21_stroke_1"] = {
			ImageSet = "img_set_2x_3",
			ImageRectOffset = Vector2.new(458, 168),
			ImageRectSize = Vector2.new(42, 42)
		},
		["component_assets/circle_22_stroke_3"] = {
			ImageSet = "img_set_2x_3",
			ImageRectOffset = Vector2.new(458, 122),
			ImageRectSize = Vector2.new(44, 44)
		},
		["component_assets/circle_24_stroke_1"] = {
			ImageSet = "img_set_2x_3",
			ImageRectOffset = Vector2.new(458, 50),
			ImageRectSize = Vector2.new(48, 48)
		},
		["component_assets/circle_25"] = {
			ImageSet = "img_set_2x_2",
			ImageRectOffset = Vector2.new(458, 350),
			ImageRectSize = Vector2.new(50, 50)
		},
		["component_assets/circle_26_stroke_3"] = {
			ImageSet = "img_set_2x_2",
			ImageRectOffset = Vector2.new(458, 164),
			ImageRectSize = Vector2.new(52, 52)
		},
		["component_assets/circle_28_padding_10"] = {
			ImageSet = "img_set_2x_6",
			ImageRectOffset = Vector2.new(402, 406),
			ImageRectSize = Vector2.new(96, 96)
		},
		["component_assets/circle_29"] = {
			ImageSet = "img_set_2x_11",
			ImageRectOffset = Vector2.new(444, 386),
			ImageRectSize = Vector2.new(58, 58)
		},
		["component_assets/circle_29_mask"] = {
			ImageSet = "img_set_2x_7",
			ImageRectOffset = Vector2.new(316, 446),
			ImageRectSize = Vector2.new(58, 58)
		},
		["component_assets/circle_29_stroke_1"] = {
			ImageSet = "img_set_2x_7",
			ImageRectOffset = Vector2.new(256, 446),
			ImageRectSize = Vector2.new(58, 58)
		},
		["component_assets/circle_30_stroke_3"] = {
			ImageSet = "img_set_2x_7",
			ImageRectOffset = Vector2.new(194, 446),
			ImageRectSize = Vector2.new(60, 60)
		},
		["component_assets/circle_36"] = {
			ImageSet = "img_set_2x_4",
			ImageRectOffset = Vector2.new(436, 244),
			ImageRectSize = Vector2.new(72, 72)
		},
		["component_assets/circle_36_stroke_1"] = {
			ImageSet = "img_set_2x_4",
			ImageRectOffset = Vector2.new(436, 366),
			ImageRectSize = Vector2.new(72, 72)
		},
		["component_assets/circle_42_stroke_3"] = {
			ImageSet = "img_set_2x_9",
			ImageRectOffset = Vector2.new(387, 294),
			ImageRectSize = Vector2.new(84, 84)
		},
		["component_assets/circle_49"] = {
			ImageSet = "img_set_2x_6",
			ImageRectOffset = Vector2.new(402, 106),
			ImageRectSize = Vector2.new(98, 98)
		},
		["component_assets/circle_49_mask"] = {
			ImageSet = "img_set_2x_6",
			ImageRectOffset = Vector2.new(402, 206),
			ImageRectSize = Vector2.new(98, 98)
		},
		["component_assets/circle_49_stroke_1"] = {
			ImageSet = "img_set_2x_6",
			ImageRectOffset = Vector2.new(402, 306),
			ImageRectSize = Vector2.new(98, 98)
		},
		["component_assets/circle_52_stroke_3"] = {
			ImageSet = "img_set_2x_6",
			ImageRectOffset = Vector2.new(402, 0),
			ImageRectSize = Vector2.new(104, 104)
		},
		["component_assets/circle_60_stroke_2"] = {
			ImageSet = "img_set_2x_8",
			ImageRectOffset = Vector2.new(387, 0),
			ImageRectSize = Vector2.new(120, 120)
		},
		["component_assets/circle_68_stroke_2"] = {
			ImageSet = "img_set_2x_17",
			ImageRectOffset = Vector2.new(140, 340),
			ImageRectSize = Vector2.new(136, 136)
		},
		["component_assets/circle_69_stroke_3"] = {
			ImageSet = "img_set_2x_17",
			ImageRectOffset = Vector2.new(0, 340),
			ImageRectSize = Vector2.new(138, 138)
		},
		["component_assets/circle_72_stroke_3"] = {
			ImageSet = "img_set_2x_16",
			ImageRectOffset = Vector2.new(340, 0),
			ImageRectSize = Vector2.new(148, 144)
		},
		["component_assets/circle_9"] = {
			ImageSet = "img_set_2x_2",
			ImageRectOffset = Vector2.new(482, 86),
			ImageRectSize = Vector2.new(18, 18)
		},
		["component_assets/circle_9_stroke_1"] = {
			ImageSet = "img_set_2x_3",
			ImageRectOffset = Vector2.new(458, 100),
			ImageRectSize = Vector2.new(18, 18)
		},
		["component_assets/contactFullAvatar_large"] = {
			ImageSet = "img_set_2x_6",
			ImageRectOffset = Vector2.new(0, 0),
			ImageRectSize = Vector2.new(400, 400)
		},
		["component_assets/contactFullAvatar_small"] = {
			ImageSet = "img_set_2x_18",
			ImageRectOffset = Vector2.new(0, 0),
			ImageRectSize = Vector2.new(320, 320)
		},
		["component_assets/contactHeadshot"] = {
			ImageSet = "img_set_2x_21",
			ImageRectOffset = Vector2.new(302, 182),
			ImageRectSize = Vector2.new(200, 200)
		},
		["component_assets/dragger_small"] = {
			ImageSet = "img_set_2x_2",
			ImageRectOffset = Vector2.new(0, 472),
			ImageRectSize = Vector2.new(48, 32)
		},
		["component_assets/dropshadow_16_20"] = {
			ImageSet = "img_set_2x_7",
			ImageRectOffset = Vector2.new(395, 0),
			ImageRectSize = Vector2.new(112, 112)
		},
		["component_assets/dropshadow_17_16"] = {
			ImageSet = "img_set_2x_16",
			ImageRectOffset = Vector2.new(340, 146),
			ImageRectSize = Vector2.new(146, 146)
		},
		["component_assets/dropshadow_17_4"] = {
			ImageSet = "img_set_2x_2",
			ImageRectOffset = Vector2.new(458, 402),
			ImageRectSize = Vector2.new(50, 50)
		},
		["component_assets/dropshadow_17_8"] = {
			ImageSet = "img_set_2x_3",
			ImageRectOffset = Vector2.new(442, 366),
			ImageRectSize = Vector2.new(66, 66)
		},
		["component_assets/dropshadow_24_6"] = {
			ImageSet = "img_set_2x_3",
			ImageRectOffset = Vector2.new(442, 244),
			ImageRectSize = Vector2.new(68, 68)
		},
		["component_assets/dropshadow_25"] = {
			ImageSet = "img_set_2x_4",
			ImageRectOffset = Vector2.new(436, 0),
			ImageRectSize = Vector2.new(74, 74)
		},
		["component_assets/dropshadow_28"] = {
			ImageSet = "img_set_2x_8",
			ImageRectOffset = Vector2.new(387, 244),
			ImageRectSize = Vector2.new(96, 96)
		},
		["component_assets/dropshadow_56_8"] = {
			ImageSet = "img_set_2x_16",
			ImageRectOffset = Vector2.new(340, 294),
			ImageRectSize = Vector2.new(144, 144)
		},
		["component_assets/dropshadow_chatOff"] = {
			ImageSet = "img_set_2x_10",
			ImageRectOffset = Vector2.new(420, 386),
			ImageRectSize = Vector2.new(72, 72)
		},
		["component_assets/dropshadow_chatOn"] = {
			ImageSet = "img_set_2x_12",
			ImageRectOffset = Vector2.new(0, 386),
			ImageRectSize = Vector2.new(72, 72)
		},
		["component_assets/dropshadow_more"] = {
			ImageSet = "img_set_2x_12",
			ImageRectOffset = Vector2.new(74, 386),
			ImageRectSize = Vector2.new(72, 72)
		},
		["component_assets/dropshadow_square_4"] = {
			ImageSet = "img_set_2x_2",
			ImageRectOffset = Vector2.new(482, 0),
			ImageRectSize = Vector2.new(28, 28)
		},
		["component_assets/dropshadow_thumbnail_28"] = {
			ImageSet = "img_set_2x_7",
			ImageRectOffset = Vector2.new(0, 446),
			ImageRectSize = Vector2.new(130, 56)
		},
		["component_assets/genreBG"] = {
			ImageSet = "img_set_2x_2",
			ImageRectOffset = Vector2.new(0, 0),
			ImageRectSize = Vector2.new(480, 104)
		},
		["component_assets/halfcircleLeft_17"] = {
			ImageSet = "img_set_2x_1",
			ImageRectOffset = Vector2.new(494, 118),
			ImageRectSize = Vector2.new(16, 34)
		},
		["component_assets/halfcircleRight_17"] = {
			ImageSet = "img_set_2x_1",
			ImageRectOffset = Vector2.new(494, 82),
			ImageRectSize = Vector2.new(16, 34)
		},
		["component_assets/hexagon_12"] = {
			ImageSet = "img_set_2x_2",
			ImageRectOffset = Vector2.new(482, 30),
			ImageRectSize = Vector2.new(24, 28)
		},
		["component_assets/hexagon_24"] = {
			ImageSet = "img_set_2x_2",
			ImageRectOffset = Vector2.new(458, 106),
			ImageRectSize = Vector2.new(48, 56)
		},
		["component_assets/itemBG_dark"] = {
			ImageSet = "img_set_2x_22",
			ImageRectOffset = Vector2.new(0, 0),
			ImageRectSize = Vector2.new(300, 300)
		},
		["component_assets/itemBG_light"] = {
			ImageSet = "img_set_2x_21",
			ImageRectOffset = Vector2.new(0, 182),
			ImageRectSize = Vector2.new(300, 300)
		},
		["component_assets/profileHeaderBG"] = {
			ImageSet = "img_set_2x_16",
			ImageRectOffset = Vector2.new(0, 340),
			ImageRectSize = Vector2.new(220, 144)
		},
		["component_assets/square_7_stroke_3"] = {
			ImageSet = "img_set_2x_1",
			ImageRectOffset = Vector2.new(68, 494),
			ImageRectSize = Vector2.new(14, 14)
		},
		["component_assets/triangleDown_16"] = {
			ImageSet = "img_set_2x_1",
			ImageRectOffset = Vector2.new(34, 494),
			ImageRectSize = Vector2.new(32, 16)
		},
		["component_assets/triangleLeft_16"] = {
			ImageSet = "img_set_2x_1",
			ImageRectOffset = Vector2.new(494, 188),
			ImageRectSize = Vector2.new(16, 32)
		},
		["component_assets/triangleRight_16"] = {
			ImageSet = "img_set_2x_1",
			ImageRectOffset = Vector2.new(494, 154),
			ImageRectSize = Vector2.new(16, 32)
		},
		["component_assets/triangleUp_16"] = {
			ImageSet = "img_set_2x_1",
			ImageRectOffset = Vector2.new(0, 494),
			ImageRectSize = Vector2.new(32, 16)
		},
		["component_assets/userBG_dark"] = {
			ImageSet = "img_set_2x_8",
			ImageRectOffset = Vector2.new(316, 386),
			ImageRectSize = Vector2.new(96, 96)
		},
		["component_assets/user_60_mask"] = {
			ImageSet = "img_set_2x_8",
			ImageRectOffset = Vector2.new(387, 122),
			ImageRectSize = Vector2.new(120, 120)
		},
		["component_assets/user_glow"] = {
			ImageSet = "img_set_2x_22",
			ImageRectOffset = Vector2.new(0, 302),
			ImageRectSize = Vector2.new(288, 192)
		},
		["component_assets/vignette_246"] = {
			ImageSet = "img_set_2x_1",
			ImageRectOffset = Vector2.new(0, 0),
			ImageRectSize = Vector2.new(492, 492)
		},
		["gradient/gradient_0_100"] = {
			ImageSet = "img_set_2x_1",
			ImageRectOffset = Vector2.new(494, 0),
			ImageRectSize = Vector2.new(2, 80)
		},
		["icons/actions/accept"] = {
			ImageSet = "img_set_2x_12",
			ImageRectOffset = Vector2.new(148, 386),
			ImageRectSize = Vector2.new(72, 72)
		},
		["icons/actions/edit/redo"] = {
			ImageSet = "img_set_2x_12",
			ImageRectOffset = Vector2.new(222, 386),
			ImageRectSize = Vector2.new(72, 72)
		},
		["icons/actions/edit/undo"] = {
			ImageSet = "img_set_2x_12",
			ImageRectOffset = Vector2.new(296, 386),
			ImageRectSize = Vector2.new(72, 72)
		},
		["icons/actions/feedback_on"] = {
			ImageSet = "img_set_2x_12",
			ImageRectOffset = Vector2.new(386, 0),
			ImageRectSize = Vector2.new(72, 72)
		},
		["icons/brands/moments-fill"] = {
			ImageSet = "img_set_2x_3",
			ImageRectOffset = Vector2.new(458, 0),
			ImageRectSize = Vector2.new(48, 48)
		},
		["icons/brands/moments_large-fill"] = {
			ImageSet = "img_set_2x_8",
			ImageRectOffset = Vector2.new(414, 386),
			ImageRectSize = Vector2.new(96, 96)
		},
		["icons/common/gender_female"] = {
			ImageSet = "img_set_2x_12",
			ImageRectOffset = Vector2.new(386, 74),
			ImageRectSize = Vector2.new(72, 72)
		},
		["icons/common/gender_female_selected"] = {
			ImageSet = "img_set_2x_12",
			ImageRectOffset = Vector2.new(386, 148),
			ImageRectSize = Vector2.new(72, 72)
		},
		["icons/common/gender_male"] = {
			ImageSet = "img_set_2x_12",
			ImageRectOffset = Vector2.new(386, 222),
			ImageRectSize = Vector2.new(72, 72)
		},
		["icons/common/gender_male_selected"] = {
			ImageSet = "img_set_2x_12",
			ImageRectOffset = Vector2.new(386, 296),
			ImageRectSize = Vector2.new(72, 72)
		},
		["icons/common/muteNotifications"] = {
			ImageSet = "img_set_2x_4",
			ImageRectOffset = Vector2.new(436, 122),
			ImageRectSize = Vector2.new(73, 72)
		},
		["icons/controls/close-ingame"] = {
			ImageSet = "img_set_2x_12",
			ImageRectOffset = Vector2.new(386, 370),
			ImageRectSize = Vector2.new(72, 72)
		},
		["icons/controls/keys/apostrophe"] = {
			ImageSet = "img_set_2x_14",
			ImageRectOffset = Vector2.new(0, 386),
			ImageRectSize = Vector2.new(72, 72)
		},
		["icons/controls/keys/arrowDown"] = {
			ImageSet = "img_set_2x_10",
			ImageRectOffset = Vector2.new(336, 470),
			ImageRectSize = Vector2.new(32, 32)
		},
		["icons/controls/keys/arrowLeft"] = {
			ImageSet = "img_set_2x_10",
			ImageRectOffset = Vector2.new(370, 470),
			ImageRectSize = Vector2.new(32, 32)
		},
		["icons/controls/keys/arrowRight"] = {
			ImageSet = "img_set_2x_10",
			ImageRectOffset = Vector2.new(420, 460),
			ImageRectSize = Vector2.new(32, 32)
		},
		["icons/controls/keys/arrowUp"] = {
			ImageSet = "img_set_2x_10",
			ImageRectOffset = Vector2.new(454, 460),
			ImageRectSize = Vector2.new(32, 32)
		},
		["icons/controls/keys/asterisk"] = {
			ImageSet = "img_set_2x_14",
			ImageRectOffset = Vector2.new(74, 386),
			ImageRectSize = Vector2.new(72, 72)
		},
		["icons/controls/keys/backspace"] = {
			ImageSet = "img_set_2x_14",
			ImageRectOffset = Vector2.new(148, 386),
			ImageRectSize = Vector2.new(72, 72)
		},
		["icons/controls/keys/capslock"] = {
			ImageSet = "img_set_2x_14",
			ImageRectOffset = Vector2.new(222, 386),
			ImageRectSize = Vector2.new(72, 72)
		},
		["icons/controls/keys/caret"] = {
			ImageSet = "img_set_2x_14",
			ImageRectOffset = Vector2.new(296, 386),
			ImageRectSize = Vector2.new(72, 72)
		},
		["icons/controls/keys/comma"] = {
			ImageSet = "img_set_2x_14",
			ImageRectOffset = Vector2.new(386, 0),
			ImageRectSize = Vector2.new(72, 72)
		},
		["icons/controls/keys/command"] = {
			ImageSet = "img_set_2x_14",
			ImageRectOffset = Vector2.new(386, 74),
			ImageRectSize = Vector2.new(72, 72)
		},
		["icons/controls/keys/control"] = {
			ImageSet = "img_set_2x_14",
			ImageRectOffset = Vector2.new(386, 148),
			ImageRectSize = Vector2.new(72, 72)
		},
		["icons/controls/keys/dpadDown"] = {
			ImageSet = "img_set_2x_14",
			ImageRectOffset = Vector2.new(386, 222),
			ImageRectSize = Vector2.new(72, 72)
		},
		["icons/controls/keys/dpadLeft"] = {
			ImageSet = "img_set_2x_14",
			ImageRectOffset = Vector2.new(386, 296),
			ImageRectSize = Vector2.new(72, 72)
		},
		["icons/controls/keys/dpadRight"] = {
			ImageSet = "img_set_2x_14",
			ImageRectOffset = Vector2.new(386, 370),
			ImageRectSize = Vector2.new(72, 72)
		},
		["icons/controls/keys/dpadUp"] = {
			ImageSet = "img_set_2x_16",
			ImageRectOffset = Vector2.new(222, 340),
			ImageRectSize = Vector2.new(72, 72)
		},
		["icons/controls/keys/graveaccent"] = {
			ImageSet = "img_set_2x_16",
			ImageRectOffset = Vector2.new(222, 414),
			ImageRectSize = Vector2.new(72, 72)
		},
		["icons/controls/keys/hold_button_assets/hold_Pressed_Arrow"] = {
			ImageSet = "img_set_2x_12",
			ImageRectOffset = Vector2.new(386, 444),
			ImageRectSize = Vector2.new(56, 56)
		},
		["icons/controls/keys/hold_button_assets/hold_Pressed_RadialFill"] = {
			ImageSet = "img_set_2x_12",
			ImageRectOffset = Vector2.new(444, 444),
			ImageRectSize = Vector2.new(56, 56)
		},
		["icons/controls/keys/hold_button_assets/hold_Pressed_XboxA"] = {
			ImageSet = "img_set_2x_14",
			ImageRectOffset = Vector2.new(386, 444),
			ImageRectSize = Vector2.new(56, 56)
		},
		["icons/controls/keys/hold_button_assets/hold_Unpressed_Arrow"] = {
			ImageSet = "img_set_2x_13",
			ImageRectOffset = Vector2.new(444, 444),
			ImageRectSize = Vector2.new(56, 56)
		},
		["icons/controls/keys/hold_button_assets/hold_Unpressed_RadialFill"] = {
			ImageSet = "img_set_2x_13",
			ImageRectOffset = Vector2.new(386, 444),
			ImageRectSize = Vector2.new(56, 56)
		},
		["icons/controls/keys/hold_button_assets/hold_Unpressed_XboxA"] = {
			ImageSet = "img_set_2x_11",
			ImageRectOffset = Vector2.new(444, 446),
			ImageRectSize = Vector2.new(56, 56)
		},
		["icons/controls/keys/key_alt"] = {
			ImageSet = "img_set_2x_18",
			ImageRectOffset = Vector2.new(322, 0),
			ImageRectSize = Vector2.new(72, 72)
		},
		["icons/controls/keys/key_esc"] = {
			ImageSet = "img_set_2x_18",
			ImageRectOffset = Vector2.new(396, 0),
			ImageRectSize = Vector2.new(72, 72)
		},
		["icons/controls/keys/key_l"] = {
			ImageSet = "img_set_2x_18",
			ImageRectOffset = Vector2.new(322, 74),
			ImageRectSize = Vector2.new(72, 72)
		},
		["icons/controls/keys/key_r"] = {
			ImageSet = "img_set_2x_18",
			ImageRectOffset = Vector2.new(396, 74),
			ImageRectSize = Vector2.new(72, 72)
		},
		["icons/controls/keys/key_shift"] = {
			ImageSet = "img_set_2x_18",
			ImageRectOffset = Vector2.new(322, 148),
			ImageRectSize = Vector2.new(72, 72)
		},
		["icons/controls/keys/key_single"] = {
			ImageSet = "img_set_2x_18",
			ImageRectOffset = Vector2.new(396, 148),
			ImageRectSize = Vector2.new(72, 72)
		},
		["icons/controls/keys/key_wide"] = {
			ImageSet = "img_set_2x_8",
			ImageRectOffset = Vector2.new(186, 386),
			ImageRectSize = Vector2.new(128, 72)
		},
		["icons/controls/keys/key_xwide"] = {
			ImageSet = "img_set_2x_8",
			ImageRectOffset = Vector2.new(0, 386),
			ImageRectSize = Vector2.new(184, 72)
		},
		["icons/controls/keys/period"] = {
			ImageSet = "img_set_2x_18",
			ImageRectOffset = Vector2.new(322, 222),
			ImageRectSize = Vector2.new(72, 72)
		},
		["icons/controls/keys/return"] = {
			ImageSet = "img_set_2x_18",
			ImageRectOffset = Vector2.new(396, 222),
			ImageRectSize = Vector2.new(72, 72)
		},
		["icons/controls/keys/shift"] = {
			ImageSet = "img_set_2x_18",
			ImageRectOffset = Vector2.new(322, 296),
			ImageRectSize = Vector2.new(72, 72)
		},
		["icons/controls/keys/spacebar"] = {
			ImageSet = "img_set_2x_18",
			ImageRectOffset = Vector2.new(396, 296),
			ImageRectSize = Vector2.new(72, 72)
		},
		["icons/controls/keys/tab"] = {
			ImageSet = "img_set_2x_18",
			ImageRectOffset = Vector2.new(322, 370),
			ImageRectSize = Vector2.new(72, 72)
		},
		["icons/controls/keys/xboxA"] = {
			ImageSet = "img_set_2x_18",
			ImageRectOffset = Vector2.new(396, 370),
			ImageRectSize = Vector2.new(72, 72)
		},
		["icons/controls/keys/xboxB"] = {
			ImageSet = "img_set_2x_20",
			ImageRectOffset = Vector2.new(322, 0),
			ImageRectSize = Vector2.new(72, 72)
		},
		["icons/controls/keys/xboxLB"] = {
			ImageSet = "img_set_2x_20",
			ImageRectOffset = Vector2.new(322, 74),
			ImageRectSize = Vector2.new(72, 72)
		},
		["icons/controls/keys/xboxLS"] = {
			ImageSet = "img_set_2x_20",
			ImageRectOffset = Vector2.new(396, 0),
			ImageRectSize = Vector2.new(72, 72)
		},
		["icons/controls/keys/xboxLSDirectional"] = {
			ImageSet = "img_set_2x_20",
			ImageRectOffset = Vector2.new(396, 74),
			ImageRectSize = Vector2.new(72, 72)
		},
		["icons/controls/keys/xboxLSHorizontal"] = {
			ImageSet = "img_set_2x_20",
			ImageRectOffset = Vector2.new(322, 182),
			ImageRectSize = Vector2.new(72, 72)
		},
		["icons/controls/keys/xboxLSVertical"] = {
			ImageSet = "img_set_2x_20",
			ImageRectOffset = Vector2.new(322, 256),
			ImageRectSize = Vector2.new(72, 72)
		},
		["icons/controls/keys/xboxLT"] = {
			ImageSet = "img_set_2x_20",
			ImageRectOffset = Vector2.new(396, 182),
			ImageRectSize = Vector2.new(72, 72)
		},
		["icons/controls/keys/xboxRB"] = {
			ImageSet = "img_set_2x_20",
			ImageRectOffset = Vector2.new(396, 256),
			ImageRectSize = Vector2.new(72, 72)
		},
		["icons/controls/keys/xboxRS"] = {
			ImageSet = "img_set_2x_20",
			ImageRectOffset = Vector2.new(0, 364),
			ImageRectSize = Vector2.new(72, 72)
		},
		["icons/controls/keys/xboxRSDirectional"] = {
			ImageSet = "img_set_2x_20",
			ImageRectOffset = Vector2.new(0, 438),
			ImageRectSize = Vector2.new(72, 72)
		},
		["icons/controls/keys/xboxRSHorizontal"] = {
			ImageSet = "img_set_2x_20",
			ImageRectOffset = Vector2.new(74, 364),
			ImageRectSize = Vector2.new(72, 72)
		},
		["icons/controls/keys/xboxRSVertical"] = {
			ImageSet = "img_set_2x_20",
			ImageRectOffset = Vector2.new(74, 438),
			ImageRectSize = Vector2.new(72, 72)
		},
		["icons/controls/keys/xboxRT"] = {
			ImageSet = "img_set_2x_20",
			ImageRectOffset = Vector2.new(148, 364),
			ImageRectSize = Vector2.new(72, 72)
		},
		["icons/controls/keys/xboxView"] = {
			ImageSet = "img_set_2x_20",
			ImageRectOffset = Vector2.new(148, 438),
			ImageRectSize = Vector2.new(72, 72)
		},
		["icons/controls/keys/xboxX"] = {
			ImageSet = "img_set_2x_20",
			ImageRectOffset = Vector2.new(222, 364),
			ImageRectSize = Vector2.new(72, 72)
		},
		["icons/controls/keys/xboxY"] = {
			ImageSet = "img_set_2x_20",
			ImageRectOffset = Vector2.new(222, 438),
			ImageRectSize = Vector2.new(72, 72)
		},
		["icons/controls/keys/xboxmenu"] = {
			ImageSet = "img_set_2x_20",
			ImageRectOffset = Vector2.new(296, 364),
			ImageRectSize = Vector2.new(72, 72)
		},
		["icons/controls/mediaStop_small"] = {
			ImageSet = "img_set_2x_12",
			ImageRectOffset = Vector2.new(0, 460),
			ImageRectSize = Vector2.new(32, 32)
		},
		["icons/controls/vehicle/driver"] = {
			ImageSet = "img_set_2x_20",
			ImageRectOffset = Vector2.new(296, 438),
			ImageRectSize = Vector2.new(72, 72)
		},
		["icons/controls/vehicle/flip"] = {
			ImageSet = "img_set_2x_20",
			ImageRectOffset = Vector2.new(370, 364),
			ImageRectSize = Vector2.new(72, 72)
		},
		["icons/controls/vehicle/passenger"] = {
			ImageSet = "img_set_2x_20",
			ImageRectOffset = Vector2.new(370, 438),
			ImageRectSize = Vector2.new(72, 72)
		},
		["icons/controls/voice/microphone_0_dark"] = {
			ImageSet = "img_set_2x_22",
			ImageRectOffset = Vector2.new(302, 388),
			ImageRectSize = Vector2.new(72, 72)
		},
		["icons/controls/voice/microphone_0_light"] = {
			ImageSet = "img_set_2x_22",
			ImageRectOffset = Vector2.new(376, 388),
			ImageRectSize = Vector2.new(72, 72)
		},
		["icons/controls/voice/microphone_0_small_dark"] = {
			ImageSet = "img_set_2x_12",
			ImageRectOffset = Vector2.new(34, 460),
			ImageRectSize = Vector2.new(32, 32)
		},
		["icons/controls/voice/microphone_0_small_light"] = {
			ImageSet = "img_set_2x_12",
			ImageRectOffset = Vector2.new(74, 460),
			ImageRectSize = Vector2.new(32, 32)
		},
		["icons/controls/voice/microphone_100_dark"] = {
			ImageSet = "img_set_2x_23",
			ImageRectOffset = Vector2.new(388, 0),
			ImageRectSize = Vector2.new(72, 72)
		},
		["icons/controls/voice/microphone_100_light"] = {
			ImageSet = "img_set_2x_23",
			ImageRectOffset = Vector2.new(388, 0),
			ImageRectSize = Vector2.new(72, 72)
		},
		["icons/controls/voice/microphone_100_small_dark"] = {
			ImageSet = "img_set_2x_12",
			ImageRectOffset = Vector2.new(108, 460),
			ImageRectSize = Vector2.new(32, 32)
		},
		["icons/controls/voice/microphone_100_small_light"] = {
			ImageSet = "img_set_2x_12",
			ImageRectOffset = Vector2.new(108, 460),
			ImageRectSize = Vector2.new(32, 32)
		},
		["icons/controls/voice/microphone_20_dark"] = {
			ImageSet = "img_set_2x_23",
			ImageRectOffset = Vector2.new(74, 388),
			ImageRectSize = Vector2.new(72, 72)
		},
		["icons/controls/voice/microphone_20_light"] = {
			ImageSet = "img_set_2x_23",
			ImageRectOffset = Vector2.new(0, 388),
			ImageRectSize = Vector2.new(72, 72)
		},
		["icons/controls/voice/microphone_20_small_dark"] = {
			ImageSet = "img_set_2x_12",
			ImageRectOffset = Vector2.new(148, 460),
			ImageRectSize = Vector2.new(32, 32)
		},
		["icons/controls/voice/microphone_20_small_light"] = {
			ImageSet = "img_set_2x_12",
			ImageRectOffset = Vector2.new(182, 460),
			ImageRectSize = Vector2.new(32, 32)
		},
		["icons/controls/voice/microphone_40_dark"] = {
			ImageSet = "img_set_2x_21",
			ImageRectOffset = Vector2.new(376, 384),
			ImageRectSize = Vector2.new(72, 72)
		},
		["icons/controls/voice/microphone_40_light"] = {
			ImageSet = "img_set_2x_21",
			ImageRectOffset = Vector2.new(302, 384),
			ImageRectSize = Vector2.new(72, 72)
		},
		["icons/controls/voice/microphone_40_small_dark"] = {
			ImageSet = "img_set_2x_12",
			ImageRectOffset = Vector2.new(222, 460),
			ImageRectSize = Vector2.new(32, 32)
		},
		["icons/controls/voice/microphone_40_small_light"] = {
			ImageSet = "img_set_2x_12",
			ImageRectOffset = Vector2.new(256, 460),
			ImageRectSize = Vector2.new(32, 32)
		},
		["icons/controls/voice/microphone_60_dark"] = {
			ImageSet = "img_set_2x_21",
			ImageRectOffset = Vector2.new(396, 74),
			ImageRectSize = Vector2.new(72, 72)
		},
		["icons/controls/voice/microphone_60_light"] = {
			ImageSet = "img_set_2x_21",
			ImageRectOffset = Vector2.new(396, 0),
			ImageRectSize = Vector2.new(72, 72)
		},
		["icons/controls/voice/microphone_60_small_dark"] = {
			ImageSet = "img_set_2x_12",
			ImageRectOffset = Vector2.new(296, 460),
			ImageRectSize = Vector2.new(32, 32)
		},
		["icons/controls/voice/microphone_60_small_light"] = {
			ImageSet = "img_set_2x_12",
			ImageRectOffset = Vector2.new(330, 460),
			ImageRectSize = Vector2.new(32, 32)
		},
		["icons/controls/voice/microphone_80_dark"] = {
			ImageSet = "img_set_2x_21",
			ImageRectOffset = Vector2.new(322, 74),
			ImageRectSize = Vector2.new(72, 72)
		},
		["icons/controls/voice/microphone_80_light"] = {
			ImageSet = "img_set_2x_21",
			ImageRectOffset = Vector2.new(322, 0),
			ImageRectSize = Vector2.new(72, 72)
		},
		["icons/controls/voice/microphone_80_small_dark"] = {
			ImageSet = "img_set_2x_12",
			ImageRectOffset = Vector2.new(460, 0),
			ImageRectSize = Vector2.new(32, 32)
		},
		["icons/controls/voice/microphone_80_small_light"] = {
			ImageSet = "img_set_2x_12",
			ImageRectOffset = Vector2.new(460, 34),
			ImageRectSize = Vector2.new(32, 32)
		},
		["icons/controls/voice/microphone_error_dark"] = {
			ImageSet = "img_set_2x_19",
			ImageRectOffset = Vector2.new(370, 438),
			ImageRectSize = Vector2.new(72, 72)
		},
		["icons/controls/voice/microphone_error_light"] = {
			ImageSet = "img_set_2x_19",
			ImageRectOffset = Vector2.new(370, 364),
			ImageRectSize = Vector2.new(72, 72)
		},
		["icons/controls/voice/microphone_error_small_dark"] = {
			ImageSet = "img_set_2x_12",
			ImageRectOffset = Vector2.new(460, 74),
			ImageRectSize = Vector2.new(32, 32)
		},
		["icons/controls/voice/microphone_error_small_light"] = {
			ImageSet = "img_set_2x_12",
			ImageRectOffset = Vector2.new(460, 108),
			ImageRectSize = Vector2.new(32, 32)
		},
		["icons/controls/voice/microphone_off_dark"] = {
			ImageSet = "img_set_2x_19",
			ImageRectOffset = Vector2.new(296, 438),
			ImageRectSize = Vector2.new(72, 72)
		},
		["icons/controls/voice/microphone_off_light"] = {
			ImageSet = "img_set_2x_19",
			ImageRectOffset = Vector2.new(296, 364),
			ImageRectSize = Vector2.new(72, 72)
		},
		["icons/controls/voice/microphone_off_small_dark"] = {
			ImageSet = "img_set_2x_10",
			ImageRectOffset = Vector2.new(168, 470),
			ImageRectSize = Vector2.new(33, 32)
		},
		["icons/controls/voice/microphone_off_small_light"] = {
			ImageSet = "img_set_2x_10",
			ImageRectOffset = Vector2.new(203, 470),
			ImageRectSize = Vector2.new(33, 32)
		},
		["icons/controls/voice/microphone_on_dark"] = {
			ImageSet = "img_set_2x_22",
			ImageRectOffset = Vector2.new(302, 388),
			ImageRectSize = Vector2.new(72, 72)
		},
		["icons/controls/voice/microphone_on_light"] = {
			ImageSet = "img_set_2x_22",
			ImageRectOffset = Vector2.new(376, 388),
			ImageRectSize = Vector2.new(72, 72)
		},
		["icons/controls/voice/microphone_on_small_dark"] = {
			ImageSet = "img_set_2x_12",
			ImageRectOffset = Vector2.new(34, 460),
			ImageRectSize = Vector2.new(32, 32)
		},
		["icons/controls/voice/microphone_on_small_light"] = {
			ImageSet = "img_set_2x_12",
			ImageRectOffset = Vector2.new(74, 460),
			ImageRectSize = Vector2.new(32, 32)
		},
		["icons/controls/voice/red_speaker_0_dark"] = {
			ImageSet = "img_set_2x_19",
			ImageRectOffset = Vector2.new(222, 438),
			ImageRectSize = Vector2.new(72, 72)
		},
		["icons/controls/voice/red_speaker_0_light"] = {
			ImageSet = "img_set_2x_19",
			ImageRectOffset = Vector2.new(222, 364),
			ImageRectSize = Vector2.new(72, 72)
		},
		["icons/controls/voice/red_speaker_0_small_dark"] = {
			ImageSet = "img_set_2x_12",
			ImageRectOffset = Vector2.new(460, 148),
			ImageRectSize = Vector2.new(32, 32)
		},
		["icons/controls/voice/red_speaker_0_small_light"] = {
			ImageSet = "img_set_2x_12",
			ImageRectOffset = Vector2.new(460, 182),
			ImageRectSize = Vector2.new(32, 32)
		},
		["icons/controls/voice/red_speaker_100_dark"] = {
			ImageSet = "img_set_2x_19",
			ImageRectOffset = Vector2.new(148, 438),
			ImageRectSize = Vector2.new(72, 72)
		},
		["icons/controls/voice/red_speaker_100_light"] = {
			ImageSet = "img_set_2x_19",
			ImageRectOffset = Vector2.new(148, 438),
			ImageRectSize = Vector2.new(72, 72)
		},
		["icons/controls/voice/red_speaker_100_small_dark"] = {
			ImageSet = "img_set_2x_12",
			ImageRectOffset = Vector2.new(460, 222),
			ImageRectSize = Vector2.new(32, 32)
		},
		["icons/controls/voice/red_speaker_100_small_light"] = {
			ImageSet = "img_set_2x_12",
			ImageRectOffset = Vector2.new(460, 222),
			ImageRectSize = Vector2.new(32, 32)
		},
		["icons/controls/voice/red_speaker_20_dark"] = {
			ImageSet = "img_set_2x_19",
			ImageRectOffset = Vector2.new(148, 364),
			ImageRectSize = Vector2.new(72, 72)
		},
		["icons/controls/voice/red_speaker_20_light"] = {
			ImageSet = "img_set_2x_19",
			ImageRectOffset = Vector2.new(74, 438),
			ImageRectSize = Vector2.new(72, 72)
		},
		["icons/controls/voice/red_speaker_20_small_dark"] = {
			ImageSet = "img_set_2x_12",
			ImageRectOffset = Vector2.new(460, 256),
			ImageRectSize = Vector2.new(32, 32)
		},
		["icons/controls/voice/red_speaker_20_small_light"] = {
			ImageSet = "img_set_2x_12",
			ImageRectOffset = Vector2.new(460, 296),
			ImageRectSize = Vector2.new(32, 32)
		},
		["icons/controls/voice/red_speaker_40_dark"] = {
			ImageSet = "img_set_2x_19",
			ImageRectOffset = Vector2.new(74, 364),
			ImageRectSize = Vector2.new(72, 72)
		},
		["icons/controls/voice/red_speaker_40_light"] = {
			ImageSet = "img_set_2x_19",
			ImageRectOffset = Vector2.new(0, 438),
			ImageRectSize = Vector2.new(72, 72)
		},
		["icons/controls/voice/red_speaker_40_small_dark"] = {
			ImageSet = "img_set_2x_12",
			ImageRectOffset = Vector2.new(460, 330),
			ImageRectSize = Vector2.new(32, 32)
		},
		["icons/controls/voice/red_speaker_40_small_light"] = {
			ImageSet = "img_set_2x_12",
			ImageRectOffset = Vector2.new(460, 370),
			ImageRectSize = Vector2.new(32, 32)
		},
		["icons/controls/voice/red_speaker_60_dark"] = {
			ImageSet = "img_set_2x_19",
			ImageRectOffset = Vector2.new(0, 364),
			ImageRectSize = Vector2.new(72, 72)
		},
		["icons/controls/voice/red_speaker_60_light"] = {
			ImageSet = "img_set_2x_19",
			ImageRectOffset = Vector2.new(396, 256),
			ImageRectSize = Vector2.new(72, 72)
		},
		["icons/controls/voice/red_speaker_60_small_dark"] = {
			ImageSet = "img_set_2x_12",
			ImageRectOffset = Vector2.new(460, 404),
			ImageRectSize = Vector2.new(32, 32)
		},
		["icons/controls/voice/red_speaker_60_small_light"] = {
			ImageSet = "img_set_2x_13",
			ImageRectOffset = Vector2.new(460, 108),
			ImageRectSize = Vector2.new(32, 32)
		},
		["icons/controls/voice/red_speaker_80_dark"] = {
			ImageSet = "img_set_2x_19",
			ImageRectOffset = Vector2.new(396, 182),
			ImageRectSize = Vector2.new(72, 72)
		},
		["icons/controls/voice/red_speaker_80_light"] = {
			ImageSet = "img_set_2x_19",
			ImageRectOffset = Vector2.new(322, 256),
			ImageRectSize = Vector2.new(72, 72)
		},
		["icons/controls/voice/red_speaker_80_small_dark"] = {
			ImageSet = "img_set_2x_13",
			ImageRectOffset = Vector2.new(460, 74),
			ImageRectSize = Vector2.new(32, 32)
		},
		["icons/controls/voice/red_speaker_80_small_light"] = {
			ImageSet = "img_set_2x_13",
			ImageRectOffset = Vector2.new(460, 34),
			ImageRectSize = Vector2.new(32, 32)
		},
		["icons/controls/voice/speaker_0_dark"] = {
			ImageSet = "img_set_2x_19",
			ImageRectOffset = Vector2.new(222, 438),
			ImageRectSize = Vector2.new(72, 72)
		},
		["icons/controls/voice/speaker_0_light"] = {
			ImageSet = "img_set_2x_19",
			ImageRectOffset = Vector2.new(322, 182),
			ImageRectSize = Vector2.new(72, 72)
		},
		["icons/controls/voice/speaker_0_small_dark"] = {
			ImageSet = "img_set_2x_12",
			ImageRectOffset = Vector2.new(460, 148),
			ImageRectSize = Vector2.new(32, 32)
		},
		["icons/controls/voice/speaker_0_small_light"] = {
			ImageSet = "img_set_2x_13",
			ImageRectOffset = Vector2.new(460, 0),
			ImageRectSize = Vector2.new(32, 32)
		},
		["icons/controls/voice/speaker_100_dark"] = {
			ImageSet = "img_set_2x_19",
			ImageRectOffset = Vector2.new(396, 74),
			ImageRectSize = Vector2.new(72, 72)
		},
		["icons/controls/voice/speaker_100_light"] = {
			ImageSet = "img_set_2x_19",
			ImageRectOffset = Vector2.new(396, 74),
			ImageRectSize = Vector2.new(72, 72)
		},
		["icons/controls/voice/speaker_100_small_dark"] = {
			ImageSet = "img_set_2x_13",
			ImageRectOffset = Vector2.new(330, 460),
			ImageRectSize = Vector2.new(32, 32)
		},
		["icons/controls/voice/speaker_100_small_light"] = {
			ImageSet = "img_set_2x_13",
			ImageRectOffset = Vector2.new(330, 460),
			ImageRectSize = Vector2.new(32, 32)
		},
		["icons/controls/voice/speaker_20_dark"] = {
			ImageSet = "img_set_2x_19",
			ImageRectOffset = Vector2.new(396, 0),
			ImageRectSize = Vector2.new(72, 72)
		},
		["icons/controls/voice/speaker_20_light"] = {
			ImageSet = "img_set_2x_19",
			ImageRectOffset = Vector2.new(322, 74),
			ImageRectSize = Vector2.new(72, 72)
		},
		["icons/controls/voice/speaker_20_small_dark"] = {
			ImageSet = "img_set_2x_13",
			ImageRectOffset = Vector2.new(296, 460),
			ImageRectSize = Vector2.new(32, 32)
		},
		["icons/controls/voice/speaker_20_small_light"] = {
			ImageSet = "img_set_2x_13",
			ImageRectOffset = Vector2.new(256, 460),
			ImageRectSize = Vector2.new(32, 32)
		},
		["icons/controls/voice/speaker_40_dark"] = {
			ImageSet = "img_set_2x_19",
			ImageRectOffset = Vector2.new(322, 0),
			ImageRectSize = Vector2.new(72, 72)
		},
		["icons/controls/voice/speaker_40_light"] = {
			ImageSet = "img_set_2x_17",
			ImageRectOffset = Vector2.new(414, 370),
			ImageRectSize = Vector2.new(72, 72)
		},
		["icons/controls/voice/speaker_40_small_dark"] = {
			ImageSet = "img_set_2x_13",
			ImageRectOffset = Vector2.new(222, 460),
			ImageRectSize = Vector2.new(32, 32)
		},
		["icons/controls/voice/speaker_40_small_light"] = {
			ImageSet = "img_set_2x_13",
			ImageRectOffset = Vector2.new(182, 460),
			ImageRectSize = Vector2.new(32, 32)
		},
		["icons/controls/voice/speaker_60_dark"] = {
			ImageSet = "img_set_2x_17",
			ImageRectOffset = Vector2.new(340, 370),
			ImageRectSize = Vector2.new(72, 72)
		},
		["icons/controls/voice/speaker_60_light"] = {
			ImageSet = "img_set_2x_17",
			ImageRectOffset = Vector2.new(414, 296),
			ImageRectSize = Vector2.new(72, 72)
		},
		["icons/controls/voice/speaker_60_small_dark"] = {
			ImageSet = "img_set_2x_13",
			ImageRectOffset = Vector2.new(148, 460),
			ImageRectSize = Vector2.new(32, 32)
		},
		["icons/controls/voice/speaker_60_small_light"] = {
			ImageSet = "img_set_2x_13",
			ImageRectOffset = Vector2.new(108, 460),
			ImageRectSize = Vector2.new(32, 32)
		},
		["icons/controls/voice/speaker_80_dark"] = {
			ImageSet = "img_set_2x_17",
			ImageRectOffset = Vector2.new(340, 296),
			ImageRectSize = Vector2.new(72, 72)
		},
		["icons/controls/voice/speaker_80_light"] = {
			ImageSet = "img_set_2x_17",
			ImageRectOffset = Vector2.new(414, 222),
			ImageRectSize = Vector2.new(72, 72)
		},
		["icons/controls/voice/speaker_80_small_dark"] = {
			ImageSet = "img_set_2x_13",
			ImageRectOffset = Vector2.new(74, 460),
			ImageRectSize = Vector2.new(32, 32)
		},
		["icons/controls/voice/speaker_80_small_light"] = {
			ImageSet = "img_set_2x_13",
			ImageRectOffset = Vector2.new(34, 460),
			ImageRectSize = Vector2.new(32, 32)
		},
		["icons/controls/voice/speaker_error_dark"] = {
			ImageSet = "img_set_2x_17",
			ImageRectOffset = Vector2.new(340, 222),
			ImageRectSize = Vector2.new(72, 72)
		},
		["icons/controls/voice/speaker_error_light"] = {
			ImageSet = "img_set_2x_17",
			ImageRectOffset = Vector2.new(414, 148),
			ImageRectSize = Vector2.new(72, 72)
		},
		["icons/controls/voice/speaker_error_small_dark"] = {
			ImageSet = "img_set_2x_13",
			ImageRectOffset = Vector2.new(0, 460),
			ImageRectSize = Vector2.new(32, 32)
		},
		["icons/controls/voice/speaker_error_small_light"] = {
			ImageSet = "img_set_2x_11",
			ImageRectOffset = Vector2.new(404, 460),
			ImageRectSize = Vector2.new(32, 32)
		},
		["icons/controls/voice/speaker_off_dark"] = {
			ImageSet = "img_set_2x_17",
			ImageRectOffset = Vector2.new(340, 148),
			ImageRectSize = Vector2.new(72, 72)
		},
		["icons/controls/voice/speaker_off_light"] = {
			ImageSet = "img_set_2x_17",
			ImageRectOffset = Vector2.new(414, 74),
			ImageRectSize = Vector2.new(72, 72)
		},
		["icons/controls/voice/speaker_off_small_dark"] = {
			ImageSet = "img_set_2x_11",
			ImageRectOffset = Vector2.new(370, 460),
			ImageRectSize = Vector2.new(32, 32)
		},
		["icons/controls/voice/speaker_off_small_light"] = {
			ImageSet = "img_set_2x_11",
			ImageRectOffset = Vector2.new(330, 460),
			ImageRectSize = Vector2.new(32, 32)
		},
		["icons/controls/voice/speaker_on_dark"] = {
			ImageSet = "img_set_2x_19",
			ImageRectOffset = Vector2.new(222, 438),
			ImageRectSize = Vector2.new(72, 72)
		},
		["icons/controls/voice/speaker_on_light"] = {
			ImageSet = "img_set_2x_19",
			ImageRectOffset = Vector2.new(322, 182),
			ImageRectSize = Vector2.new(72, 72)
		},
		["icons/controls/voice/speaker_on_small_dark"] = {
			ImageSet = "img_set_2x_12",
			ImageRectOffset = Vector2.new(460, 148),
			ImageRectSize = Vector2.new(32, 32)
		},
		["icons/controls/voice/speaker_on_small_light"] = {
			ImageSet = "img_set_2x_13",
			ImageRectOffset = Vector2.new(460, 0),
			ImageRectSize = Vector2.new(32, 32)
		},
		["icons/controls/voice/video_error_dark"] = {
			ImageSet = "img_set_2x_17",
			ImageRectOffset = Vector2.new(340, 74),
			ImageRectSize = Vector2.new(72, 72)
		},
		["icons/controls/voice/video_error_light"] = {
			ImageSet = "img_set_2x_17",
			ImageRectOffset = Vector2.new(414, 0),
			ImageRectSize = Vector2.new(72, 72)
		},
		["icons/controls/voice/video_error_small_dark"] = {
			ImageSet = "img_set_2x_11",
			ImageRectOffset = Vector2.new(296, 460),
			ImageRectSize = Vector2.new(32, 32)
		},
		["icons/controls/voice/video_error_small_light"] = {
			ImageSet = "img_set_2x_11",
			ImageRectOffset = Vector2.new(256, 460),
			ImageRectSize = Vector2.new(32, 32)
		},
		["icons/controls/voice/video_off_dark"] = {
			ImageSet = "img_set_2x_17",
			ImageRectOffset = Vector2.new(340, 0),
			ImageRectSize = Vector2.new(72, 72)
		},
		["icons/controls/voice/video_off_light"] = {
			ImageSet = "img_set_2x_15",
			ImageRectOffset = Vector2.new(370, 382),
			ImageRectSize = Vector2.new(72, 72)
		},
		["icons/controls/voice/video_off_small_dark"] = {
			ImageSet = "img_set_2x_10",
			ImageRectOffset = Vector2.new(252, 470),
			ImageRectSize = Vector2.new(33, 32)
		},
		["icons/controls/voice/video_off_small_light"] = {
			ImageSet = "img_set_2x_10",
			ImageRectOffset = Vector2.new(287, 470),
			ImageRectSize = Vector2.new(33, 32)
		},
		["icons/controls/voice/video_on_dark"] = {
			ImageSet = "img_set_2x_15",
			ImageRectOffset = Vector2.new(296, 382),
			ImageRectSize = Vector2.new(72, 72)
		},
		["icons/controls/voice/video_on_light"] = {
			ImageSet = "img_set_2x_15",
			ImageRectOffset = Vector2.new(222, 382),
			ImageRectSize = Vector2.new(72, 72)
		},
		["icons/controls/voice/video_on_small_dark"] = {
			ImageSet = "img_set_2x_11",
			ImageRectOffset = Vector2.new(222, 460),
			ImageRectSize = Vector2.new(32, 32)
		},
		["icons/controls/voice/video_on_small_light"] = {
			ImageSet = "img_set_2x_11",
			ImageRectOffset = Vector2.new(182, 460),
			ImageRectSize = Vector2.new(32, 32)
		},
		["icons/graphic/blocktheft_2xl"] = {
			ImageSet = "img_set_2x_22",
			ImageRectOffset = Vector2.new(302, 0),
			ImageRectSize = Vector2.new(192, 192)
		},
		["icons/graphic/camera_on_off"] = {
			ImageSet = "img_set_2x_7",
			ImageRectOffset = Vector2.new(395, 419),
			ImageRectSize = Vector2.new(87, 86)
		},
		["icons/graphic/clothes_category_art_dark"] = {
			ImageSet = "img_set_2x_18",
			ImageRectOffset = Vector2.new(0, 322),
			ImageRectSize = Vector2.new(320, 180)
		},
		["icons/graphic/clothes_category_art_light"] = {
			ImageSet = "img_set_2x_20",
			ImageRectOffset = Vector2.new(0, 0),
			ImageRectSize = Vector2.new(320, 180)
		},
		["icons/graphic/connectcontacts_xlarge"] = {
			ImageSet = "img_set_2x_22",
			ImageRectOffset = Vector2.new(302, 194),
			ImageRectSize = Vector2.new(192, 192)
		},
		["icons/graphic/connectdevices_2xl"] = {
			ImageSet = "img_set_2x_24",
			ImageRectOffset = Vector2.new(0, 0),
			ImageRectSize = Vector2.new(192, 192)
		},
		["icons/graphic/devices_xxlarge"] = {
			ImageSet = "img_set_2x_12",
			ImageRectOffset = Vector2.new(0, 0),
			ImageRectSize = Vector2.new(384, 384)
		},
		["icons/graphic/envelope_dark"] = {
			ImageSet = "img_set_2x_20",
			ImageRectOffset = Vector2.new(0, 182),
			ImageRectSize = Vector2.new(320, 180)
		},
		["icons/graphic/envelope_light"] = {
			ImageSet = "img_set_2x_21",
			ImageRectOffset = Vector2.new(0, 0),
			ImageRectSize = Vector2.new(320, 180)
		},
		["icons/graphic/error_xlarge"] = {
			ImageSet = "img_set_2x_24",
			ImageRectOffset = Vector2.new(0, 194),
			ImageRectSize = Vector2.new(192, 192)
		},
		["icons/graphic/findfriends_xlarge"] = {
			ImageSet = "img_set_2x_24",
			ImageRectOffset = Vector2.new(194, 0),
			ImageRectSize = Vector2.new(192, 192)
		},
		["icons/graphic/gamesanditems_2xl"] = {
			ImageSet = "img_set_2x_23",
			ImageRectOffset = Vector2.new(194, 194),
			ImageRectSize = Vector2.new(192, 192)
		},
		["icons/graphic/loadingspinner"] = {
			ImageSet = "img_set_2x_10",
			ImageRectOffset = Vector2.new(387, 0),
			ImageRectSize = Vector2.new(96, 96)
		},
		["icons/graphic/newclothing_3xl"] = {
			ImageSet = "img_set_2x_14",
			ImageRectOffset = Vector2.new(0, 0),
			ImageRectSize = Vector2.new(384, 384)
		},
		["icons/graphic/newclothing_xlarge"] = {
			ImageSet = "img_set_2x_23",
			ImageRectOffset = Vector2.new(194, 0),
			ImageRectSize = Vector2.new(192, 192)
		},
		["icons/graphic/passkey_upsell_dark"] = {
			ImageSet = "img_set_2x_7",
			ImageRectOffset = Vector2.new(0, 223),
			ImageRectSize = Vector2.new(393, 221)
		},
		["icons/graphic/passkey_upsell_light"] = {
			ImageSet = "img_set_2x_7",
			ImageRectOffset = Vector2.new(0, 0),
			ImageRectSize = Vector2.new(393, 221)
		},
		["icons/graphic/robuxcoin1_xxlarge"] = {
			ImageSet = "img_set_2x_8",
			ImageRectOffset = Vector2.new(0, 0),
			ImageRectSize = Vector2.new(385, 384)
		},
		["icons/graphic/robuxcoin2_xxlarge"] = {
			ImageSet = "img_set_2x_10",
			ImageRectOffset = Vector2.new(0, 0),
			ImageRectSize = Vector2.new(385, 384)
		},
		["icons/graphic/robuxcoin3_xxlarge"] = {
			ImageSet = "img_set_2x_11",
			ImageRectOffset = Vector2.new(0, 0),
			ImageRectSize = Vector2.new(385, 384)
		},
		["icons/graphic/robuxcoin4_xxlarge"] = {
			ImageSet = "img_set_2x_15",
			ImageRectOffset = Vector2.new(0, 0),
			ImageRectSize = Vector2.new(384, 380)
		},
		["icons/graphic/robuxcoin5_xxlarge"] = {
			ImageSet = "img_set_2x_13",
			ImageRectOffset = Vector2.new(0, 0),
			ImageRectSize = Vector2.new(384, 384)
		},
		["icons/graphic/robuxcoin6_xxlarge"] = {
			ImageSet = "img_set_2x_9",
			ImageRectOffset = Vector2.new(0, 0),
			ImageRectSize = Vector2.new(385, 384)
		},
		["icons/graphic/success_xlarge"] = {
			ImageSet = "img_set_2x_23",
			ImageRectOffset = Vector2.new(0, 194),
			ImageRectSize = Vector2.new(192, 192)
		},
		["icons/graphic/verifyCode_dark"] = {
			ImageSet = "img_set_2x_19",
			ImageRectOffset = Vector2.new(0, 182),
			ImageRectSize = Vector2.new(320, 180)
		},
		["icons/graphic/verifyCode_light"] = {
			ImageSet = "img_set_2x_19",
			ImageRectOffset = Vector2.new(0, 0),
			ImageRectSize = Vector2.new(320, 180)
		},
		["icons/graphic/voicechat_large"] = {
			ImageSet = "img_set_2x_10",
			ImageRectOffset = Vector2.new(387, 98),
			ImageRectSize = Vector2.new(96, 96)
		},
		["icons/logo/letterform"] = {
			ImageSet = "img_set_2x_6",
			ImageRectOffset = Vector2.new(0, 402),
			ImageRectSize = Vector2.new(376, 72)
		},
		["icons/logo/letterform_classic"] = {
			ImageSet = "img_set_2x_2",
			ImageRectOffset = Vector2.new(0, 106),
			ImageRectSize = Vector2.new(456, 120)
		},
		["icons/logo/letterform_dark"] = {
			ImageSet = "img_set_2x_4",
			ImageRectOffset = Vector2.new(0, 0),
			ImageRectSize = Vector2.new(434, 120)
		},
		["icons/logo/letterform_dark_01"] = {
			ImageSet = "img_set_2x_4",
			ImageRectOffset = Vector2.new(0, 122),
			ImageRectSize = Vector2.new(434, 120)
		},
		["icons/logo/letterform_dark_02"] = {
			ImageSet = "img_set_2x_3",
			ImageRectOffset = Vector2.new(0, 366),
			ImageRectSize = Vector2.new(440, 120)
		},
		["icons/logo/letterform_dark_03"] = {
			ImageSet = "img_set_2x_2",
			ImageRectOffset = Vector2.new(0, 228),
			ImageRectSize = Vector2.new(456, 120)
		},
		["icons/logo/letterform_dark_04"] = {
			ImageSet = "img_set_2x_2",
			ImageRectOffset = Vector2.new(0, 350),
			ImageRectSize = Vector2.new(456, 120)
		},
		["icons/logo/letterform_dark_05"] = {
			ImageSet = "img_set_2x_5",
			ImageRectOffset = Vector2.new(0, 366),
			ImageRectSize = Vector2.new(431, 120)
		},
		["icons/logo/letterform_dark_06"] = {
			ImageSet = "img_set_2x_2",
			ImageRectOffset = Vector2.new(0, 106),
			ImageRectSize = Vector2.new(456, 120)
		},
		["icons/logo/letterform_dark_hat"] = {
			ImageSet = "img_set_2x_4",
			ImageRectOffset = Vector2.new(0, 244),
			ImageRectSize = Vector2.new(434, 120)
		},
		["icons/logo/letterform_light"] = {
			ImageSet = "img_set_2x_4",
			ImageRectOffset = Vector2.new(0, 366),
			ImageRectSize = Vector2.new(434, 120)
		},
		["icons/logo/letterform_light_01"] = {
			ImageSet = "img_set_2x_5",
			ImageRectOffset = Vector2.new(0, 122),
			ImageRectSize = Vector2.new(434, 120)
		},
		["icons/logo/letterform_light_02"] = {
			ImageSet = "img_set_2x_3",
			ImageRectOffset = Vector2.new(0, 244),
			ImageRectSize = Vector2.new(440, 120)
		},
		["icons/logo/letterform_light_03"] = {
			ImageSet = "img_set_2x_3",
			ImageRectOffset = Vector2.new(0, 122),
			ImageRectSize = Vector2.new(456, 120)
		},
		["icons/logo/letterform_light_04"] = {
			ImageSet = "img_set_2x_3",
			ImageRectOffset = Vector2.new(0, 0),
			ImageRectSize = Vector2.new(456, 120)
		},
		["icons/logo/letterform_light_05"] = {
			ImageSet = "img_set_2x_5",
			ImageRectOffset = Vector2.new(0, 244),
			ImageRectSize = Vector2.new(431, 120)
		},
		["icons/logo/letterform_light_06"] = {
			ImageSet = "img_set_2x_2",
			ImageRectOffset = Vector2.new(0, 106),
			ImageRectSize = Vector2.new(456, 120)
		},
		["icons/logo/letterform_light_hat"] = {
			ImageSet = "img_set_2x_5",
			ImageRectOffset = Vector2.new(0, 0),
			ImageRectSize = Vector2.new(434, 120)
		},
		["icons/logo/studiologo"] = {
			ImageSet = "img_set_2x_15",
			ImageRectOffset = Vector2.new(148, 382),
			ImageRectSize = Vector2.new(72, 72)
		},
		["icons/logo/studiologo_small"] = {
			ImageSet = "img_set_2x_11",
			ImageRectOffset = Vector2.new(148, 460),
			ImageRectSize = Vector2.new(32, 32)
		},
		["icons/menu/2-person-with-bubble"] = {
			ImageSet = "img_set_2x_15",
			ImageRectOffset = Vector2.new(0, 382),
			ImageRectSize = Vector2.new(72, 72)
		},
		["icons/menu/2-person-with-bubble-on"] = {
			ImageSet = "img_set_2x_15",
			ImageRectOffset = Vector2.new(74, 382),
			ImageRectSize = Vector2.new(72, 72)
		},
		["icons/menu/AR_cube"] = {
			ImageSet = "img_set_2x_15",
			ImageRectOffset = Vector2.new(386, 296),
			ImageRectSize = Vector2.new(72, 72)
		},
		["icons/menu/AR_frame"] = {
			ImageSet = "img_set_2x_15",
			ImageRectOffset = Vector2.new(386, 222),
			ImageRectSize = Vector2.new(72, 72)
		},
		["icons/menu/adjust/position_small"] = {
			ImageSet = "img_set_2x_11",
			ImageRectOffset = Vector2.new(108, 460),
			ImageRectSize = Vector2.new(32, 32)
		},
		["icons/menu/adjust/rotationZ"] = {
			ImageSet = "img_set_2x_15",
			ImageRectOffset = Vector2.new(386, 148),
			ImageRectSize = Vector2.new(72, 72)
		},
		["icons/menu/avatar_off"] = {
			ImageSet = "img_set_2x_15",
			ImageRectOffset = Vector2.new(386, 74),
			ImageRectSize = Vector2.new(72, 72)
		},
		["icons/menu/avatar_on"] = {
			ImageSet = "img_set_2x_15",
			ImageRectOffset = Vector2.new(386, 0),
			ImageRectSize = Vector2.new(72, 72)
		},
		["icons/menu/body_female"] = {
			ImageSet = "img_set_2x_13",
			ImageRectOffset = Vector2.new(386, 370),
			ImageRectSize = Vector2.new(72, 72)
		},
		["icons/menu/body_heavy"] = {
			ImageSet = "img_set_2x_13",
			ImageRectOffset = Vector2.new(386, 296),
			ImageRectSize = Vector2.new(72, 72)
		},
		["icons/menu/body_male"] = {
			ImageSet = "img_set_2x_13",
			ImageRectOffset = Vector2.new(386, 222),
			ImageRectSize = Vector2.new(72, 72)
		},
		["icons/menu/body_neutral"] = {
			ImageSet = "img_set_2x_13",
			ImageRectOffset = Vector2.new(386, 148),
			ImageRectSize = Vector2.new(72, 72)
		},
		["icons/menu/body_short"] = {
			ImageSet = "img_set_2x_13",
			ImageRectOffset = Vector2.new(386, 74),
			ImageRectSize = Vector2.new(72, 72)
		},
		["icons/menu/body_tall"] = {
			ImageSet = "img_set_2x_13",
			ImageRectOffset = Vector2.new(386, 0),
			ImageRectSize = Vector2.new(72, 72)
		},
		["icons/menu/body_thin"] = {
			ImageSet = "img_set_2x_13",
			ImageRectOffset = Vector2.new(296, 386),
			ImageRectSize = Vector2.new(72, 72)
		},
		["icons/menu/clothing/accessories_on"] = {
			ImageSet = "img_set_2x_2",
			ImageRectOffset = Vector2.new(50, 472),
			ImageRectSize = Vector2.new(36, 36)
		},
		["icons/menu/clothing/animation_off"] = {
			ImageSet = "img_set_2x_2",
			ImageRectOffset = Vector2.new(88, 472),
			ImageRectSize = Vector2.new(36, 36)
		},
		["icons/menu/clothing/animation_on"] = {
			ImageSet = "img_set_2x_2",
			ImageRectOffset = Vector2.new(126, 472),
			ImageRectSize = Vector2.new(36, 36)
		},
		["icons/menu/clothing/back_on"] = {
			ImageSet = "img_set_2x_2",
			ImageRectOffset = Vector2.new(164, 472),
			ImageRectSize = Vector2.new(36, 36)
		},
		["icons/menu/clothing/body_off"] = {
			ImageSet = "img_set_2x_2",
			ImageRectOffset = Vector2.new(202, 472),
			ImageRectSize = Vector2.new(36, 36)
		},
		["icons/menu/clothing/body_on"] = {
			ImageSet = "img_set_2x_2",
			ImageRectOffset = Vector2.new(240, 472),
			ImageRectSize = Vector2.new(36, 36)
		},
		["icons/menu/clothing/build_off"] = {
			ImageSet = "img_set_2x_2",
			ImageRectOffset = Vector2.new(278, 472),
			ImageRectSize = Vector2.new(36, 36)
		},
		["icons/menu/clothing/build_on"] = {
			ImageSet = "img_set_2x_2",
			ImageRectOffset = Vector2.new(316, 472),
			ImageRectSize = Vector2.new(36, 36)
		},
		["icons/menu/clothing/characters_on"] = {
			ImageSet = "img_set_2x_2",
			ImageRectOffset = Vector2.new(354, 472),
			ImageRectSize = Vector2.new(36, 36)
		},
		["icons/menu/clothing/climb_off"] = {
			ImageSet = "img_set_2x_2",
			ImageRectOffset = Vector2.new(392, 472),
			ImageRectSize = Vector2.new(36, 36)
		},
		["icons/menu/clothing/climb_on"] = {
			ImageSet = "img_set_2x_2",
			ImageRectOffset = Vector2.new(430, 472),
			ImageRectSize = Vector2.new(36, 36)
		},
		["icons/menu/clothing/creations_off"] = {
			ImageSet = "img_set_2x_2",
			ImageRectOffset = Vector2.new(468, 472),
			ImageRectSize = Vector2.new(36, 36)
		},
		["icons/menu/clothing/creations_on"] = {
			ImageSet = "img_set_2x_4",
			ImageRectOffset = Vector2.new(436, 440),
			ImageRectSize = Vector2.new(36, 36)
		},
		["icons/menu/clothing/eyebrow_on"] = {
			ImageSet = "img_set_2x_4",
			ImageRectOffset = Vector2.new(474, 440),
			ImageRectSize = Vector2.new(36, 36)
		},
		["icons/menu/clothing/eyelash_on"] = {
			ImageSet = "img_set_2x_8",
			ImageRectOffset = Vector2.new(387, 342),
			ImageRectSize = Vector2.new(36, 36)
		},
		["icons/menu/clothing/face_on"] = {
			ImageSet = "img_set_2x_8",
			ImageRectOffset = Vector2.new(425, 342),
			ImageRectSize = Vector2.new(36, 36)
		},
		["icons/menu/clothing/faces_off"] = {
			ImageSet = "img_set_2x_8",
			ImageRectOffset = Vector2.new(463, 342),
			ImageRectSize = Vector2.new(36, 36)
		},
		["icons/menu/clothing/facialHair_off"] = {
			ImageSet = "img_set_2x_8",
			ImageRectOffset = Vector2.new(0, 460),
			ImageRectSize = Vector2.new(36, 36)
		},
		["icons/menu/clothing/facialHair_on"] = {
			ImageSet = "img_set_2x_8",
			ImageRectOffset = Vector2.new(38, 460),
			ImageRectSize = Vector2.new(36, 36)
		},
		["icons/menu/clothing/fall_off"] = {
			ImageSet = "img_set_2x_8",
			ImageRectOffset = Vector2.new(76, 460),
			ImageRectSize = Vector2.new(36, 36)
		},
		["icons/menu/clothing/fall_on"] = {
			ImageSet = "img_set_2x_8",
			ImageRectOffset = Vector2.new(114, 460),
			ImageRectSize = Vector2.new(36, 36)
		},
		["icons/menu/clothing/hair_off"] = {
			ImageSet = "img_set_2x_8",
			ImageRectOffset = Vector2.new(186, 460),
			ImageRectSize = Vector2.new(36, 36)
		},
		["icons/menu/clothing/hair_on"] = {
			ImageSet = "img_set_2x_8",
			ImageRectOffset = Vector2.new(224, 460),
			ImageRectSize = Vector2.new(36, 36)
		},
		["icons/menu/clothing/idle_off"] = {
			ImageSet = "img_set_2x_8",
			ImageRectOffset = Vector2.new(262, 460),
			ImageRectSize = Vector2.new(36, 36)
		},
		["icons/menu/clothing/idle_on"] = {
			ImageSet = "img_set_2x_10",
			ImageRectOffset = Vector2.new(471, 196),
			ImageRectSize = Vector2.new(36, 36)
		},
		["icons/menu/clothing/jump_off"] = {
			ImageSet = "img_set_2x_10",
			ImageRectOffset = Vector2.new(471, 234),
			ImageRectSize = Vector2.new(36, 36)
		},
		["icons/menu/clothing/jump_on"] = {
			ImageSet = "img_set_2x_10",
			ImageRectOffset = Vector2.new(471, 280),
			ImageRectSize = Vector2.new(36, 36)
		},
		["icons/menu/clothing/limited_off"] = {
			ImageSet = "img_set_2x_10",
			ImageRectOffset = Vector2.new(471, 318),
			ImageRectSize = Vector2.new(36, 36)
		},
		["icons/menu/clothing/limited_on"] = {
			ImageSet = "img_set_2x_10",
			ImageRectOffset = Vector2.new(0, 470),
			ImageRectSize = Vector2.new(36, 36)
		},
		["icons/menu/clothing/nose_on"] = {
			ImageSet = "img_set_2x_10",
			ImageRectOffset = Vector2.new(38, 470),
			ImageRectSize = Vector2.new(36, 36)
		},
		["icons/menu/clothing/shorts_on"] = {
			ImageSet = "img_set_2x_10",
			ImageRectOffset = Vector2.new(84, 470),
			ImageRectSize = Vector2.new(36, 36)
		},
		["icons/menu/clothing/shoulder_on"] = {
			ImageSet = "img_set_2x_10",
			ImageRectOffset = Vector2.new(122, 470),
			ImageRectSize = Vector2.new(36, 36)
		},
		["icons/menu/clothing/skin_on"] = {
			ImageSet = "img_set_2x_9",
			ImageRectOffset = Vector2.new(473, 332),
			ImageRectSize = Vector2.new(36, 36)
		},
		["icons/menu/clothing/sweaters_on"] = {
			ImageSet = "img_set_2x_9",
			ImageRectOffset = Vector2.new(473, 294),
			ImageRectSize = Vector2.new(36, 36)
		},
		["icons/menu/clothing/swim_off"] = {
			ImageSet = "img_set_2x_5",
			ImageRectOffset = Vector2.new(471, 440),
			ImageRectSize = Vector2.new(36, 36)
		},
		["icons/menu/clothing/swim_on"] = {
			ImageSet = "img_set_2x_5",
			ImageRectOffset = Vector2.new(433, 440),
			ImageRectSize = Vector2.new(36, 36)
		},
		["icons/menu/clothing/torsos_on"] = {
			ImageSet = "img_set_2x_5",
			ImageRectOffset = Vector2.new(471, 318),
			ImageRectSize = Vector2.new(36, 36)
		},
		["icons/menu/clothing/type_off"] = {
			ImageSet = "img_set_2x_5",
			ImageRectOffset = Vector2.new(433, 318),
			ImageRectSize = Vector2.new(36, 36)
		},
		["icons/menu/clothing/type_on"] = {
			ImageSet = "img_set_2x_5",
			ImageRectOffset = Vector2.new(474, 196),
			ImageRectSize = Vector2.new(36, 36)
		},
		["icons/menu/clothing/waist_on"] = {
			ImageSet = "img_set_2x_5",
			ImageRectOffset = Vector2.new(436, 196),
			ImageRectSize = Vector2.new(36, 36)
		},
		["icons/menu/clothing/walk_off"] = {
			ImageSet = "img_set_2x_5",
			ImageRectOffset = Vector2.new(474, 74),
			ImageRectSize = Vector2.new(36, 36)
		},
		["icons/menu/clothing/walk_on"] = {
			ImageSet = "img_set_2x_5",
			ImageRectOffset = Vector2.new(436, 74),
			ImageRectSize = Vector2.new(36, 36)
		},
		["icons/menu/customize"] = {
			ImageSet = "img_set_2x_13",
			ImageRectOffset = Vector2.new(222, 386),
			ImageRectSize = Vector2.new(72, 72)
		},
		["icons/menu/customize_large"] = {
			ImageSet = "img_set_2x_9",
			ImageRectOffset = Vector2.new(392, 386),
			ImageRectSize = Vector2.new(96, 96)
		},
		["icons/menu/gem_medium"] = {
			ImageSet = "img_set_2x_13",
			ImageRectOffset = Vector2.new(148, 386),
			ImageRectSize = Vector2.new(72, 72)
		},
		["icons/menu/gem_small"] = {
			ImageSet = "img_set_2x_11",
			ImageRectOffset = Vector2.new(74, 460),
			ImageRectSize = Vector2.new(32, 32)
		},
		["icons/menu/protection_off"] = {
			ImageSet = "img_set_2x_13",
			ImageRectOffset = Vector2.new(74, 386),
			ImageRectSize = Vector2.new(72, 72)
		},
		["icons/menu/protection_on"] = {
			ImageSet = "img_set_2x_13",
			ImageRectOffset = Vector2.new(0, 386),
			ImageRectSize = Vector2.new(72, 72)
		},
		["icons/menu/publicChatOff"] = {
			ImageSet = "img_set_2x_11",
			ImageRectOffset = Vector2.new(370, 386),
			ImageRectSize = Vector2.new(72, 72)
		},
		["icons/menu/publicChatOff_small"] = {
			ImageSet = "img_set_2x_11",
			ImageRectOffset = Vector2.new(34, 460),
			ImageRectSize = Vector2.new(32, 32)
		},
		["icons/menu/publicChatOn"] = {
			ImageSet = "img_set_2x_11",
			ImageRectOffset = Vector2.new(296, 386),
			ImageRectSize = Vector2.new(72, 72)
		},
		["icons/menu/publicChatOn_small"] = {
			ImageSet = "img_set_2x_11",
			ImageRectOffset = Vector2.new(0, 460),
			ImageRectSize = Vector2.new(32, 32)
		},
		["icons/menu/rocketShipOn_medium"] = {
			ImageSet = "img_set_2x_11",
			ImageRectOffset = Vector2.new(222, 386),
			ImageRectSize = Vector2.new(72, 72)
		},
		["icons/menu/rocketShip_medium"] = {
			ImageSet = "img_set_2x_11",
			ImageRectOffset = Vector2.new(148, 386),
			ImageRectSize = Vector2.new(72, 72)
		},
		["icons/menu/rocketShip_small"] = {
			ImageSet = "img_set_2x_11",
			ImageRectOffset = Vector2.new(461, 330),
			ImageRectSize = Vector2.new(32, 32)
		},
		["icons/menu/securityKey"] = {
			ImageSet = "img_set_2x_11",
			ImageRectOffset = Vector2.new(74, 386),
			ImageRectSize = Vector2.new(72, 72)
		},
		["icons/menu/transform"] = {
			ImageSet = "img_set_2x_11",
			ImageRectOffset = Vector2.new(0, 386),
			ImageRectSize = Vector2.new(72, 72)
		},
		["icons/menu/transform-small"] = {
			ImageSet = "img_set_2x_11",
			ImageRectOffset = Vector2.new(461, 296),
			ImageRectSize = Vector2.new(32, 32)
		},
		["icons/navigation/close"] = {
			ImageSet = "img_set_2x_11",
			ImageRectOffset = Vector2.new(387, 296),
			ImageRectSize = Vector2.new(72, 72)
		},
		["icons/navigation/externallink"] = {
			ImageSet = "img_set_2x_11",
			ImageRectOffset = Vector2.new(461, 256),
			ImageRectSize = Vector2.new(32, 32)
		},
		["icons/navigation/externallink_medium"] = {
			ImageSet = "img_set_2x_11",
			ImageRectOffset = Vector2.new(387, 222),
			ImageRectSize = Vector2.new(72, 72)
		},
		["icons/navigation/seeAllArrow_small"] = {
			ImageSet = "img_set_2x_11",
			ImageRectOffset = Vector2.new(461, 222),
			ImageRectSize = Vector2.new(32, 32)
		},
		["icons/navigation/swipe"] = {
			ImageSet = "img_set_2x_11",
			ImageRectOffset = Vector2.new(387, 148),
			ImageRectSize = Vector2.new(72, 72)
		},
		["icons/navigation/swipeDown"] = {
			ImageSet = "img_set_2x_11",
			ImageRectOffset = Vector2.new(387, 74),
			ImageRectSize = Vector2.new(72, 72)
		},
		["icons/navigation/swipeUp"] = {
			ImageSet = "img_set_2x_11",
			ImageRectOffset = Vector2.new(387, 0),
			ImageRectSize = Vector2.new(72, 72)
		},
		["icons/status/collectibles"] = {
			ImageSet = "img_set_2x_5",
			ImageRectOffset = Vector2.new(433, 366),
			ImageRectSize = Vector2.new(72, 72)
		},
		["icons/status/collectibles_large"] = {
			ImageSet = "img_set_2x_9",
			ImageRectOffset = Vector2.new(294, 386),
			ImageRectSize = Vector2.new(96, 96)
		},
		["icons/status/collectibles_small"] = {
			ImageSet = "img_set_2x_11",
			ImageRectOffset = Vector2.new(461, 182),
			ImageRectSize = Vector2.new(32, 32)
		},
		["icons/status/games/sessions_large"] = {
			ImageSet = "img_set_2x_9",
			ImageRectOffset = Vector2.new(196, 386),
			ImageRectSize = Vector2.new(96, 96)
		},
		["icons/status/games/sessions_small"] = {
			ImageSet = "img_set_2x_11",
			ImageRectOffset = Vector2.new(461, 148),
			ImageRectSize = Vector2.new(32, 32)
		},
		["icons/status/item/limited"] = {
			ImageSet = "img_set_2x_11",
			ImageRectOffset = Vector2.new(461, 108),
			ImageRectSize = Vector2.new(32, 32)
		},
		["icons/status/loading_large"] = {
			ImageSet = "img_set_2x_9",
			ImageRectOffset = Vector2.new(98, 386),
			ImageRectSize = Vector2.new(96, 96)
		},
		["icons/status/loading_medium"] = {
			ImageSet = "img_set_2x_5",
			ImageRectOffset = Vector2.new(433, 244),
			ImageRectSize = Vector2.new(72, 72)
		},
		["icons/status/loading_small"] = {
			ImageSet = "img_set_2x_11",
			ImageRectOffset = Vector2.new(461, 74),
			ImageRectSize = Vector2.new(32, 32)
		},
		["icons/status/oof_xlarge"] = {
			ImageSet = "img_set_2x_23",
			ImageRectOffset = Vector2.new(0, 0),
			ImageRectSize = Vector2.new(192, 192)
		},
		["icons/status/player/videostar"] = {
			ImageSet = "img_set_2x_11",
			ImageRectOffset = Vector2.new(461, 34),
			ImageRectSize = Vector2.new(32, 32)
		},
		["icons/status/trending_small"] = {
			ImageSet = "img_set_2x_11",
			ImageRectOffset = Vector2.new(461, 0),
			ImageRectSize = Vector2.new(32, 32)
		},
		["reactions/crying"] = {
			ImageSet = "img_set_2x_9",
			ImageRectOffset = Vector2.new(0, 386),
			ImageRectSize = Vector2.new(96, 96)
		},
		["reactions/fire"] = {
			ImageSet = "img_set_2x_9",
			ImageRectOffset = Vector2.new(387, 196),
			ImageRectSize = Vector2.new(96, 96)
		},
		["reactions/heart"] = {
			ImageSet = "img_set_2x_9",
			ImageRectOffset = Vector2.new(387, 98),
			ImageRectSize = Vector2.new(96, 96)
		},
		["reactions/laughJoy"] = {
			ImageSet = "img_set_2x_9",
			ImageRectOffset = Vector2.new(387, 0),
			ImageRectSize = Vector2.new(96, 96)
		},
		["reactions/skull"] = {
			ImageSet = "img_set_2x_7",
			ImageRectOffset = Vector2.new(395, 321),
			ImageRectSize = Vector2.new(96, 96)
		},
		["reactions/thumbsUp"] = {
			ImageSet = "img_set_2x_7",
			ImageRectOffset = Vector2.new(395, 223),
			ImageRectSize = Vector2.new(96, 96)
		},
		["reactions/wow"] = {
			ImageSet = "img_set_2x_7",
			ImageRectOffset = Vector2.new(395, 114),
			ImageRectSize = Vector2.new(96, 96)
		},
		["squircles/fill"] = {
			ImageSet = "img_set_2x_2",
			ImageRectOffset = Vector2.new(458, 228),
			ImageRectSize = Vector2.new(52, 52)
		},
		["squircles/hollow"] = {
			ImageSet = "img_set_2x_2",
			ImageRectOffset = Vector2.new(458, 282),
			ImageRectSize = Vector2.new(52, 52)
		},
		["squircles/hollowBold"] = {
			ImageSet = "img_set_2x_7",
			ImageRectOffset = Vector2.new(132, 446),
			ImageRectSize = Vector2.new(60, 60)
		},
		["truncate_arrows/actions_truncationCollapse"] = {
			ImageSet = "img_set_2x_5",
			ImageRectOffset = Vector2.new(436, 122),
			ImageRectSize = Vector2.new(72, 72)
		},
		["truncate_arrows/actions_truncationExpand"] = {
			ImageSet = "img_set_2x_5",
			ImageRectOffset = Vector2.new(436, 0),
			ImageRectSize = Vector2.new(72, 72)
		}
	}
end

local var3 = nil

function make_assets_3x()
	-- upvalues: var3 (write)
	var3 = {
		["chat_bubble/chat-bubble"] = {
			ImageSet = "img_set_3x_6",
			ImageRectOffset = Vector2.new(953, 789),
			ImageRectSize = Vector2.new(63, 63)
		},
		["chat_bubble/chat-bubble-bottom"] = {
			ImageSet = "img_set_3x_12",
			ImageRectOffset = Vector2.new(794, 182),
			ImageRectSize = Vector2.new(123, 123)
		},
		["chat_bubble/chat-bubble-middle"] = {
			ImageSet = "img_set_3x_12",
			ImageRectOffset = Vector2.new(648, 364),
			ImageRectSize = Vector2.new(123, 123)
		},
		["chat_bubble/chat-bubble-self"] = {
			ImageSet = "img_set_3x_6",
			ImageRectOffset = Vector2.new(953, 724),
			ImageRectSize = Vector2.new(63, 63)
		},
		["chat_bubble/chat-bubble-self-bottom"] = {
			ImageSet = "img_set_3x_12",
			ImageRectOffset = Vector2.new(773, 364),
			ImageRectSize = Vector2.new(123, 123)
		},
		["chat_bubble/chat-bubble-self-middle"] = {
			ImageSet = "img_set_3x_12",
			ImageRectOffset = Vector2.new(898, 364),
			ImageRectSize = Vector2.new(123, 123)
		},
		["chat_bubble/chat-bubble-self-tip"] = {
			ImageSet = "img_set_3x_3",
			ImageRectOffset = Vector2.new(1000, 585),
			ImageRectSize = Vector2.new(18, 18)
		},
		["chat_bubble/chat-bubble-self-top"] = {
			ImageSet = "img_set_3x_12",
			ImageRectOffset = Vector2.new(0, 879),
			ImageRectSize = Vector2.new(123, 123)
		},
		["chat_bubble/chat-bubble-self2"] = {
			ImageSet = "img_set_3x_6",
			ImageRectOffset = Vector2.new(953, 610),
			ImageRectSize = Vector2.new(63, 63)
		},
		["chat_bubble/chat-bubble-single"] = {
			ImageSet = "img_set_3x_12",
			ImageRectOffset = Vector2.new(125, 879),
			ImageRectSize = Vector2.new(123, 123)
		},
		["chat_bubble/chat-bubble-tip"] = {
			ImageSet = "img_set_3x_3",
			ImageRectOffset = Vector2.new(1000, 565),
			ImageRectSize = Vector2.new(18, 18)
		},
		["chat_bubble/chat-bubble-top"] = {
			ImageSet = "img_set_3x_11",
			ImageRectOffset = Vector2.new(886, 866),
			ImageRectSize = Vector2.new(123, 123)
		},
		["chat_bubble/chat-bubble2"] = {
			ImageSet = "img_set_3x_6",
			ImageRectOffset = Vector2.new(953, 610),
			ImageRectSize = Vector2.new(63, 63)
		},
		["component_assets/avatarBG_dark"] = {
			ImageSet = "img_set_3x_2",
			ImageRectOffset = Vector2.new(0, 0),
			ImageRectSize = Vector2.new(1014, 1014)
		},
		["component_assets/avatarBG_light"] = {
			ImageSet = "img_set_3x_1",
			ImageRectOffset = Vector2.new(0, 0),
			ImageRectSize = Vector2.new(1014, 1014)
		},
		["component_assets/bulletDown_17_stroke_3"] = {
			ImageSet = "img_set_3x_8",
			ImageRectOffset = Vector2.new(962, 0),
			ImageRectSize = Vector2.new(51, 51)
		},
		["component_assets/bulletLeft_17"] = {
			ImageSet = "img_set_3x_8",
			ImageRectOffset = Vector2.new(962, 53),
			ImageRectSize = Vector2.new(51, 51)
		},
		["component_assets/bulletLeft_17_stroke_3"] = {
			ImageSet = "img_set_3x_8",
			ImageRectOffset = Vector2.new(962, 106),
			ImageRectSize = Vector2.new(51, 51)
		},
		["component_assets/bulletRight_17"] = {
			ImageSet = "img_set_3x_8",
			ImageRectOffset = Vector2.new(962, 159),
			ImageRectSize = Vector2.new(51, 51)
		},
		["component_assets/bulletRight_17_stroke_3"] = {
			ImageSet = "img_set_3x_8",
			ImageRectOffset = Vector2.new(962, 212),
			ImageRectSize = Vector2.new(51, 51)
		},
		["component_assets/bulletUp_17_stroke_3"] = {
			ImageSet = "img_set_3x_8",
			ImageRectOffset = Vector2.new(962, 265),
			ImageRectSize = Vector2.new(51, 51)
		},
		["component_assets/bullet_17"] = {
			ImageSet = "img_set_3x_8",
			ImageRectOffset = Vector2.new(962, 318),
			ImageRectSize = Vector2.new(51, 51)
		},
		["component_assets/checkerboard_12"] = {
			ImageSet = "img_set_3x_3",
			ImageRectOffset = Vector2.new(901, 652),
			ImageRectSize = Vector2.new(36, 36)
		},
		["component_assets/circle_15_stroke_3"] = {
			ImageSet = "img_set_3x_3",
			ImageRectOffset = Vector2.new(772, 652),
			ImageRectSize = Vector2.new(45, 45)
		},
		["component_assets/circle_16"] = {
			ImageSet = "img_set_3x_12",
			ImageRectOffset = Vector2.new(945, 0),
			ImageRectSize = Vector2.new(48, 48)
		},
		["component_assets/circle_17"] = {
			ImageSet = "img_set_3x_7",
			ImageRectOffset = Vector2.new(962, 439),
			ImageRectSize = Vector2.new(51, 51)
		},
		["component_assets/circle_17_mask"] = {
			ImageSet = "img_set_3x_7",
			ImageRectOffset = Vector2.new(962, 386),
			ImageRectSize = Vector2.new(51, 51)
		},
		["component_assets/circle_17_stroke_1"] = {
			ImageSet = "img_set_3x_7",
			ImageRectOffset = Vector2.new(962, 333),
			ImageRectSize = Vector2.new(51, 51)
		},
		["component_assets/circle_17_stroke_3"] = {
			ImageSet = "img_set_3x_7",
			ImageRectOffset = Vector2.new(962, 280),
			ImageRectSize = Vector2.new(51, 51)
		},
		["component_assets/circle_21"] = {
			ImageSet = "img_set_3x_11",
			ImageRectOffset = Vector2.new(611, 922),
			ImageRectSize = Vector2.new(63, 63)
		},
		["component_assets/circle_21_stroke_1"] = {
			ImageSet = "img_set_3x_3",
			ImageRectOffset = Vector2.new(959, 786),
			ImageRectSize = Vector2.new(63, 63)
		},
		["component_assets/circle_22_stroke_3"] = {
			ImageSet = "img_set_3x_6",
			ImageRectOffset = Vector2.new(953, 542),
			ImageRectSize = Vector2.new(66, 66)
		},
		["component_assets/circle_24_stroke_1"] = {
			ImageSet = "img_set_3x_8",
			ImageRectOffset = Vector2.new(945, 724),
			ImageRectSize = Vector2.new(72, 72)
		},
		["component_assets/circle_25"] = {
			ImageSet = "img_set_3x_8",
			ImageRectOffset = Vector2.new(945, 542),
			ImageRectSize = Vector2.new(75, 75)
		},
		["component_assets/circle_26_stroke_3"] = {
			ImageSet = "img_set_3x_7",
			ImageRectOffset = Vector2.new(945, 804),
			ImageRectSize = Vector2.new(78, 78)
		},
		["component_assets/circle_28_padding_10"] = {
			ImageSet = "img_set_3x_6",
			ImageRectOffset = Vector2.new(661, 542),
			ImageRectSize = Vector2.new(144, 144)
		},
		["component_assets/circle_29"] = {
			ImageSet = "img_set_3x_11",
			ImageRectOffset = Vector2.new(190, 922),
			ImageRectSize = Vector2.new(87, 87)
		},
		["component_assets/circle_29_mask"] = {
			ImageSet = "img_set_3x_11",
			ImageRectOffset = Vector2.new(101, 922),
			ImageRectSize = Vector2.new(87, 87)
		},
		["component_assets/circle_29_stroke_1"] = {
			ImageSet = "img_set_3x_3",
			ImageRectOffset = Vector2.new(870, 786),
			ImageRectSize = Vector2.new(87, 87)
		},
		["component_assets/circle_30_stroke_3"] = {
			ImageSet = "img_set_3x_3",
			ImageRectOffset = Vector2.new(778, 786),
			ImageRectSize = Vector2.new(90, 90)
		},
		["component_assets/circle_36"] = {
			ImageSet = "img_set_3x_4",
			ImageRectOffset = Vector2.new(224, 906),
			ImageRectSize = Vector2.new(108, 108)
		},
		["component_assets/circle_36_stroke_1"] = {
			ImageSet = "img_set_3x_4",
			ImageRectOffset = Vector2.new(334, 906),
			ImageRectSize = Vector2.new(108, 108)
		},
		["component_assets/circle_42_stroke_3"] = {
			ImageSet = "img_set_3x_3",
			ImageRectOffset = Vector2.new(893, 882),
			ImageRectSize = Vector2.new(126, 126)
		},
		["component_assets/circle_49"] = {
			ImageSet = "img_set_3x_4",
			ImageRectOffset = Vector2.new(868, 542),
			ImageRectSize = Vector2.new(147, 147)
		},
		["component_assets/circle_49_mask"] = {
			ImageSet = "img_set_3x_4",
			ImageRectOffset = Vector2.new(868, 724),
			ImageRectSize = Vector2.new(147, 147)
		},
		["component_assets/circle_49_stroke_1"] = {
			ImageSet = "img_set_3x_5",
			ImageRectOffset = Vector2.new(686, 724),
			ImageRectSize = Vector2.new(147, 147)
		},
		["component_assets/circle_52_stroke_3"] = {
			ImageSet = "img_set_3x_5",
			ImageRectOffset = Vector2.new(856, 542),
			ImageRectSize = Vector2.new(156, 156)
		},
		["component_assets/circle_60_stroke_2"] = {
			ImageSet = "img_set_3x_4",
			ImageRectOffset = Vector2.new(686, 542),
			ImageRectSize = Vector2.new(180, 180)
		},
		["component_assets/circle_68_stroke_2"] = {
			ImageSet = "img_set_3x_13",
			ImageRectOffset = Vector2.new(602, 810),
			ImageRectSize = Vector2.new(204, 204)
		},
		["component_assets/circle_69_stroke_3"] = {
			ImageSet = "img_set_3x_11",
			ImageRectOffset = Vector2.new(740, 657),
			ImageRectSize = Vector2.new(207, 207)
		},
		["component_assets/circle_72_stroke_3"] = {
			ImageSet = "img_set_3x_11",
			ImageRectOffset = Vector2.new(740, 0),
			ImageRectSize = Vector2.new(222, 216)
		},
		["component_assets/circle_9"] = {
			ImageSet = "img_set_3x_3",
			ImageRectOffset = Vector2.new(968, 652),
			ImageRectSize = Vector2.new(27, 27)
		},
		["component_assets/circle_9_stroke_1"] = {
			ImageSet = "img_set_3x_3",
			ImageRectOffset = Vector2.new(939, 652),
			ImageRectSize = Vector2.new(27, 27)
		},
		["component_assets/contactFullAvatar_large"] = {
			ImageSet = "img_set_3x_13",
			ImageRectOffset = Vector2.new(0, 0),
			ImageRectSize = Vector2.new(600, 600)
		},
		["component_assets/contactFullAvatar_small"] = {
			ImageSet = "img_set_3x_22",
			ImageRectOffset = Vector2.new(0, 0),
			ImageRectSize = Vector2.new(480, 480)
		},
		["component_assets/contactHeadshot"] = {
			ImageSet = "img_set_3x_13",
			ImageRectOffset = Vector2.new(602, 218),
			ImageRectSize = Vector2.new(300, 300)
		},
		["component_assets/dragger_small"] = {
			ImageSet = "img_set_3x_11",
			ImageRectOffset = Vector2.new(537, 922),
			ImageRectSize = Vector2.new(72, 48)
		},
		["component_assets/dropshadow_16_20"] = {
			ImageSet = "img_set_3x_5",
			ImageRectOffset = Vector2.new(686, 542),
			ImageRectSize = Vector2.new(168, 168)
		},
		["component_assets/dropshadow_17_16"] = {
			ImageSet = "img_set_3x_11",
			ImageRectOffset = Vector2.new(740, 218),
			ImageRectSize = Vector2.new(219, 219)
		},
		["component_assets/dropshadow_17_4"] = {
			ImageSet = "img_set_3x_8",
			ImageRectOffset = Vector2.new(945, 619),
			ImageRectSize = Vector2.new(75, 75)
		},
		["component_assets/dropshadow_17_8"] = {
			ImageSet = "img_set_3x_11",
			ImageRectOffset = Vector2.new(0, 922),
			ImageRectSize = Vector2.new(99, 99)
		},
		["component_assets/dropshadow_24_6"] = {
			ImageSet = "img_set_3x_12",
			ImageRectOffset = Vector2.new(919, 182),
			ImageRectSize = Vector2.new(102, 102)
		},
		["component_assets/dropshadow_25"] = {
			ImageSet = "img_set_3x_4",
			ImageRectOffset = Vector2.new(0, 906),
			ImageRectSize = Vector2.new(111, 111)
		},
		["component_assets/dropshadow_28"] = {
			ImageSet = "img_set_3x_6",
			ImageRectOffset = Vector2.new(807, 542),
			ImageRectSize = Vector2.new(144, 144)
		},
		["component_assets/dropshadow_56_8"] = {
			ImageSet = "img_set_3x_11",
			ImageRectOffset = Vector2.new(740, 439),
			ImageRectSize = Vector2.new(216, 216)
		},
		["component_assets/dropshadow_chatOff"] = {
			ImageSet = "img_set_3x_4",
			ImageRectOffset = Vector2.new(444, 906),
			ImageRectSize = Vector2.new(108, 108)
		},
		["component_assets/dropshadow_chatOn"] = {
			ImageSet = "img_set_3x_4",
			ImageRectOffset = Vector2.new(554, 906),
			ImageRectSize = Vector2.new(108, 108)
		},
		["component_assets/dropshadow_more"] = {
			ImageSet = "img_set_3x_4",
			ImageRectOffset = Vector2.new(664, 906),
			ImageRectSize = Vector2.new(108, 108)
		},
		["component_assets/dropshadow_square_4"] = {
			ImageSet = "img_set_3x_3",
			ImageRectOffset = Vector2.new(819, 652),
			ImageRectSize = Vector2.new(42, 42)
		},
		["component_assets/dropshadow_thumbnail_28"] = {
			ImageSet = "img_set_3x_3",
			ImageRectOffset = Vector2.new(686, 700),
			ImageRectSize = Vector2.new(195, 84)
		},
		["component_assets/genreBG"] = {
			ImageSet = "img_set_3x_3",
			ImageRectOffset = Vector2.new(0, 542),
			ImageRectSize = Vector2.new(720, 156)
		},
		["component_assets/halfcircleLeft_17"] = {
			ImageSet = "img_set_3x_4",
			ImageRectOffset = Vector2.new(994, 906),
			ImageRectSize = Vector2.new(24, 51)
		},
		["component_assets/halfcircleRight_17"] = {
			ImageSet = "img_set_3x_4",
			ImageRectOffset = Vector2.new(994, 959),
			ImageRectSize = Vector2.new(24, 51)
		},
		["component_assets/hexagon_12"] = {
			ImageSet = "img_set_3x_3",
			ImageRectOffset = Vector2.new(863, 652),
			ImageRectSize = Vector2.new(36, 42)
		},
		["component_assets/hexagon_24"] = {
			ImageSet = "img_set_3x_7",
			ImageRectOffset = Vector2.new(945, 542),
			ImageRectSize = Vector2.new(72, 84)
		},
		["component_assets/itemBG_dark"] = {
			ImageSet = "img_set_3x_10",
			ImageRectOffset = Vector2.new(0, 0),
			ImageRectSize = Vector2.new(900, 900)
		},
		["component_assets/itemBG_light"] = {
			ImageSet = "img_set_3x_9",
			ImageRectOffset = Vector2.new(0, 0),
			ImageRectSize = Vector2.new(900, 900)
		},
		["component_assets/profileHeaderBG"] = {
			ImageSet = "img_set_3x_13",
			ImageRectOffset = Vector2.new(602, 0),
			ImageRectSize = Vector2.new(330, 216)
		},
		["component_assets/square_7_stroke_3"] = {
			ImageSet = "img_set_3x_3",
			ImageRectOffset = Vector2.new(1000, 542),
			ImageRectSize = Vector2.new(21, 21)
		},
		["component_assets/triangleDown_16"] = {
			ImageSet = "img_set_3x_3",
			ImageRectOffset = Vector2.new(722, 652),
			ImageRectSize = Vector2.new(48, 24)
		},
		["component_assets/triangleLeft_16"] = {
			ImageSet = "img_set_3x_5",
			ImageRectOffset = Vector2.new(981, 774),
			ImageRectSize = Vector2.new(24, 48)
		},
		["component_assets/triangleRight_16"] = {
			ImageSet = "img_set_3x_5",
			ImageRectOffset = Vector2.new(981, 724),
			ImageRectSize = Vector2.new(24, 48)
		},
		["component_assets/triangleUp_16"] = {
			ImageSet = "img_set_3x_3",
			ImageRectOffset = Vector2.new(962, 504),
			ImageRectSize = Vector2.new(48, 24)
		},
		["component_assets/userBG_dark"] = {
			ImageSet = "img_set_3x_6",
			ImageRectOffset = Vector2.new(661, 724),
			ImageRectSize = Vector2.new(144, 144)
		},
		["component_assets/user_60_mask"] = {
			ImageSet = "img_set_3x_4",
			ImageRectOffset = Vector2.new(686, 724),
			ImageRectSize = Vector2.new(180, 180)
		},
		["component_assets/user_glow"] = {
			ImageSet = "img_set_3x_12",
			ImageRectOffset = Vector2.new(591, 546),
			ImageRectSize = Vector2.new(432, 288)
		},
		["component_assets/vignette_246"] = {
			ImageSet = "img_set_3x_11",
			ImageRectOffset = Vector2.new(0, 0),
			ImageRectSize = Vector2.new(738, 738)
		},
		["gradient/gradient_0_100"] = {
			ImageSet = "img_set_3x_1",
			ImageRectOffset = Vector2.new(1016, 0),
			ImageRectSize = Vector2.new(3, 120)
		},
		["icons/actions/accept"] = {
			ImageSet = "img_set_3x_4",
			ImageRectOffset = Vector2.new(774, 906),
			ImageRectSize = Vector2.new(108, 108)
		},
		["icons/actions/edit/redo"] = {
			ImageSet = "img_set_3x_4",
			ImageRectOffset = Vector2.new(884, 906),
			ImageRectSize = Vector2.new(108, 108)
		},
		["icons/actions/edit/undo"] = {
			ImageSet = "img_set_3x_6",
			ImageRectOffset = Vector2.new(0, 906),
			ImageRectSize = Vector2.new(108, 108)
		},
		["icons/actions/feedback_on"] = {
			ImageSet = "img_set_3x_6",
			ImageRectOffset = Vector2.new(110, 906),
			ImageRectSize = Vector2.new(108, 108)
		},
		["icons/brands/moments-fill"] = {
			ImageSet = "img_set_3x_8",
			ImageRectOffset = Vector2.new(945, 798),
			ImageRectSize = Vector2.new(72, 72)
		},
		["icons/brands/moments_large-fill"] = {
			ImageSet = "img_set_3x_6",
			ImageRectOffset = Vector2.new(807, 724),
			ImageRectSize = Vector2.new(144, 144)
		},
		["icons/common/gender_female"] = {
			ImageSet = "img_set_3x_6",
			ImageRectOffset = Vector2.new(220, 906),
			ImageRectSize = Vector2.new(108, 108)
		},
		["icons/common/gender_female_selected"] = {
			ImageSet = "img_set_3x_6",
			ImageRectOffset = Vector2.new(330, 906),
			ImageRectSize = Vector2.new(108, 108)
		},
		["icons/common/gender_male"] = {
			ImageSet = "img_set_3x_6",
			ImageRectOffset = Vector2.new(440, 906),
			ImageRectSize = Vector2.new(108, 108)
		},
		["icons/common/gender_male_selected"] = {
			ImageSet = "img_set_3x_6",
			ImageRectOffset = Vector2.new(550, 906),
			ImageRectSize = Vector2.new(108, 108)
		},
		["icons/common/muteNotifications"] = {
			ImageSet = "img_set_3x_4",
			ImageRectOffset = Vector2.new(113, 906),
			ImageRectSize = Vector2.new(109, 108)
		},
		["icons/controls/close-ingame"] = {
			ImageSet = "img_set_3x_6",
			ImageRectOffset = Vector2.new(660, 906),
			ImageRectSize = Vector2.new(108, 108)
		},
		["icons/controls/keys/apostrophe"] = {
			ImageSet = "img_set_3x_6",
			ImageRectOffset = Vector2.new(770, 906),
			ImageRectSize = Vector2.new(108, 108)
		},
		["icons/controls/keys/arrowDown"] = {
			ImageSet = "img_set_3x_12",
			ImageRectOffset = Vector2.new(945, 50),
			ImageRectSize = Vector2.new(48, 48)
		},
		["icons/controls/keys/arrowLeft"] = {
			ImageSet = "img_set_3x_12",
			ImageRectOffset = Vector2.new(945, 100),
			ImageRectSize = Vector2.new(48, 48)
		},
		["icons/controls/keys/arrowRight"] = {
			ImageSet = "img_set_3x_12",
			ImageRectOffset = Vector2.new(794, 307),
			ImageRectSize = Vector2.new(48, 48)
		},
		["icons/controls/keys/arrowUp"] = {
			ImageSet = "img_set_3x_12",
			ImageRectOffset = Vector2.new(844, 307),
			ImageRectSize = Vector2.new(48, 48)
		},
		["icons/controls/keys/asterisk"] = {
			ImageSet = "img_set_3x_6",
			ImageRectOffset = Vector2.new(880, 906),
			ImageRectSize = Vector2.new(108, 108)
		},
		["icons/controls/keys/backspace"] = {
			ImageSet = "img_set_3x_8",
			ImageRectOffset = Vector2.new(0, 906),
			ImageRectSize = Vector2.new(108, 108)
		},
		["icons/controls/keys/capslock"] = {
			ImageSet = "img_set_3x_8",
			ImageRectOffset = Vector2.new(110, 906),
			ImageRectSize = Vector2.new(108, 108)
		},
		["icons/controls/keys/caret"] = {
			ImageSet = "img_set_3x_8",
			ImageRectOffset = Vector2.new(220, 906),
			ImageRectSize = Vector2.new(108, 108)
		},
		["icons/controls/keys/comma"] = {
			ImageSet = "img_set_3x_8",
			ImageRectOffset = Vector2.new(330, 906),
			ImageRectSize = Vector2.new(108, 108)
		},
		["icons/controls/keys/command"] = {
			ImageSet = "img_set_3x_8",
			ImageRectOffset = Vector2.new(440, 906),
			ImageRectSize = Vector2.new(108, 108)
		},
		["icons/controls/keys/control"] = {
			ImageSet = "img_set_3x_8",
			ImageRectOffset = Vector2.new(550, 906),
			ImageRectSize = Vector2.new(108, 108)
		},
		["icons/controls/keys/dpadDown"] = {
			ImageSet = "img_set_3x_8",
			ImageRectOffset = Vector2.new(660, 906),
			ImageRectSize = Vector2.new(108, 108)
		},
		["icons/controls/keys/dpadLeft"] = {
			ImageSet = "img_set_3x_8",
			ImageRectOffset = Vector2.new(770, 906),
			ImageRectSize = Vector2.new(108, 108)
		},
		["icons/controls/keys/dpadRight"] = {
			ImageSet = "img_set_3x_8",
			ImageRectOffset = Vector2.new(880, 906),
			ImageRectSize = Vector2.new(108, 108)
		},
		["icons/controls/keys/dpadUp"] = {
			ImageSet = "img_set_3x_10",
			ImageRectOffset = Vector2.new(0, 902),
			ImageRectSize = Vector2.new(108, 108)
		},
		["icons/controls/keys/graveaccent"] = {
			ImageSet = "img_set_3x_10",
			ImageRectOffset = Vector2.new(110, 902),
			ImageRectSize = Vector2.new(108, 108)
		},
		["icons/controls/keys/hold_button_assets/hold_Pressed_Arrow"] = {
			ImageSet = "img_set_3x_11",
			ImageRectOffset = Vector2.new(451, 922),
			ImageRectSize = Vector2.new(84, 84)
		},
		["icons/controls/keys/hold_button_assets/hold_Pressed_RadialFill"] = {
			ImageSet = "img_set_3x_11",
			ImageRectOffset = Vector2.new(365, 922),
			ImageRectSize = Vector2.new(84, 84)
		},
		["icons/controls/keys/hold_button_assets/hold_Pressed_XboxA"] = {
			ImageSet = "img_set_3x_11",
			ImageRectOffset = Vector2.new(279, 922),
			ImageRectSize = Vector2.new(84, 84)
		},
		["icons/controls/keys/hold_button_assets/hold_Unpressed_Arrow"] = {
			ImageSet = "img_set_3x_11",
			ImageRectOffset = Vector2.new(653, 826),
			ImageRectSize = Vector2.new(84, 84)
		},
		["icons/controls/keys/hold_button_assets/hold_Unpressed_RadialFill"] = {
			ImageSet = "img_set_3x_11",
			ImageRectOffset = Vector2.new(653, 740),
			ImageRectSize = Vector2.new(84, 84)
		},
		["icons/controls/keys/hold_button_assets/hold_Unpressed_XboxA"] = {
			ImageSet = "img_set_3x_3",
			ImageRectOffset = Vector2.new(883, 700),
			ImageRectSize = Vector2.new(84, 84)
		},
		["icons/controls/keys/key_alt"] = {
			ImageSet = "img_set_3x_10",
			ImageRectOffset = Vector2.new(220, 902),
			ImageRectSize = Vector2.new(108, 108)
		},
		["icons/controls/keys/key_esc"] = {
			ImageSet = "img_set_3x_10",
			ImageRectOffset = Vector2.new(330, 902),
			ImageRectSize = Vector2.new(108, 108)
		},
		["icons/controls/keys/key_l"] = {
			ImageSet = "img_set_3x_10",
			ImageRectOffset = Vector2.new(440, 902),
			ImageRectSize = Vector2.new(108, 108)
		},
		["icons/controls/keys/key_r"] = {
			ImageSet = "img_set_3x_10",
			ImageRectOffset = Vector2.new(550, 902),
			ImageRectSize = Vector2.new(108, 108)
		},
		["icons/controls/keys/key_shift"] = {
			ImageSet = "img_set_3x_10",
			ImageRectOffset = Vector2.new(660, 902),
			ImageRectSize = Vector2.new(108, 108)
		},
		["icons/controls/keys/key_single"] = {
			ImageSet = "img_set_3x_10",
			ImageRectOffset = Vector2.new(770, 902),
			ImageRectSize = Vector2.new(108, 108)
		},
		["icons/controls/keys/key_wide"] = {
			ImageSet = "img_set_3x_3",
			ImageRectOffset = Vector2.new(566, 882),
			ImageRectSize = Vector2.new(192, 108)
		},
		["icons/controls/keys/key_xwide"] = {
			ImageSet = "img_set_3x_3",
			ImageRectOffset = Vector2.new(722, 542),
			ImageRectSize = Vector2.new(276, 108)
		},
		["icons/controls/keys/period"] = {
			ImageSet = "img_set_3x_10",
			ImageRectOffset = Vector2.new(902, 0),
			ImageRectSize = Vector2.new(108, 108)
		},
		["icons/controls/keys/return"] = {
			ImageSet = "img_set_3x_10",
			ImageRectOffset = Vector2.new(902, 110),
			ImageRectSize = Vector2.new(108, 108)
		},
		["icons/controls/keys/shift"] = {
			ImageSet = "img_set_3x_10",
			ImageRectOffset = Vector2.new(902, 220),
			ImageRectSize = Vector2.new(108, 108)
		},
		["icons/controls/keys/spacebar"] = {
			ImageSet = "img_set_3x_10",
			ImageRectOffset = Vector2.new(902, 330),
			ImageRectSize = Vector2.new(108, 108)
		},
		["icons/controls/keys/tab"] = {
			ImageSet = "img_set_3x_10",
			ImageRectOffset = Vector2.new(902, 440),
			ImageRectSize = Vector2.new(108, 108)
		},
		["icons/controls/keys/xboxA"] = {
			ImageSet = "img_set_3x_10",
			ImageRectOffset = Vector2.new(902, 550),
			ImageRectSize = Vector2.new(108, 108)
		},
		["icons/controls/keys/xboxB"] = {
			ImageSet = "img_set_3x_10",
			ImageRectOffset = Vector2.new(902, 660),
			ImageRectSize = Vector2.new(108, 108)
		},
		["icons/controls/keys/xboxLB"] = {
			ImageSet = "img_set_3x_10",
			ImageRectOffset = Vector2.new(902, 770),
			ImageRectSize = Vector2.new(108, 108)
		},
		["icons/controls/keys/xboxLS"] = {
			ImageSet = "img_set_3x_10",
			ImageRectOffset = Vector2.new(902, 880),
			ImageRectSize = Vector2.new(108, 108)
		},
		["icons/controls/keys/xboxLSDirectional"] = {
			ImageSet = "img_set_3x_12",
			ImageRectOffset = Vector2.new(250, 879),
			ImageRectSize = Vector2.new(108, 108)
		},
		["icons/controls/keys/xboxLSHorizontal"] = {
			ImageSet = "img_set_3x_12",
			ImageRectOffset = Vector2.new(360, 879),
			ImageRectSize = Vector2.new(108, 108)
		},
		["icons/controls/keys/xboxLSVertical"] = {
			ImageSet = "img_set_3x_12",
			ImageRectOffset = Vector2.new(470, 879),
			ImageRectSize = Vector2.new(108, 108)
		},
		["icons/controls/keys/xboxLT"] = {
			ImageSet = "img_set_3x_12",
			ImageRectOffset = Vector2.new(591, 836),
			ImageRectSize = Vector2.new(108, 108)
		},
		["icons/controls/keys/xboxRB"] = {
			ImageSet = "img_set_3x_12",
			ImageRectOffset = Vector2.new(701, 836),
			ImageRectSize = Vector2.new(108, 108)
		},
		["icons/controls/keys/xboxRS"] = {
			ImageSet = "img_set_3x_12",
			ImageRectOffset = Vector2.new(811, 836),
			ImageRectSize = Vector2.new(108, 108)
		},
		["icons/controls/keys/xboxRSDirectional"] = {
			ImageSet = "img_set_3x_14",
			ImageRectOffset = Vector2.new(869, 0),
			ImageRectSize = Vector2.new(108, 108)
		},
		["icons/controls/keys/xboxRSHorizontal"] = {
			ImageSet = "img_set_3x_14",
			ImageRectOffset = Vector2.new(869, 110),
			ImageRectSize = Vector2.new(108, 108)
		},
		["icons/controls/keys/xboxRSVertical"] = {
			ImageSet = "img_set_3x_14",
			ImageRectOffset = Vector2.new(579, 290),
			ImageRectSize = Vector2.new(108, 108)
		},
		["icons/controls/keys/xboxRT"] = {
			ImageSet = "img_set_3x_14",
			ImageRectOffset = Vector2.new(579, 400),
			ImageRectSize = Vector2.new(108, 108)
		},
		["icons/controls/keys/xboxView"] = {
			ImageSet = "img_set_3x_14",
			ImageRectOffset = Vector2.new(689, 290),
			ImageRectSize = Vector2.new(108, 108)
		},
		["icons/controls/keys/xboxX"] = {
			ImageSet = "img_set_3x_14",
			ImageRectOffset = Vector2.new(689, 400),
			ImageRectSize = Vector2.new(108, 108)
		},
		["icons/controls/keys/xboxY"] = {
			ImageSet = "img_set_3x_14",
			ImageRectOffset = Vector2.new(799, 290),
			ImageRectSize = Vector2.new(108, 108)
		},
		["icons/controls/keys/xboxmenu"] = {
			ImageSet = "img_set_3x_14",
			ImageRectOffset = Vector2.new(909, 290),
			ImageRectSize = Vector2.new(108, 108)
		},
		["icons/controls/mediaStop_small"] = {
			ImageSet = "img_set_3x_12",
			ImageRectOffset = Vector2.new(919, 286),
			ImageRectSize = Vector2.new(48, 48)
		},
		["icons/controls/vehicle/driver"] = {
			ImageSet = "img_set_3x_14",
			ImageRectOffset = Vector2.new(799, 400),
			ImageRectSize = Vector2.new(108, 108)
		},
		["icons/controls/vehicle/flip"] = {
			ImageSet = "img_set_3x_14",
			ImageRectOffset = Vector2.new(909, 400),
			ImageRectSize = Vector2.new(108, 108)
		},
		["icons/controls/vehicle/passenger"] = {
			ImageSet = "img_set_3x_14",
			ImageRectOffset = Vector2.new(0, 868),
			ImageRectSize = Vector2.new(108, 108)
		},
		["icons/controls/voice/microphone_0_dark"] = {
			ImageSet = "img_set_3x_14",
			ImageRectOffset = Vector2.new(110, 868),
			ImageRectSize = Vector2.new(108, 108)
		},
		["icons/controls/voice/microphone_0_light"] = {
			ImageSet = "img_set_3x_14",
			ImageRectOffset = Vector2.new(290, 868),
			ImageRectSize = Vector2.new(108, 108)
		},
		["icons/controls/voice/microphone_0_small_dark"] = {
			ImageSet = "img_set_3x_12",
			ImageRectOffset = Vector2.new(969, 286),
			ImageRectSize = Vector2.new(48, 48)
		},
		["icons/controls/voice/microphone_0_small_light"] = {
			ImageSet = "img_set_3x_12",
			ImageRectOffset = Vector2.new(648, 489),
			ImageRectSize = Vector2.new(48, 48)
		},
		["icons/controls/voice/microphone_100_dark"] = {
			ImageSet = "img_set_3x_14",
			ImageRectOffset = Vector2.new(400, 868),
			ImageRectSize = Vector2.new(108, 108)
		},
		["icons/controls/voice/microphone_100_light"] = {
			ImageSet = "img_set_3x_14",
			ImageRectOffset = Vector2.new(400, 868),
			ImageRectSize = Vector2.new(108, 108)
		},
		["icons/controls/voice/microphone_100_small_dark"] = {
			ImageSet = "img_set_3x_12",
			ImageRectOffset = Vector2.new(698, 489),
			ImageRectSize = Vector2.new(48, 48)
		},
		["icons/controls/voice/microphone_100_small_light"] = {
			ImageSet = "img_set_3x_12",
			ImageRectOffset = Vector2.new(698, 489),
			ImageRectSize = Vector2.new(48, 48)
		},
		["icons/controls/voice/microphone_20_dark"] = {
			ImageSet = "img_set_3x_14",
			ImageRectOffset = Vector2.new(870, 578),
			ImageRectSize = Vector2.new(108, 108)
		},
		["icons/controls/voice/microphone_20_light"] = {
			ImageSet = "img_set_3x_14",
			ImageRectOffset = Vector2.new(870, 688),
			ImageRectSize = Vector2.new(108, 108)
		},
		["icons/controls/voice/microphone_20_small_dark"] = {
			ImageSet = "img_set_3x_12",
			ImageRectOffset = Vector2.new(773, 489),
			ImageRectSize = Vector2.new(48, 48)
		},
		["icons/controls/voice/microphone_20_small_light"] = {
			ImageSet = "img_set_3x_12",
			ImageRectOffset = Vector2.new(823, 489),
			ImageRectSize = Vector2.new(48, 48)
		},
		["icons/controls/voice/microphone_40_dark"] = {
			ImageSet = "img_set_3x_14",
			ImageRectOffset = Vector2.new(580, 868),
			ImageRectSize = Vector2.new(108, 108)
		},
		["icons/controls/voice/microphone_40_light"] = {
			ImageSet = "img_set_3x_14",
			ImageRectOffset = Vector2.new(690, 868),
			ImageRectSize = Vector2.new(108, 108)
		},
		["icons/controls/voice/microphone_40_small_dark"] = {
			ImageSet = "img_set_3x_12",
			ImageRectOffset = Vector2.new(898, 489),
			ImageRectSize = Vector2.new(48, 48)
		},
		["icons/controls/voice/microphone_40_small_light"] = {
			ImageSet = "img_set_3x_12",
			ImageRectOffset = Vector2.new(948, 489),
			ImageRectSize = Vector2.new(48, 48)
		},
		["icons/controls/voice/microphone_60_dark"] = {
			ImageSet = "img_set_3x_14",
			ImageRectOffset = Vector2.new(800, 868),
			ImageRectSize = Vector2.new(108, 108)
		},
		["icons/controls/voice/microphone_60_light"] = {
			ImageSet = "img_set_3x_14",
			ImageRectOffset = Vector2.new(910, 868),
			ImageRectSize = Vector2.new(108, 108)
		},
		["icons/controls/voice/microphone_60_small_dark"] = {
			ImageSet = "img_set_3x_12",
			ImageRectOffset = Vector2.new(591, 946),
			ImageRectSize = Vector2.new(48, 48)
		},
		["icons/controls/voice/microphone_60_small_light"] = {
			ImageSet = "img_set_3x_12",
			ImageRectOffset = Vector2.new(641, 946),
			ImageRectSize = Vector2.new(48, 48)
		},
		["icons/controls/voice/microphone_80_dark"] = {
			ImageSet = "img_set_3x_16",
			ImageRectOffset = Vector2.new(579, 0),
			ImageRectSize = Vector2.new(108, 108)
		},
		["icons/controls/voice/microphone_80_light"] = {
			ImageSet = "img_set_3x_16",
			ImageRectOffset = Vector2.new(689, 0),
			ImageRectSize = Vector2.new(108, 108)
		},
		["icons/controls/voice/microphone_80_small_dark"] = {
			ImageSet = "img_set_3x_12",
			ImageRectOffset = Vector2.new(701, 946),
			ImageRectSize = Vector2.new(48, 48)
		},
		["icons/controls/voice/microphone_80_small_light"] = {
			ImageSet = "img_set_3x_12",
			ImageRectOffset = Vector2.new(751, 946),
			ImageRectSize = Vector2.new(48, 48)
		},
		["icons/controls/voice/microphone_error_dark"] = {
			ImageSet = "img_set_3x_16",
			ImageRectOffset = Vector2.new(799, 0),
			ImageRectSize = Vector2.new(108, 108)
		},
		["icons/controls/voice/microphone_error_light"] = {
			ImageSet = "img_set_3x_16",
			ImageRectOffset = Vector2.new(909, 0),
			ImageRectSize = Vector2.new(108, 108)
		},
		["icons/controls/voice/microphone_error_small_dark"] = {
			ImageSet = "img_set_3x_12",
			ImageRectOffset = Vector2.new(811, 946),
			ImageRectSize = Vector2.new(48, 48)
		},
		["icons/controls/voice/microphone_error_small_light"] = {
			ImageSet = "img_set_3x_12",
			ImageRectOffset = Vector2.new(861, 946),
			ImageRectSize = Vector2.new(48, 48)
		},
		["icons/controls/voice/microphone_off_dark"] = {
			ImageSet = "img_set_3x_16",
			ImageRectOffset = Vector2.new(579, 110),
			ImageRectSize = Vector2.new(108, 108)
		},
		["icons/controls/voice/microphone_off_light"] = {
			ImageSet = "img_set_3x_16",
			ImageRectOffset = Vector2.new(689, 110),
			ImageRectSize = Vector2.new(108, 108)
		},
		["icons/controls/voice/microphone_off_small_dark"] = {
			ImageSet = "img_set_3x_6",
			ImageRectOffset = Vector2.new(953, 854),
			ImageRectSize = Vector2.new(49, 49)
		},
		["icons/controls/voice/microphone_off_small_light"] = {
			ImageSet = "img_set_3x_8",
			ImageRectOffset = Vector2.new(962, 371),
			ImageRectSize = Vector2.new(49, 49)
		},
		["icons/controls/voice/microphone_on_dark"] = {
			ImageSet = "img_set_3x_14",
			ImageRectOffset = Vector2.new(110, 868),
			ImageRectSize = Vector2.new(108, 108)
		},
		["icons/controls/voice/microphone_on_light"] = {
			ImageSet = "img_set_3x_14",
			ImageRectOffset = Vector2.new(290, 868),
			ImageRectSize = Vector2.new(108, 108)
		},
		["icons/controls/voice/microphone_on_small_dark"] = {
			ImageSet = "img_set_3x_12",
			ImageRectOffset = Vector2.new(969, 286),
			ImageRectSize = Vector2.new(48, 48)
		},
		["icons/controls/voice/microphone_on_small_light"] = {
			ImageSet = "img_set_3x_12",
			ImageRectOffset = Vector2.new(648, 489),
			ImageRectSize = Vector2.new(48, 48)
		},
		["icons/controls/voice/red_speaker_0_dark"] = {
			ImageSet = "img_set_3x_16",
			ImageRectOffset = Vector2.new(799, 110),
			ImageRectSize = Vector2.new(108, 108)
		},
		["icons/controls/voice/red_speaker_0_light"] = {
			ImageSet = "img_set_3x_16",
			ImageRectOffset = Vector2.new(909, 110),
			ImageRectSize = Vector2.new(108, 108)
		},
		["icons/controls/voice/red_speaker_0_small_dark"] = {
			ImageSet = "img_set_3x_12",
			ImageRectOffset = Vector2.new(921, 836),
			ImageRectSize = Vector2.new(48, 48)
		},
		["icons/controls/voice/red_speaker_0_small_light"] = {
			ImageSet = "img_set_3x_12",
			ImageRectOffset = Vector2.new(971, 836),
			ImageRectSize = Vector2.new(48, 48)
		},
		["icons/controls/voice/red_speaker_100_dark"] = {
			ImageSet = "img_set_3x_16",
			ImageRectOffset = Vector2.new(579, 220),
			ImageRectSize = Vector2.new(108, 108)
		},
		["icons/controls/voice/red_speaker_100_light"] = {
			ImageSet = "img_set_3x_16",
			ImageRectOffset = Vector2.new(579, 220),
			ImageRectSize = Vector2.new(108, 108)
		},
		["icons/controls/voice/red_speaker_100_small_dark"] = {
			ImageSet = "img_set_3x_12",
			ImageRectOffset = Vector2.new(921, 886),
			ImageRectSize = Vector2.new(48, 48)
		},
		["icons/controls/voice/red_speaker_100_small_light"] = {
			ImageSet = "img_set_3x_12",
			ImageRectOffset = Vector2.new(921, 886),
			ImageRectSize = Vector2.new(48, 48)
		},
		["icons/controls/voice/red_speaker_20_dark"] = {
			ImageSet = "img_set_3x_16",
			ImageRectOffset = Vector2.new(579, 330),
			ImageRectSize = Vector2.new(108, 108)
		},
		["icons/controls/voice/red_speaker_20_light"] = {
			ImageSet = "img_set_3x_16",
			ImageRectOffset = Vector2.new(579, 440),
			ImageRectSize = Vector2.new(108, 108)
		},
		["icons/controls/voice/red_speaker_20_small_dark"] = {
			ImageSet = "img_set_3x_12",
			ImageRectOffset = Vector2.new(971, 886),
			ImageRectSize = Vector2.new(48, 48)
		},
		["icons/controls/voice/red_speaker_20_small_light"] = {
			ImageSet = "img_set_3x_12",
			ImageRectOffset = Vector2.new(921, 936),
			ImageRectSize = Vector2.new(48, 48)
		},
		["icons/controls/voice/red_speaker_40_dark"] = {
			ImageSet = "img_set_3x_15",
			ImageRectOffset = Vector2.new(910, 868),
			ImageRectSize = Vector2.new(108, 108)
		},
		["icons/controls/voice/red_speaker_40_light"] = {
			ImageSet = "img_set_3x_15",
			ImageRectOffset = Vector2.new(800, 868),
			ImageRectSize = Vector2.new(108, 108)
		},
		["icons/controls/voice/red_speaker_40_small_dark"] = {
			ImageSet = "img_set_3x_12",
			ImageRectOffset = Vector2.new(971, 936),
			ImageRectSize = Vector2.new(48, 48)
		},
		["icons/controls/voice/red_speaker_40_small_light"] = {
			ImageSet = "img_set_3x_13",
			ImageRectOffset = Vector2.new(892, 740),
			ImageRectSize = Vector2.new(48, 48)
		},
		["icons/controls/voice/red_speaker_60_dark"] = {
			ImageSet = "img_set_3x_15",
			ImageRectOffset = Vector2.new(690, 868),
			ImageRectSize = Vector2.new(108, 108)
		},
		["icons/controls/voice/red_speaker_60_light"] = {
			ImageSet = "img_set_3x_15",
			ImageRectOffset = Vector2.new(580, 868),
			ImageRectSize = Vector2.new(108, 108)
		},
		["icons/controls/voice/red_speaker_60_small_dark"] = {
			ImageSet = "img_set_3x_13",
			ImageRectOffset = Vector2.new(954, 438),
			ImageRectSize = Vector2.new(48, 48)
		},
		["icons/controls/voice/red_speaker_60_small_light"] = {
			ImageSet = "img_set_3x_13",
			ImageRectOffset = Vector2.new(904, 438),
			ImageRectSize = Vector2.new(48, 48)
		},
		["icons/controls/voice/red_speaker_80_dark"] = {
			ImageSet = "img_set_3x_15",
			ImageRectOffset = Vector2.new(870, 688),
			ImageRectSize = Vector2.new(108, 108)
		},
		["icons/controls/voice/red_speaker_80_light"] = {
			ImageSet = "img_set_3x_15",
			ImageRectOffset = Vector2.new(870, 578),
			ImageRectSize = Vector2.new(108, 108)
		},
		["icons/controls/voice/red_speaker_80_small_dark"] = {
			ImageSet = "img_set_3x_13",
			ImageRectOffset = Vector2.new(934, 150),
			ImageRectSize = Vector2.new(48, 48)
		},
		["icons/controls/voice/red_speaker_80_small_light"] = {
			ImageSet = "img_set_3x_13",
			ImageRectOffset = Vector2.new(934, 100),
			ImageRectSize = Vector2.new(48, 48)
		},
		["icons/controls/voice/speaker_0_dark"] = {
			ImageSet = "img_set_3x_16",
			ImageRectOffset = Vector2.new(799, 110),
			ImageRectSize = Vector2.new(108, 108)
		},
		["icons/controls/voice/speaker_0_light"] = {
			ImageSet = "img_set_3x_15",
			ImageRectOffset = Vector2.new(400, 868),
			ImageRectSize = Vector2.new(108, 108)
		},
		["icons/controls/voice/speaker_0_small_dark"] = {
			ImageSet = "img_set_3x_13",
			ImageRectOffset = Vector2.new(934, 50),
			ImageRectSize = Vector2.new(48, 48)
		},
		["icons/controls/voice/speaker_0_small_light"] = {
			ImageSet = "img_set_3x_13",
			ImageRectOffset = Vector2.new(934, 0),
			ImageRectSize = Vector2.new(48, 48)
		},
		["icons/controls/voice/speaker_100_dark"] = {
			ImageSet = "img_set_3x_15",
			ImageRectOffset = Vector2.new(290, 868),
			ImageRectSize = Vector2.new(108, 108)
		},
		["icons/controls/voice/speaker_100_light"] = {
			ImageSet = "img_set_3x_15",
			ImageRectOffset = Vector2.new(290, 868),
			ImageRectSize = Vector2.new(108, 108)
		},
		["icons/controls/voice/speaker_100_small_dark"] = {
			ImageSet = "img_set_3x_13",
			ImageRectOffset = Vector2.new(550, 935),
			ImageRectSize = Vector2.new(48, 48)
		},
		["icons/controls/voice/speaker_100_small_light"] = {
			ImageSet = "img_set_3x_13",
			ImageRectOffset = Vector2.new(550, 935),
			ImageRectSize = Vector2.new(48, 48)
		},
		["icons/controls/voice/speaker_20_dark"] = {
			ImageSet = "img_set_3x_15",
			ImageRectOffset = Vector2.new(110, 868),
			ImageRectSize = Vector2.new(108, 108)
		},
		["icons/controls/voice/speaker_20_light"] = {
			ImageSet = "img_set_3x_15",
			ImageRectOffset = Vector2.new(0, 868),
			ImageRectSize = Vector2.new(108, 108)
		},
		["icons/controls/voice/speaker_20_small_dark"] = {
			ImageSet = "img_set_3x_13",
			ImageRectOffset = Vector2.new(500, 935),
			ImageRectSize = Vector2.new(48, 48)
		},
		["icons/controls/voice/speaker_20_small_light"] = {
			ImageSet = "img_set_3x_13",
			ImageRectOffset = Vector2.new(450, 935),
			ImageRectSize = Vector2.new(48, 48)
		},
		["icons/controls/voice/speaker_40_dark"] = {
			ImageSet = "img_set_3x_15",
			ImageRectOffset = Vector2.new(909, 400),
			ImageRectSize = Vector2.new(108, 108)
		},
		["icons/controls/voice/speaker_40_light"] = {
			ImageSet = "img_set_3x_15",
			ImageRectOffset = Vector2.new(799, 400),
			ImageRectSize = Vector2.new(108, 108)
		},
		["icons/controls/voice/speaker_40_small_dark"] = {
			ImageSet = "img_set_3x_13",
			ImageRectOffset = Vector2.new(400, 935),
			ImageRectSize = Vector2.new(48, 48)
		},
		["icons/controls/voice/speaker_40_small_light"] = {
			ImageSet = "img_set_3x_13",
			ImageRectOffset = Vector2.new(350, 935),
			ImageRectSize = Vector2.new(48, 48)
		},
		["icons/controls/voice/speaker_60_dark"] = {
			ImageSet = "img_set_3x_15",
			ImageRectOffset = Vector2.new(909, 290),
			ImageRectSize = Vector2.new(108, 108)
		},
		["icons/controls/voice/speaker_60_light"] = {
			ImageSet = "img_set_3x_15",
			ImageRectOffset = Vector2.new(799, 290),
			ImageRectSize = Vector2.new(108, 108)
		},
		["icons/controls/voice/speaker_60_small_dark"] = {
			ImageSet = "img_set_3x_13",
			ImageRectOffset = Vector2.new(300, 935),
			ImageRectSize = Vector2.new(48, 48)
		},
		["icons/controls/voice/speaker_60_small_light"] = {
			ImageSet = "img_set_3x_13",
			ImageRectOffset = Vector2.new(250, 935),
			ImageRectSize = Vector2.new(48, 48)
		},
		["icons/controls/voice/speaker_80_dark"] = {
			ImageSet = "img_set_3x_15",
			ImageRectOffset = Vector2.new(689, 400),
			ImageRectSize = Vector2.new(108, 108)
		},
		["icons/controls/voice/speaker_80_light"] = {
			ImageSet = "img_set_3x_15",
			ImageRectOffset = Vector2.new(689, 290),
			ImageRectSize = Vector2.new(108, 108)
		},
		["icons/controls/voice/speaker_80_small_dark"] = {
			ImageSet = "img_set_3x_13",
			ImageRectOffset = Vector2.new(200, 935),
			ImageRectSize = Vector2.new(48, 48)
		},
		["icons/controls/voice/speaker_80_small_light"] = {
			ImageSet = "img_set_3x_13",
			ImageRectOffset = Vector2.new(150, 935),
			ImageRectSize = Vector2.new(48, 48)
		},
		["icons/controls/voice/speaker_error_dark"] = {
			ImageSet = "img_set_3x_15",
			ImageRectOffset = Vector2.new(579, 400),
			ImageRectSize = Vector2.new(108, 108)
		},
		["icons/controls/voice/speaker_error_light"] = {
			ImageSet = "img_set_3x_15",
			ImageRectOffset = Vector2.new(579, 290),
			ImageRectSize = Vector2.new(108, 108)
		},
		["icons/controls/voice/speaker_error_small_dark"] = {
			ImageSet = "img_set_3x_13",
			ImageRectOffset = Vector2.new(100, 935),
			ImageRectSize = Vector2.new(48, 48)
		},
		["icons/controls/voice/speaker_error_small_light"] = {
			ImageSet = "img_set_3x_13",
			ImageRectOffset = Vector2.new(50, 935),
			ImageRectSize = Vector2.new(48, 48)
		},
		["icons/controls/voice/speaker_off_dark"] = {
			ImageSet = "img_set_3x_15",
			ImageRectOffset = Vector2.new(869, 110),
			ImageRectSize = Vector2.new(108, 108)
		},
		["icons/controls/voice/speaker_off_light"] = {
			ImageSet = "img_set_3x_15",
			ImageRectOffset = Vector2.new(869, 0),
			ImageRectSize = Vector2.new(108, 108)
		},
		["icons/controls/voice/speaker_off_small_dark"] = {
			ImageSet = "img_set_3x_13",
			ImageRectOffset = Vector2.new(0, 935),
			ImageRectSize = Vector2.new(48, 48)
		},
		["icons/controls/voice/speaker_off_small_light"] = {
			ImageSet = "img_set_3x_11",
			ImageRectOffset = Vector2.new(949, 807),
			ImageRectSize = Vector2.new(48, 48)
		},
		["icons/controls/voice/speaker_on_dark"] = {
			ImageSet = "img_set_3x_16",
			ImageRectOffset = Vector2.new(799, 110),
			ImageRectSize = Vector2.new(108, 108)
		},
		["icons/controls/voice/speaker_on_light"] = {
			ImageSet = "img_set_3x_15",
			ImageRectOffset = Vector2.new(400, 868),
			ImageRectSize = Vector2.new(108, 108)
		},
		["icons/controls/voice/speaker_on_small_dark"] = {
			ImageSet = "img_set_3x_13",
			ImageRectOffset = Vector2.new(934, 50),
			ImageRectSize = Vector2.new(48, 48)
		},
		["icons/controls/voice/speaker_on_small_light"] = {
			ImageSet = "img_set_3x_13",
			ImageRectOffset = Vector2.new(934, 0),
			ImageRectSize = Vector2.new(48, 48)
		},
		["icons/controls/voice/video_error_dark"] = {
			ImageSet = "img_set_3x_13",
			ImageRectOffset = Vector2.new(808, 810),
			ImageRectSize = Vector2.new(108, 108)
		},
		["icons/controls/voice/video_error_light"] = {
			ImageSet = "img_set_3x_13",
			ImageRectOffset = Vector2.new(892, 630),
			ImageRectSize = Vector2.new(108, 108)
		},
		["icons/controls/voice/video_error_small_dark"] = {
			ImageSet = "img_set_3x_11",
			ImageRectOffset = Vector2.new(949, 757),
			ImageRectSize = Vector2.new(48, 48)
		},
		["icons/controls/voice/video_error_small_light"] = {
			ImageSet = "img_set_3x_11",
			ImageRectOffset = Vector2.new(949, 707),
			ImageRectSize = Vector2.new(48, 48)
		},
		["icons/controls/voice/video_off_dark"] = {
			ImageSet = "img_set_3x_13",
			ImageRectOffset = Vector2.new(892, 520),
			ImageRectSize = Vector2.new(108, 108)
		},
		["icons/controls/voice/video_off_light"] = {
			ImageSet = "img_set_3x_13",
			ImageRectOffset = Vector2.new(904, 328),
			ImageRectSize = Vector2.new(108, 108)
		},
		["icons/controls/voice/video_off_small_dark"] = {
			ImageSet = "img_set_3x_8",
			ImageRectOffset = Vector2.new(962, 422),
			ImageRectSize = Vector2.new(49, 49)
		},
		["icons/controls/voice/video_off_small_light"] = {
			ImageSet = "img_set_3x_8",
			ImageRectOffset = Vector2.new(962, 473),
			ImageRectSize = Vector2.new(49, 49)
		},
		["icons/controls/voice/video_on_dark"] = {
			ImageSet = "img_set_3x_13",
			ImageRectOffset = Vector2.new(904, 218),
			ImageRectSize = Vector2.new(108, 108)
		},
		["icons/controls/voice/video_on_light"] = {
			ImageSet = "img_set_3x_9",
			ImageRectOffset = Vector2.new(902, 880),
			ImageRectSize = Vector2.new(108, 108)
		},
		["icons/controls/voice/video_on_small_dark"] = {
			ImageSet = "img_set_3x_11",
			ImageRectOffset = Vector2.new(949, 657),
			ImageRectSize = Vector2.new(48, 48)
		},
		["icons/controls/voice/video_on_small_light"] = {
			ImageSet = "img_set_3x_11",
			ImageRectOffset = Vector2.new(958, 589),
			ImageRectSize = Vector2.new(48, 48)
		},
		["icons/graphic/blocktheft_2xl"] = {
			ImageSet = "img_set_3x_14",
			ImageRectOffset = Vector2.new(579, 0),
			ImageRectSize = Vector2.new(288, 288)
		},
		["icons/graphic/camera_on_off"] = {
			ImageSet = "img_set_3x_3",
			ImageRectOffset = Vector2.new(760, 882),
			ImageRectSize = Vector2.new(131, 130)
		},
		["icons/graphic/clothes_category_art_dark"] = {
			ImageSet = "img_set_3x_4",
			ImageRectOffset = Vector2.new(0, 0),
			ImageRectSize = Vector2.new(960, 540)
		},
		["icons/graphic/clothes_category_art_light"] = {
			ImageSet = "img_set_3x_6",
			ImageRectOffset = Vector2.new(0, 0),
			ImageRectSize = Vector2.new(960, 540)
		},
		["icons/graphic/connectcontacts_xlarge"] = {
			ImageSet = "img_set_3x_14",
			ImageRectOffset = Vector2.new(0, 578),
			ImageRectSize = Vector2.new(288, 288)
		},
		["icons/graphic/connectdevices_2xl"] = {
			ImageSet = "img_set_3x_14",
			ImageRectOffset = Vector2.new(290, 578),
			ImageRectSize = Vector2.new(288, 288)
		},
		["icons/graphic/devices_xxlarge"] = {
			ImageSet = "img_set_3x_18",
			ImageRectOffset = Vector2.new(0, 0),
			ImageRectSize = Vector2.new(576, 576)
		},
		["icons/graphic/envelope_dark"] = {
			ImageSet = "img_set_3x_8",
			ImageRectOffset = Vector2.new(0, 0),
			ImageRectSize = Vector2.new(960, 540)
		},
		["icons/graphic/envelope_light"] = {
			ImageSet = "img_set_3x_7",
			ImageRectOffset = Vector2.new(0, 0),
			ImageRectSize = Vector2.new(960, 540)
		},
		["icons/graphic/error_xlarge"] = {
			ImageSet = "img_set_3x_14",
			ImageRectOffset = Vector2.new(580, 578),
			ImageRectSize = Vector2.new(288, 288)
		},
		["icons/graphic/findfriends_xlarge"] = {
			ImageSet = "img_set_3x_15",
			ImageRectOffset = Vector2.new(580, 578),
			ImageRectSize = Vector2.new(288, 288)
		},
		["icons/graphic/gamesanditems_2xl"] = {
			ImageSet = "img_set_3x_15",
			ImageRectOffset = Vector2.new(290, 578),
			ImageRectSize = Vector2.new(288, 288)
		},
		["icons/graphic/loadingspinner"] = {
			ImageSet = "img_set_3x_8",
			ImageRectOffset = Vector2.new(653, 542),
			ImageRectSize = Vector2.new(144, 144)
		},
		["icons/graphic/newclothing_3xl"] = {
			ImageSet = "img_set_3x_20",
			ImageRectOffset = Vector2.new(0, 0),
			ImageRectSize = Vector2.new(576, 576)
		},
		["icons/graphic/newclothing_xlarge"] = {
			ImageSet = "img_set_3x_15",
			ImageRectOffset = Vector2.new(0, 578),
			ImageRectSize = Vector2.new(288, 288)
		},
		["icons/graphic/passkey_upsell_dark"] = {
			ImageSet = "img_set_3x_12",
			ImageRectOffset = Vector2.new(0, 546),
			ImageRectSize = Vector2.new(589, 331)
		},
		["icons/graphic/passkey_upsell_light"] = {
			ImageSet = "img_set_3x_13",
			ImageRectOffset = Vector2.new(0, 602),
			ImageRectSize = Vector2.new(589, 331)
		},
		["icons/graphic/robuxcoin1_xxlarge"] = {
			ImageSet = "img_set_3x_14",
			ImageRectOffset = Vector2.new(0, 0),
			ImageRectSize = Vector2.new(577, 576)
		},
		["icons/graphic/robuxcoin2_xxlarge"] = {
			ImageSet = "img_set_3x_16",
			ImageRectOffset = Vector2.new(0, 0),
			ImageRectSize = Vector2.new(577, 576)
		},
		["icons/graphic/robuxcoin3_xxlarge"] = {
			ImageSet = "img_set_3x_17",
			ImageRectOffset = Vector2.new(0, 0),
			ImageRectSize = Vector2.new(577, 576)
		},
		["icons/graphic/robuxcoin4_xxlarge"] = {
			ImageSet = "img_set_3x_21",
			ImageRectOffset = Vector2.new(0, 0),
			ImageRectSize = Vector2.new(576, 570)
		},
		["icons/graphic/robuxcoin5_xxlarge"] = {
			ImageSet = "img_set_3x_19",
			ImageRectOffset = Vector2.new(0, 0),
			ImageRectSize = Vector2.new(576, 576)
		},
		["icons/graphic/robuxcoin6_xxlarge"] = {
			ImageSet = "img_set_3x_15",
			ImageRectOffset = Vector2.new(0, 0),
			ImageRectSize = Vector2.new(577, 576)
		},
		["icons/graphic/success_xlarge"] = {
			ImageSet = "img_set_3x_15",
			ImageRectOffset = Vector2.new(579, 0),
			ImageRectSize = Vector2.new(288, 288)
		},
		["icons/graphic/verifyCode_dark"] = {
			ImageSet = "img_set_3x_5",
			ImageRectOffset = Vector2.new(0, 0),
			ImageRectSize = Vector2.new(960, 540)
		},
		["icons/graphic/verifyCode_light"] = {
			ImageSet = "img_set_3x_3",
			ImageRectOffset = Vector2.new(0, 0),
			ImageRectSize = Vector2.new(960, 540)
		},
		["icons/graphic/voicechat_large"] = {
			ImageSet = "img_set_3x_8",
			ImageRectOffset = Vector2.new(799, 542),
			ImageRectSize = Vector2.new(144, 144)
		},
		["icons/logo/letterform"] = {
			ImageSet = "img_set_3x_3",
			ImageRectOffset = Vector2.new(0, 882),
			ImageRectSize = Vector2.new(564, 108)
		},
		["icons/logo/letterform_classic"] = {
			ImageSet = "img_set_3x_4",
			ImageRectOffset = Vector2.new(0, 542),
			ImageRectSize = Vector2.new(684, 180)
		},
		["icons/logo/letterform_dark"] = {
			ImageSet = "img_set_3x_8",
			ImageRectOffset = Vector2.new(0, 542),
			ImageRectSize = Vector2.new(651, 180)
		},
		["icons/logo/letterform_dark_01"] = {
			ImageSet = "img_set_3x_8",
			ImageRectOffset = Vector2.new(0, 724),
			ImageRectSize = Vector2.new(651, 180)
		},
		["icons/logo/letterform_dark_02"] = {
			ImageSet = "img_set_3x_6",
			ImageRectOffset = Vector2.new(0, 542),
			ImageRectSize = Vector2.new(659, 180)
		},
		["icons/logo/letterform_dark_03"] = {
			ImageSet = "img_set_3x_4",
			ImageRectOffset = Vector2.new(0, 724),
			ImageRectSize = Vector2.new(684, 180)
		},
		["icons/logo/letterform_dark_04"] = {
			ImageSet = "img_set_3x_5",
			ImageRectOffset = Vector2.new(0, 724),
			ImageRectSize = Vector2.new(684, 180)
		},
		["icons/logo/letterform_dark_05"] = {
			ImageSet = "img_set_3x_12",
			ImageRectOffset = Vector2.new(0, 182),
			ImageRectSize = Vector2.new(646, 180)
		},
		["icons/logo/letterform_dark_06"] = {
			ImageSet = "img_set_3x_4",
			ImageRectOffset = Vector2.new(0, 542),
			ImageRectSize = Vector2.new(684, 180)
		},
		["icons/logo/letterform_dark_hat"] = {
			ImageSet = "img_set_3x_12",
			ImageRectOffset = Vector2.new(0, 0),
			ImageRectSize = Vector2.new(651, 180)
		},
		["icons/logo/letterform_light"] = {
			ImageSet = "img_set_3x_11",
			ImageRectOffset = Vector2.new(0, 740),
			ImageRectSize = Vector2.new(651, 180)
		},
		["icons/logo/letterform_light_01"] = {
			ImageSet = "img_set_3x_7",
			ImageRectOffset = Vector2.new(0, 724),
			ImageRectSize = Vector2.new(651, 180)
		},
		["icons/logo/letterform_light_02"] = {
			ImageSet = "img_set_3x_6",
			ImageRectOffset = Vector2.new(0, 724),
			ImageRectSize = Vector2.new(659, 180)
		},
		["icons/logo/letterform_light_03"] = {
			ImageSet = "img_set_3x_5",
			ImageRectOffset = Vector2.new(0, 542),
			ImageRectSize = Vector2.new(684, 180)
		},
		["icons/logo/letterform_light_04"] = {
			ImageSet = "img_set_3x_3",
			ImageRectOffset = Vector2.new(0, 700),
			ImageRectSize = Vector2.new(684, 180)
		},
		["icons/logo/letterform_light_05"] = {
			ImageSet = "img_set_3x_12",
			ImageRectOffset = Vector2.new(0, 364),
			ImageRectSize = Vector2.new(646, 180)
		},
		["icons/logo/letterform_light_06"] = {
			ImageSet = "img_set_3x_4",
			ImageRectOffset = Vector2.new(0, 542),
			ImageRectSize = Vector2.new(684, 180)
		},
		["icons/logo/letterform_light_hat"] = {
			ImageSet = "img_set_3x_7",
			ImageRectOffset = Vector2.new(0, 542),
			ImageRectSize = Vector2.new(651, 180)
		},
		["icons/logo/studiologo"] = {
			ImageSet = "img_set_3x_9",
			ImageRectOffset = Vector2.new(902, 770),
			ImageRectSize = Vector2.new(108, 108)
		},
		["icons/logo/studiologo_small"] = {
			ImageSet = "img_set_3x_11",
			ImageRectOffset = Vector2.new(958, 539),
			ImageRectSize = Vector2.new(48, 48)
		},
		["icons/menu/2-person-with-bubble"] = {
			ImageSet = "img_set_3x_9",
			ImageRectOffset = Vector2.new(902, 550),
			ImageRectSize = Vector2.new(108, 108)
		},
		["icons/menu/2-person-with-bubble-on"] = {
			ImageSet = "img_set_3x_9",
			ImageRectOffset = Vector2.new(902, 660),
			ImageRectSize = Vector2.new(108, 108)
		},
		["icons/menu/AR_cube"] = {
			ImageSet = "img_set_3x_9",
			ImageRectOffset = Vector2.new(902, 440),
			ImageRectSize = Vector2.new(108, 108)
		},
		["icons/menu/AR_frame"] = {
			ImageSet = "img_set_3x_9",
			ImageRectOffset = Vector2.new(902, 330),
			ImageRectSize = Vector2.new(108, 108)
		},
		["icons/menu/adjust/position_small"] = {
			ImageSet = "img_set_3x_11",
			ImageRectOffset = Vector2.new(958, 489),
			ImageRectSize = Vector2.new(48, 48)
		},
		["icons/menu/adjust/rotationZ"] = {
			ImageSet = "img_set_3x_9",
			ImageRectOffset = Vector2.new(902, 220),
			ImageRectSize = Vector2.new(108, 108)
		},
		["icons/menu/avatar_off"] = {
			ImageSet = "img_set_3x_9",
			ImageRectOffset = Vector2.new(902, 110),
			ImageRectSize = Vector2.new(108, 108)
		},
		["icons/menu/avatar_on"] = {
			ImageSet = "img_set_3x_9",
			ImageRectOffset = Vector2.new(902, 0),
			ImageRectSize = Vector2.new(108, 108)
		},
		["icons/menu/body_female"] = {
			ImageSet = "img_set_3x_9",
			ImageRectOffset = Vector2.new(770, 902),
			ImageRectSize = Vector2.new(108, 108)
		},
		["icons/menu/body_heavy"] = {
			ImageSet = "img_set_3x_9",
			ImageRectOffset = Vector2.new(660, 902),
			ImageRectSize = Vector2.new(108, 108)
		},
		["icons/menu/body_male"] = {
			ImageSet = "img_set_3x_9",
			ImageRectOffset = Vector2.new(550, 902),
			ImageRectSize = Vector2.new(108, 108)
		},
		["icons/menu/body_neutral"] = {
			ImageSet = "img_set_3x_9",
			ImageRectOffset = Vector2.new(440, 902),
			ImageRectSize = Vector2.new(108, 108)
		},
		["icons/menu/body_short"] = {
			ImageSet = "img_set_3x_9",
			ImageRectOffset = Vector2.new(330, 902),
			ImageRectSize = Vector2.new(108, 108)
		},
		["icons/menu/body_tall"] = {
			ImageSet = "img_set_3x_9",
			ImageRectOffset = Vector2.new(220, 902),
			ImageRectSize = Vector2.new(108, 108)
		},
		["icons/menu/body_thin"] = {
			ImageSet = "img_set_3x_9",
			ImageRectOffset = Vector2.new(110, 902),
			ImageRectSize = Vector2.new(108, 108)
		},
		["icons/menu/clothing/accessories_on"] = {
			ImageSet = "img_set_3x_4",
			ImageRectOffset = Vector2.new(962, 0),
			ImageRectSize = Vector2.new(54, 54)
		},
		["icons/menu/clothing/animation_off"] = {
			ImageSet = "img_set_3x_4",
			ImageRectOffset = Vector2.new(962, 56),
			ImageRectSize = Vector2.new(54, 54)
		},
		["icons/menu/clothing/animation_on"] = {
			ImageSet = "img_set_3x_4",
			ImageRectOffset = Vector2.new(962, 112),
			ImageRectSize = Vector2.new(54, 54)
		},
		["icons/menu/clothing/back_on"] = {
			ImageSet = "img_set_3x_4",
			ImageRectOffset = Vector2.new(962, 168),
			ImageRectSize = Vector2.new(54, 54)
		},
		["icons/menu/clothing/body_off"] = {
			ImageSet = "img_set_3x_4",
			ImageRectOffset = Vector2.new(962, 224),
			ImageRectSize = Vector2.new(54, 54)
		},
		["icons/menu/clothing/body_on"] = {
			ImageSet = "img_set_3x_4",
			ImageRectOffset = Vector2.new(962, 280),
			ImageRectSize = Vector2.new(54, 54)
		},
		["icons/menu/clothing/build_off"] = {
			ImageSet = "img_set_3x_4",
			ImageRectOffset = Vector2.new(962, 336),
			ImageRectSize = Vector2.new(54, 54)
		},
		["icons/menu/clothing/build_on"] = {
			ImageSet = "img_set_3x_4",
			ImageRectOffset = Vector2.new(962, 392),
			ImageRectSize = Vector2.new(54, 54)
		},
		["icons/menu/clothing/characters_on"] = {
			ImageSet = "img_set_3x_4",
			ImageRectOffset = Vector2.new(962, 448),
			ImageRectSize = Vector2.new(54, 54)
		},
		["icons/menu/clothing/climb_off"] = {
			ImageSet = "img_set_3x_6",
			ImageRectOffset = Vector2.new(962, 0),
			ImageRectSize = Vector2.new(54, 54)
		},
		["icons/menu/clothing/climb_on"] = {
			ImageSet = "img_set_3x_6",
			ImageRectOffset = Vector2.new(962, 56),
			ImageRectSize = Vector2.new(54, 54)
		},
		["icons/menu/clothing/creations_off"] = {
			ImageSet = "img_set_3x_6",
			ImageRectOffset = Vector2.new(962, 112),
			ImageRectSize = Vector2.new(54, 54)
		},
		["icons/menu/clothing/creations_on"] = {
			ImageSet = "img_set_3x_6",
			ImageRectOffset = Vector2.new(962, 168),
			ImageRectSize = Vector2.new(54, 54)
		},
		["icons/menu/clothing/eyebrow_on"] = {
			ImageSet = "img_set_3x_6",
			ImageRectOffset = Vector2.new(962, 224),
			ImageRectSize = Vector2.new(54, 54)
		},
		["icons/menu/clothing/eyelash_on"] = {
			ImageSet = "img_set_3x_6",
			ImageRectOffset = Vector2.new(962, 280),
			ImageRectSize = Vector2.new(54, 54)
		},
		["icons/menu/clothing/face_on"] = {
			ImageSet = "img_set_3x_6",
			ImageRectOffset = Vector2.new(962, 336),
			ImageRectSize = Vector2.new(54, 54)
		},
		["icons/menu/clothing/faces_off"] = {
			ImageSet = "img_set_3x_6",
			ImageRectOffset = Vector2.new(962, 392),
			ImageRectSize = Vector2.new(54, 54)
		},
		["icons/menu/clothing/facialHair_off"] = {
			ImageSet = "img_set_3x_6",
			ImageRectOffset = Vector2.new(962, 448),
			ImageRectSize = Vector2.new(54, 54)
		},
		["icons/menu/clothing/facialHair_on"] = {
			ImageSet = "img_set_3x_7",
			ImageRectOffset = Vector2.new(962, 224),
			ImageRectSize = Vector2.new(54, 54)
		},
		["icons/menu/clothing/fall_off"] = {
			ImageSet = "img_set_3x_7",
			ImageRectOffset = Vector2.new(962, 168),
			ImageRectSize = Vector2.new(54, 54)
		},
		["icons/menu/clothing/fall_on"] = {
			ImageSet = "img_set_3x_7",
			ImageRectOffset = Vector2.new(962, 112),
			ImageRectSize = Vector2.new(54, 54)
		},
		["icons/menu/clothing/hair_off"] = {
			ImageSet = "img_set_3x_7",
			ImageRectOffset = Vector2.new(962, 56),
			ImageRectSize = Vector2.new(54, 54)
		},
		["icons/menu/clothing/hair_on"] = {
			ImageSet = "img_set_3x_7",
			ImageRectOffset = Vector2.new(962, 0),
			ImageRectSize = Vector2.new(54, 54)
		},
		["icons/menu/clothing/idle_off"] = {
			ImageSet = "img_set_3x_5",
			ImageRectOffset = Vector2.new(962, 448),
			ImageRectSize = Vector2.new(54, 54)
		},
		["icons/menu/clothing/idle_on"] = {
			ImageSet = "img_set_3x_5",
			ImageRectOffset = Vector2.new(962, 392),
			ImageRectSize = Vector2.new(54, 54)
		},
		["icons/menu/clothing/jump_off"] = {
			ImageSet = "img_set_3x_5",
			ImageRectOffset = Vector2.new(962, 336),
			ImageRectSize = Vector2.new(54, 54)
		},
		["icons/menu/clothing/jump_on"] = {
			ImageSet = "img_set_3x_5",
			ImageRectOffset = Vector2.new(962, 280),
			ImageRectSize = Vector2.new(54, 54)
		},
		["icons/menu/clothing/limited_off"] = {
			ImageSet = "img_set_3x_5",
			ImageRectOffset = Vector2.new(962, 224),
			ImageRectSize = Vector2.new(54, 54)
		},
		["icons/menu/clothing/limited_on"] = {
			ImageSet = "img_set_3x_5",
			ImageRectOffset = Vector2.new(962, 168),
			ImageRectSize = Vector2.new(54, 54)
		},
		["icons/menu/clothing/nose_on"] = {
			ImageSet = "img_set_3x_5",
			ImageRectOffset = Vector2.new(962, 112),
			ImageRectSize = Vector2.new(54, 54)
		},
		["icons/menu/clothing/shorts_on"] = {
			ImageSet = "img_set_3x_5",
			ImageRectOffset = Vector2.new(962, 56),
			ImageRectSize = Vector2.new(54, 54)
		},
		["icons/menu/clothing/shoulder_on"] = {
			ImageSet = "img_set_3x_5",
			ImageRectOffset = Vector2.new(962, 0),
			ImageRectSize = Vector2.new(54, 54)
		},
		["icons/menu/clothing/skin_on"] = {
			ImageSet = "img_set_3x_3",
			ImageRectOffset = Vector2.new(969, 700),
			ImageRectSize = Vector2.new(54, 54)
		},
		["icons/menu/clothing/sweaters_on"] = {
			ImageSet = "img_set_3x_3",
			ImageRectOffset = Vector2.new(962, 448),
			ImageRectSize = Vector2.new(54, 54)
		},
		["icons/menu/clothing/swim_off"] = {
			ImageSet = "img_set_3x_3",
			ImageRectOffset = Vector2.new(962, 392),
			ImageRectSize = Vector2.new(54, 54)
		},
		["icons/menu/clothing/swim_on"] = {
			ImageSet = "img_set_3x_3",
			ImageRectOffset = Vector2.new(962, 336),
			ImageRectSize = Vector2.new(54, 54)
		},
		["icons/menu/clothing/torsos_on"] = {
			ImageSet = "img_set_3x_3",
			ImageRectOffset = Vector2.new(962, 280),
			ImageRectSize = Vector2.new(54, 54)
		},
		["icons/menu/clothing/type_off"] = {
			ImageSet = "img_set_3x_3",
			ImageRectOffset = Vector2.new(962, 224),
			ImageRectSize = Vector2.new(54, 54)
		},
		["icons/menu/clothing/type_on"] = {
			ImageSet = "img_set_3x_3",
			ImageRectOffset = Vector2.new(962, 168),
			ImageRectSize = Vector2.new(54, 54)
		},
		["icons/menu/clothing/waist_on"] = {
			ImageSet = "img_set_3x_3",
			ImageRectOffset = Vector2.new(962, 112),
			ImageRectSize = Vector2.new(54, 54)
		},
		["icons/menu/clothing/walk_off"] = {
			ImageSet = "img_set_3x_3",
			ImageRectOffset = Vector2.new(962, 56),
			ImageRectSize = Vector2.new(54, 54)
		},
		["icons/menu/clothing/walk_on"] = {
			ImageSet = "img_set_3x_3",
			ImageRectOffset = Vector2.new(962, 0),
			ImageRectSize = Vector2.new(54, 54)
		},
		["icons/menu/customize"] = {
			ImageSet = "img_set_3x_9",
			ImageRectOffset = Vector2.new(0, 902),
			ImageRectSize = Vector2.new(108, 108)
		},
		["icons/menu/customize_large"] = {
			ImageSet = "img_set_3x_8",
			ImageRectOffset = Vector2.new(653, 724),
			ImageRectSize = Vector2.new(144, 144)
		},
		["icons/menu/gem_medium"] = {
			ImageSet = "img_set_3x_7",
			ImageRectOffset = Vector2.new(880, 906),
			ImageRectSize = Vector2.new(108, 108)
		},
		["icons/menu/gem_small"] = {
			ImageSet = "img_set_3x_11",
			ImageRectOffset = Vector2.new(958, 439),
			ImageRectSize = Vector2.new(48, 48)
		},
		["icons/menu/protection_off"] = {
			ImageSet = "img_set_3x_7",
			ImageRectOffset = Vector2.new(770, 906),
			ImageRectSize = Vector2.new(108, 108)
		},
		["icons/menu/protection_on"] = {
			ImageSet = "img_set_3x_7",
			ImageRectOffset = Vector2.new(660, 906),
			ImageRectSize = Vector2.new(108, 108)
		},
		["icons/menu/publicChatOff"] = {
			ImageSet = "img_set_3x_7",
			ImageRectOffset = Vector2.new(550, 906),
			ImageRectSize = Vector2.new(108, 108)
		},
		["icons/menu/publicChatOff_small"] = {
			ImageSet = "img_set_3x_11",
			ImageRectOffset = Vector2.new(961, 368),
			ImageRectSize = Vector2.new(48, 48)
		},
		["icons/menu/publicChatOn"] = {
			ImageSet = "img_set_3x_7",
			ImageRectOffset = Vector2.new(440, 906),
			ImageRectSize = Vector2.new(108, 108)
		},
		["icons/menu/publicChatOn_small"] = {
			ImageSet = "img_set_3x_11",
			ImageRectOffset = Vector2.new(961, 318),
			ImageRectSize = Vector2.new(48, 48)
		},
		["icons/menu/rocketShipOn_medium"] = {
			ImageSet = "img_set_3x_7",
			ImageRectOffset = Vector2.new(330, 906),
			ImageRectSize = Vector2.new(108, 108)
		},
		["icons/menu/rocketShip_medium"] = {
			ImageSet = "img_set_3x_7",
			ImageRectOffset = Vector2.new(220, 906),
			ImageRectSize = Vector2.new(108, 108)
		},
		["icons/menu/rocketShip_small"] = {
			ImageSet = "img_set_3x_11",
			ImageRectOffset = Vector2.new(961, 268),
			ImageRectSize = Vector2.new(48, 48)
		},
		["icons/menu/securityKey"] = {
			ImageSet = "img_set_3x_7",
			ImageRectOffset = Vector2.new(110, 906),
			ImageRectSize = Vector2.new(108, 108)
		},
		["icons/menu/transform"] = {
			ImageSet = "img_set_3x_7",
			ImageRectOffset = Vector2.new(0, 906),
			ImageRectSize = Vector2.new(108, 108)
		},
		["icons/menu/transform-small"] = {
			ImageSet = "img_set_3x_11",
			ImageRectOffset = Vector2.new(961, 218),
			ImageRectSize = Vector2.new(48, 48)
		},
		["icons/navigation/close"] = {
			ImageSet = "img_set_3x_5",
			ImageRectOffset = Vector2.new(880, 906),
			ImageRectSize = Vector2.new(108, 108)
		},
		["icons/navigation/externallink"] = {
			ImageSet = "img_set_3x_11",
			ImageRectOffset = Vector2.new(964, 150),
			ImageRectSize = Vector2.new(48, 48)
		},
		["icons/navigation/externallink_medium"] = {
			ImageSet = "img_set_3x_5",
			ImageRectOffset = Vector2.new(770, 906),
			ImageRectSize = Vector2.new(108, 108)
		},
		["icons/navigation/seeAllArrow_small"] = {
			ImageSet = "img_set_3x_11",
			ImageRectOffset = Vector2.new(964, 100),
			ImageRectSize = Vector2.new(48, 48)
		},
		["icons/navigation/swipe"] = {
			ImageSet = "img_set_3x_5",
			ImageRectOffset = Vector2.new(660, 906),
			ImageRectSize = Vector2.new(108, 108)
		},
		["icons/navigation/swipeDown"] = {
			ImageSet = "img_set_3x_5",
			ImageRectOffset = Vector2.new(550, 906),
			ImageRectSize = Vector2.new(108, 108)
		},
		["icons/navigation/swipeUp"] = {
			ImageSet = "img_set_3x_5",
			ImageRectOffset = Vector2.new(440, 906),
			ImageRectSize = Vector2.new(108, 108)
		},
		["icons/status/collectibles"] = {
			ImageSet = "img_set_3x_5",
			ImageRectOffset = Vector2.new(330, 906),
			ImageRectSize = Vector2.new(108, 108)
		},
		["icons/status/collectibles_large"] = {
			ImageSet = "img_set_3x_8",
			ImageRectOffset = Vector2.new(799, 724),
			ImageRectSize = Vector2.new(144, 144)
		},
		["icons/status/collectibles_small"] = {
			ImageSet = "img_set_3x_11",
			ImageRectOffset = Vector2.new(964, 50),
			ImageRectSize = Vector2.new(48, 48)
		},
		["icons/status/games/sessions_large"] = {
			ImageSet = "img_set_3x_12",
			ImageRectOffset = Vector2.new(653, 0),
			ImageRectSize = Vector2.new(144, 144)
		},
		["icons/status/games/sessions_small"] = {
			ImageSet = "img_set_3x_11",
			ImageRectOffset = Vector2.new(964, 0),
			ImageRectSize = Vector2.new(48, 48)
		},
		["icons/status/item/limited"] = {
			ImageSet = "img_set_3x_11",
			ImageRectOffset = Vector2.new(676, 972),
			ImageRectSize = Vector2.new(48, 48)
		},
		["icons/status/loading_large"] = {
			ImageSet = "img_set_3x_12",
			ImageRectOffset = Vector2.new(799, 0),
			ImageRectSize = Vector2.new(144, 144)
		},
		["icons/status/loading_medium"] = {
			ImageSet = "img_set_3x_5",
			ImageRectOffset = Vector2.new(220, 906),
			ImageRectSize = Vector2.new(108, 108)
		},
		["icons/status/loading_small"] = {
			ImageSet = "img_set_3x_11",
			ImageRectOffset = Vector2.new(676, 922),
			ImageRectSize = Vector2.new(48, 48)
		},
		["icons/status/oof_xlarge"] = {
			ImageSet = "img_set_3x_13",
			ImageRectOffset = Vector2.new(602, 520),
			ImageRectSize = Vector2.new(288, 288)
		},
		["icons/status/player/videostar"] = {
			ImageSet = "img_set_3x_11",
			ImageRectOffset = Vector2.new(537, 972),
			ImageRectSize = Vector2.new(48, 48)
		},
		["icons/status/trending_small"] = {
			ImageSet = "img_set_3x_7",
			ImageRectOffset = Vector2.new(962, 492),
			ImageRectSize = Vector2.new(48, 48)
		},
		["reactions/crying"] = {
			ImageSet = "img_set_3x_12",
			ImageRectOffset = Vector2.new(648, 182),
			ImageRectSize = Vector2.new(144, 144)
		},
		["reactions/fire"] = {
			ImageSet = "img_set_3x_11",
			ImageRectOffset = Vector2.new(740, 866),
			ImageRectSize = Vector2.new(144, 144)
		},
		["reactions/heart"] = {
			ImageSet = "img_set_3x_7",
			ImageRectOffset = Vector2.new(799, 724),
			ImageRectSize = Vector2.new(144, 144)
		},
		["reactions/laughJoy"] = {
			ImageSet = "img_set_3x_7",
			ImageRectOffset = Vector2.new(653, 724),
			ImageRectSize = Vector2.new(144, 144)
		},
		["reactions/skull"] = {
			ImageSet = "img_set_3x_7",
			ImageRectOffset = Vector2.new(799, 542),
			ImageRectSize = Vector2.new(144, 144)
		},
		["reactions/thumbsUp"] = {
			ImageSet = "img_set_3x_7",
			ImageRectOffset = Vector2.new(653, 542),
			ImageRectSize = Vector2.new(144, 144)
		},
		["reactions/wow"] = {
			ImageSet = "img_set_3x_5",
			ImageRectOffset = Vector2.new(835, 724),
			ImageRectSize = Vector2.new(144, 144)
		},
		["squircles/fill"] = {
			ImageSet = "img_set_3x_7",
			ImageRectOffset = Vector2.new(945, 724),
			ImageRectSize = Vector2.new(78, 78)
		},
		["squircles/hollow"] = {
			ImageSet = "img_set_3x_7",
			ImageRectOffset = Vector2.new(945, 628),
			ImageRectSize = Vector2.new(78, 78)
		},
		["squircles/hollowBold"] = {
			ImageSet = "img_set_3x_3",
			ImageRectOffset = Vector2.new(686, 786),
			ImageRectSize = Vector2.new(90, 90)
		},
		["truncate_arrows/actions_truncationCollapse"] = {
			ImageSet = "img_set_3x_5",
			ImageRectOffset = Vector2.new(110, 906),
			ImageRectSize = Vector2.new(108, 108)
		},
		["truncate_arrows/actions_truncationExpand"] = {
			ImageSet = "img_set_3x_5",
			ImageRectOffset = Vector2.new(0, 906),
			ImageRectSize = Vector2.new(108, 108)
		}
	}
end

return function(p1)
	-- upvalues: var3 (write), var2 (write), var1 (write)
	if p1 > 2.5 then
		if not var3 then
			make_assets_3x()
		end
		return var3, 3
	elseif p1 > 1.5 then
		if not var2 then
			make_assets_2x()
		end
		return var2, 2
	elseif not var1 then
		make_assets_1x()
	end
	return var1, 1
end