local squads = script:FindFirstAncestor("Squads")
local parent = squads.Parent
local foundationModule = require(parent.Foundation)
local crossExperienceVoiceModule = require(parent.CrossExperienceVoice)
local crossExperienceVoiceManager = crossExperienceVoiceModule.CrossExperienceVoiceManager
local dependenciesModule = require(squads.dependencies)
local cryo = dependenciesModule.Cryo
local reactModule = require(parent.React)
local useParticipant = crossExperienceVoiceModule.Hooks.useParticipant
local useLocalUserId = require(parent.RobloxAppHooks).useLocalUserId
local useNavigation = dependenciesModule.useNavigation
local builderIconsModule = require(parent.BuilderIcons)
local voicePackButtonModule = require(script.Parent.VoicePackButton)
local enums = foundationModule.Enums
local iconSize = enums.IconSize
local inputSize = enums.InputSize
local t = {
	enableTestingTheme = false,
	closeCentralOverlayThunk = function()
		return { type = "CloseCentralOverlay" }
	end
}

return function(p0)
	-- upvalues: cryo (ref), t (ref), useNavigation (ref), useLocalUserId (ref), useParticipant (ref), reactModule (ref), voicePackButtonModule (ref), crossExperienceVoiceManager (ref), foundationModule (ref), builderIconsModule (ref), iconSize (ref), enums (ref), inputSize (ref)
	local var8 = cryo.Dictionary.join(t, p0)
	local var9 = useNavigation()
	local var10 = tonumber(useLocalUserId()) or -1
	local var11 = useParticipant(var10)
	local var12 = if var11 then var11.selectedVoicePack else nil
	local var13 = if var11 then var11.isVoiceChangerActive else nil
	local var14 = if var11 then var11.isVoiceChangerHearMyselfActive else nil
	local wideMode = var9.getScreenProps("wideMode", false)
	local var16 = "bg-surface-0"
	local var17 = "bg-surface-0"
	
	if var8.enableTestingTheme then
		var16 = "bg-system-alert"
		var17 = "bg-system-warning"
	end
	local t_1 = {}
	local list = {
		{ name = "None" }, { name = "Basic" }, { name = "Chipmunk" },
		{ name = "Robot" }, { name = "HighPitchRobot" }, { name = "Monster" },
		{ name = "Dreamy" }, { name = "Powerful" }, { name = "Ghost" }
	}
	
	local function makeButton(p1, p2)
		-- upvalues: list (ref), var8 (ref), reactModule (copy), voicePackButtonModule (copy), var13 (ref), var12 (ref), crossExperienceVoiceManager (copy), var10 (ref)
		local var24
		local var21 = list[p1] or { name = "Voicepack " .. p1 }
		local var22 = if var8.fillListWithExtraVoicePacks then var21.name or "Voicepack " .. p1 else var21.name
		local createElement = reactModule.createElement
		local t = {
			LayoutOrder = p2,
			voicePackName = var22,
			isVoiceChangerActive = var13
		}
		
		if var12 then
			var24 = var22 == var12
			var24 = nil
		else
			var24 = false
		end
		t.isSelected = var24
		
		function t.onActivated()
			-- upvalues: crossExperienceVoiceManager (copy), var22 (ref), var13 (copy), var10 (copy)
			crossExperienceVoiceManager.default:setVoicePack(var22)
			
			if var22 == "None" and var13 then
				crossExperienceVoiceManager.default:disableVoiceChanger(var10)
				
				return
			elseif var22 ~= "None" and not var13 then
				crossExperienceVoiceManager.default:enableVoiceChanger(var10)
			end
		end
		
		return createElement(voicePackButtonModule, t)
	end
	
	for i = 1, #list + (if var8.fillListWithExtraVoicePacks then 25 else 0) do
		t_1["VoicePackButton_" .. i] = makeButton(i, i)
	end
	return reactModule.createElement(foundationModule.View, {
		tag = "size-full-full col align-x-center align-y-top gap-large padding-large radius-medium stroke-emphasis " .. var16
	}, {
		TopBar = if wideMode then reactModule.createElement(foundationModule.View, { tag = "size-full-0 auto-y", LayoutOrder = 1 }, {
			Title = reactModule.createElement(foundationModule.Text, {
				Text = "Choose voice pack",
				LayoutOrder = 1,
				tag = "position-center-center anchor-center-center text-align-x-center text-align-y-center size-full-0 auto-xy text-heading-small radius-medium " .. var17
			}),
			CloseButton = reactModule.createElement(foundationModule.View, {
				tag = "position-center-left anchor-center-left auto-xy radius-circle bg-action-subtle padding-xsmall",
				ZIndex = 2,
				onActivated = var8.closeSquadVoiceChangers
			}, {
				Icon = reactModule.createElement(foundationModule.Icon, {
					tag = "position-center-center anchor-center-center auto-xy",
					name = builderIconsModule.Icon.ArrowLargeLeft,
					size = iconSize.Large
				})
			}),
			DoneButton = reactModule.createElement(foundationModule.Text, {
				Text = "Done",
				tag = "position-center-right anchor-center-right text-align-x-center text-align-y-center size-2200-0 auto-y text-label-large radius-medium padding-small text-wrap bg-action-subtle",
				LayoutOrder = 2,
				onActivated = var8.closeSquadVoiceChangers
			})
		}) else reactModule.createElement(foundationModule.View, { tag = "size-full-0 auto-y", LayoutOrder = 1 }, {
			Title = reactModule.createElement(foundationModule.Text, {
				Text = "Choose voice pack",
				LayoutOrder = 1,
				tag = "position-center-left anchor-center-left text-align-x-left text-align-y-center size-full-0 auto-xy text-heading-small radius-medium " .. var17
			}),
			CloseButton = reactModule.createElement(foundationModule.View, {
				tag = "position-center-right anchor-center-right auto-xy radius-circle bg-action-subtle padding-xsmall",
				LayoutOrder = 2,
				ZIndex = 2,
				onActivated = var8.closeSquadVoiceChangers
			}, {
				Icon = reactModule.createElement(foundationModule.Icon, {
					tag = "position-center-center anchor-center-center auto-xy",
					name = builderIconsModule.Icon.X,
					size = iconSize.Large
				})
			})
		}),
		Divider = reactModule.createElement(foundationModule.Divider, { LayoutOrder = 2, variant = enums.DividerVariant.Default }),
		HearMyselfBar = reactModule.createElement(foundationModule.View, {
			LayoutOrder = 3,
			tag = {
				["size-full-0 auto-y row align-x-left align-y-center padding-left-xxlarge padding-right-xxlarge"] = true,
				["bg-system-warning"] = var8.enableTestingTheme
			}
		}, {
			HearMyselfLabel = reactModule.createElement(foundationModule.Text, {
				Text = "Hear myself",
				tag = "text-align-x-left text-align-y-center size-0-0 auto-xy fill text-label-medium padding-left-large radius-medium text-wrap bg-action-subtle",
				LayoutOrder = 1
			}),
			HearMyselfToggleHolder = reactModule.createElement(foundationModule.View, {
				tag = "row align-x-center align-y-center size-0-0 auto-xy padding-right-large",
				LayoutOrder = 2
			}, {
				HearMyselfToggle = reactModule.createElement(foundationModule.Toggle, {
					label = "",
					size = inputSize.Medium,
					onActivated = function(_)
						-- upvalues: var14 (ref), crossExperienceVoiceManager (copy), var10 (ref)
						if var14 then
							crossExperienceVoiceManager.default:disableHearMyself(var10)
							
							return
						end
						crossExperienceVoiceManager.default:enableHearMyself(var10)
					end,
					isChecked = var14
				})
			})
		}),
		ButtonsView = reactModule.createElement(foundationModule.View, {
			LayoutOrder = 4,
			tag = "fill padding-left-medium padding-right-medium padding-bottom-medium radius-medium size-full-full auto-y col align-x-center align-y-top " .. var17
		}, {
			ButtonsScroller = reactModule.createElement(foundationModule.ScrollView, {
				tag = "size-full-0 fill bg-action-subtle",
				BorderSizePixel = 0,
				scroll = {
					AutomaticCanvasSize = Enum.AutomaticSize.Y,
					CanvasSize = UDim2.new()
				}
			}, {
				Buttons = reactModule.createElement(foundationModule.View, {
					tag = "size-full-0 auto-y col align-x-center align-y-top padding-medium fill"
				}, t_1)
			})
		}),
		BottomDoneButton = if not wideMode then reactModule.createElement(foundationModule.Text, {
			Text = "Done",
			tag = "position-center-center anchor-center-center text-align-x-center text-align-y-center size-full-0 auto-y text-label-large radius-medium padding-small text-wrap bg-action-subtle",
			LayoutOrder = 5,
			onActivated = var8.closeSquadVoiceChangers
		}) else nil
	})
end