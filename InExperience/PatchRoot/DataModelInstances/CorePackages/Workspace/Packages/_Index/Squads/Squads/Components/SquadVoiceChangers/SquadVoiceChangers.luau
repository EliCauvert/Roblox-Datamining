local Squads = script:FindFirstAncestor("Squads")
local Parent = Squads.Parent
local FFlagSquadsEnableFoundationTestIdsModule = require(Squads.Flags.FFlagSquadsEnableFoundationTestIds)
local FoundationModule = require(Parent.Foundation)
local CrossExperienceVoiceModule = require(Parent.CrossExperienceVoice)
local CrossExperienceVoiceManager = CrossExperienceVoiceModule.CrossExperienceVoiceManager
local DependenciesModule = require(Squads.dependencies)
local Cryo = DependenciesModule.Cryo
local ReactModule = require(Parent.React)
local UseParticipantFunction = CrossExperienceVoiceModule.Hooks.useParticipant
local UseLocalUserIdFunction = require(Parent.RobloxAppHooks).useLocalUserId
local UseNavigationFunction = DependenciesModule.useNavigation
local BuilderIconsModule = require(Parent.BuilderIcons)
local VoicePackButtonModule = require(script.Parent.VoicePackButton)
local Enums = FoundationModule.Enums
local IconSize = Enums.IconSize
local InputSize = Enums.InputSize
local config = {
	enableTestingTheme = false,
	closeCentralOverlayThunk = function()
		return { type = "CloseCentralOverlay" }
	end
}

