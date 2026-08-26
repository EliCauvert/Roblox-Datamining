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

return function(p1)
	-- upvalues: cryo (ref), t (ref), useNavigation (ref), useLocalUserId (ref), useParticipant (ref), reactModule (ref), voicePackButtonModule (ref), crossExperienceVoiceManager (ref), foundationModule (ref), builderIconsModule (ref), iconSize (ref), enums (ref), inputSize (ref)
	local var1 = cryo.Dictionary.join(t, p1)
	local var2 = useNavigation()
	local var3 = tonumber(useLocalUserId()) or -1
	local var4 = useParticipant(var3)
	local var5 = if var4 then var4.selectedVoicePack else nil
	local var6 = if var4 then var4.isVoiceChangerActive else nil
	local var7 = if var4 then var4.isVoiceChangerHearMyselfActive else nil
	local wideMode = var2.getScreenProps("wideMode", false)
	local var8 = "bg-surface-0"
	local var9 = "bg-surface-0"
	
	if var1.enableTestingTheme then
		var8 = "bg-system-alert"
		var9 = "bg-system-warning"
	end
	local t_1 = {}
	local list = {
		{ name = "None" }, { name = "Basic" }, { name = "Chipmunk" },
		{ name = "Robot" }, { name = "HighPitchRobot" }, { name = "Monster" },
		{ name = "Dreamy" }, { name = "Powerful" }, { name = "Ghost" }
	}
	
	local function makeButton(p2, p3)
		-- upvalues: list (ref), var1 (ref), reactModule (copy), voicePackButtonModule (copy), var6 (ref), var5 (ref), crossExperienceVoiceManager (copy), var3 (ref)
		local var10
		local var11 = list[p2] or { name = "Voicepack " .. p1 }
		local var12 = if var1.fillListWithExtraVoicePacks then var11.name or "Voicepack " .. p1 else var11.name
		local createElement = reactModule.createElement
		local t = {
			LayoutOrder = p3,
			voicePackName = var12,
			isVoiceChangerActive = var6
		}
		
		if var5 then
			var10 = var12 == var5
			var10 = nil
		else
			var10 = false
		end
		t.isSelected = var10
		
		function t.onActivated()
			-- upvalues: crossExperienceVoiceManager (copy), var12 (ref), var6 (copy), var3 (copy)
			crossExperienceVoiceManager.default:setVoicePack(var12)
			
			if var12 == "None" and var6 then
				crossExperienceVoiceManager.default:disableVoiceChanger(var3)
				
				return
			elseif var12 ~= "None" and not var6 then
				crossExperienceVoiceManager.default:enableVoiceChanger(var3)
			end
		end
		
		return createElement(voicePackButtonModule, t)
	end
	
	for i = 1, #list + (if var1.fillListWithExtraVoicePacks then 25 else 0) do
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
				onActivated = var1.closeSquadVoiceChangers
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
				onActivated = var1.closeSquadVoiceChangers
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
				onActivated = var1.closeSquadVoiceChangers
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
				["bg-system-warning"] = var1.enableTestingTheme
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
						-- upvalues: var7 (ref), crossExperienceVoiceManager (copy), var3 (ref)
						if var7 then
							crossExperienceVoiceManager.default:disableHearMyself(var3)
							
							return
						end
						crossExperienceVoiceManager.default:enableHearMyself(var3)
					end,
					isChecked = var7
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
			onActivated = var1.closeSquadVoiceChangers
		}) else nil
	})
end