return function(p1)
	-- upvalues: Cryo (copy), config (copy), UseNavigationFunction (copy), UseLocalUserIdFunction (copy), UseParticipantFunction (copy), ReactModule (copy), VoicePackButtonModule (copy), CrossExperienceVoiceManager (copy), FoundationModule (copy), FFlagSquadsEnableFoundationTestIdsModule (copy), BuilderIconsModule (copy), IconSize (copy), Enums (copy), InputSize (copy)
	local JoinResult = Cryo.Dictionary.join(config, p1)
	local UseNavigationResult = UseNavigationFunction()
	local Number: number = tonumber(UseLocalUserIdFunction()) or -1
	local UseParticipantResult = UseParticipantFunction(Number)
	local SelectedVoicePack = if UseParticipantResult then UseParticipantResult.selectedVoicePack else nil
	local IsVoiceChangerActive = if UseParticipantResult then UseParticipantResult.isVoiceChangerActive else nil
	local IsVoiceChangerHearMyselfActive = if UseParticipantResult then UseParticipantResult.isVoiceChangerHearMyselfActive else nil
	local WideModeScreenProps = UseNavigationResult.getScreenProps("wideMode", false)
	local v1 = "bg-surface-0"
	local v2 = "bg-surface-0"
	
	if JoinResult.enableTestingTheme then
		v1 = "bg-system-alert"
		v2 = "bg-system-warning"
	end
	local t = {}
	local list = {
		{ name = "None" },
		{ name = "Basic" },
		{ name = "Chipmunk" },
		{ name = "Robot" },
		{ name = "HighPitchRobot" },
		{ name = "Monster" },
		{ name = "Dreamy" },
		{ name = "Powerful" },
		{ name = "Ghost" }
	}
	
	local function makeButton(Text, LayoutOrder)
		-- upvalues: list (copy), JoinResult (copy), ReactModule (upval), VoicePackButtonModule (upval), IsVoiceChangerActive (copy), SelectedVoicePack (copy), CrossExperienceVoiceManager (upval), Number (copy)
		local Entry = list[Text] or { name = "Voicepack " .. Text }
		local Name = if JoinResult.fillListWithExtraVoicePacks then Entry.name or "Voicepack " .. Text else Entry.name
		
		return ReactModule.createElement(VoicePackButtonModule, {
			LayoutOrder = LayoutOrder,
			voicePackName = Name,
			isVoiceChangerActive = IsVoiceChangerActive,
			isSelected = if SelectedVoicePack then Name == SelectedVoicePack else false,
			onActivated = function()
				-- upvalues: CrossExperienceVoiceManager (upval), Name (copy), IsVoiceChangerActive (upval), Number (upval)
				CrossExperienceVoiceManager.default:setVoicePack(Name)
				
				if Name == "None" and IsVoiceChangerActive then
					CrossExperienceVoiceManager.default:disableVoiceChanger(Number)
					
					return
				end
				if Name ~= "None" and not IsVoiceChangerActive then
					CrossExperienceVoiceManager.default:enableVoiceChanger(Number)
				end
			end
		})
	end
	
	for i = 1, #list + (if JoinResult.fillListWithExtraVoicePacks then 25 else 0) do
		t["VoicePackButton_" .. i] = makeButton(i, i)
	end
	return ReactModule.createElement(FoundationModule.View, {
		tag = "size-full-full col align-x-center align-y-top gap-large padding-large radius-medium stroke-emphasis " .. v1,
		testId = if FFlagSquadsEnableFoundationTestIdsModule then "--social-squad-voice-changers" else nil
	}, {
		TopBar = if WideModeScreenProps then ReactModule.createElement(FoundationModule.View, { tag = "size-full-0 auto-y", LayoutOrder = 1 }, {
			Title = ReactModule.createElement(FoundationModule.Text, {
				Text = "Choose voice pack",
				LayoutOrder = 1,
				tag = "position-center-center anchor-center-center text-align-x-center text-align-y-center size-full-0 auto-xy text-heading-small radius-medium " .. v2,
				testId = if FFlagSquadsEnableFoundationTestIdsModule then "--social-squad-voice-changers--title" else nil
			}),
			CloseButton = ReactModule.createElement(FoundationModule.View, {
				tag = "position-center-left anchor-center-left auto-xy radius-circle bg-action-subtle padding-xsmall",
				ZIndex = 2,
				onActivated = JoinResult.closeSquadVoiceChangers,
				testId = if FFlagSquadsEnableFoundationTestIdsModule then "--social-squad-voice-changers--close-button" else nil
			}, {
				Icon = ReactModule.createElement(FoundationModule.Icon, {
					tag = "position-center-center anchor-center-center auto-xy",
					name = BuilderIconsModule.Icon.ArrowLargeLeft,
					size = IconSize.Large
				})
			}),
			DoneButton = ReactModule.createElement(FoundationModule.Text, {
				Text = "Done",
				tag = "position-center-right anchor-center-right text-align-x-center text-align-y-center size-2200-0 auto-y text-label-large radius-medium padding-small text-wrap bg-action-subtle",
				LayoutOrder = 2,
				onActivated = JoinResult.closeSquadVoiceChangers,
				testId = if FFlagSquadsEnableFoundationTestIdsModule then "--social-squad-voice-changers--done-button" else nil
			})
		}) else ReactModule.createElement(FoundationModule.View, { tag = "size-full-0 auto-y", LayoutOrder = 1 }, {
			Title = ReactModule.createElement(FoundationModule.Text, {
				Text = "Choose voice pack",
				LayoutOrder = 1,
				tag = "position-center-left anchor-center-left text-align-x-left text-align-y-center size-full-0 auto-xy text-heading-small radius-medium " .. v2,
				testId = if FFlagSquadsEnableFoundationTestIdsModule then "--social-squad-voice-changers--title" else nil
			}),
			CloseButton = ReactModule.createElement(FoundationModule.View, {
				tag = "position-center-right anchor-center-right auto-xy radius-circle bg-action-subtle padding-xsmall",
				LayoutOrder = 2,
				ZIndex = 2,
				onActivated = JoinResult.closeSquadVoiceChangers,
				testId = if FFlagSquadsEnableFoundationTestIdsModule then "--social-squad-voice-changers--close-button" else nil
			}, {
				Icon = ReactModule.createElement(FoundationModule.Icon, {
					tag = "position-center-center anchor-center-center auto-xy",
					name = BuilderIconsModule.Icon.X,
					size = IconSize.Large
				})
			})
		}),
		Divider = ReactModule.createElement(FoundationModule.Divider, { LayoutOrder = 2, variant = Enums.DividerVariant.Default }),
		HearMyselfBar = ReactModule.createElement(FoundationModule.View, {
			LayoutOrder = 3,
			tag = {
				["size-full-0 auto-y row align-x-left align-y-center padding-left-xxlarge padding-right-xxlarge"] = true,
				["bg-system-warning"] = JoinResult.enableTestingTheme
			}
		}, {
			HearMyselfLabel = ReactModule.createElement(FoundationModule.Text, {
				Text = "Hear myself",
				tag = "text-align-x-left text-align-y-center size-0-0 auto-xy fill text-label-medium padding-left-large radius-medium text-wrap bg-action-subtle",
				LayoutOrder = 1,
				testId = if FFlagSquadsEnableFoundationTestIdsModule then "--social-squad-voice-changers--hear-myself-label" else nil
			}),
			HearMyselfToggleHolder = ReactModule.createElement(FoundationModule.View, {
				tag = "row align-x-center align-y-center size-0-0 auto-xy padding-right-large",
				LayoutOrder = 2
			}, {
				HearMyselfToggle = ReactModule.createElement(FoundationModule.Toggle, {
					label = "",
					size = InputSize.Medium,
					onActivated = function(_)
						-- upvalues: IsVoiceChangerHearMyselfActive (copy), CrossExperienceVoiceManager (upval), Number (copy)
						if IsVoiceChangerHearMyselfActive then
							CrossExperienceVoiceManager.default:disableHearMyself(Number)
							
							return
						else
							CrossExperienceVoiceManager.default:enableHearMyself(Number)
						end
					end,
					isChecked = IsVoiceChangerHearMyselfActive,
					testId = if FFlagSquadsEnableFoundationTestIdsModule then "--social-squad-voice-changers--hear-myself-toggle" else nil
				})
			})
		}),
		ButtonsView = ReactModule.createElement(FoundationModule.View, {
			LayoutOrder = 4,
			tag = "fill padding-left-medium padding-right-medium padding-bottom-medium radius-medium size-full-full auto-y col align-x-center align-y-top " .. v2
		}, {
			ButtonsScroller = ReactModule.createElement(FoundationModule.ScrollView, {
				tag = "size-full-0 fill bg-action-subtle",
				BorderSizePixel = 0,
				scroll = {
					AutomaticCanvasSize = Enum.AutomaticSize.Y,
					CanvasSize = UDim2.new()
				}
			}, {
				Buttons = ReactModule.createElement(FoundationModule.View, {
					tag = "size-full-0 auto-y col align-x-center align-y-top padding-medium fill"
				}, t)
			})
		}),
		BottomDoneButton = if WideModeScreenProps then nil else ReactModule.createElement(FoundationModule.Text, {
			Text = "Done",
			tag = "position-center-center anchor-center-center text-align-x-center text-align-y-center size-full-0 auto-y text-label-large radius-medium padding-small text-wrap bg-action-subtle",
			LayoutOrder = 5,
			onActivated = JoinResult.closeSquadVoiceChangers,
			testId = if FFlagSquadsEnableFoundationTestIdsModule then "--social-squad-voice-changers--done-button" else nil
		})
	})
end