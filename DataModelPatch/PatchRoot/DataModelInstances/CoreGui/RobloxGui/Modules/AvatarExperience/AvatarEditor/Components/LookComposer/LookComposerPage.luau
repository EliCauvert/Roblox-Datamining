local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local UseNavigationFunction = require(CorePackages.Workspace.Packages.Navigation).useNavigation
local UseSelectorFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local UseDispatchFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch
local PeekViewState = require(CorePackages.Workspace.Packages.PeekView).PeekViewState
local RoactGamepadModule = require(CorePackages.Packages.RoactGamepad)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local FoundationModule = require(CorePackages.Packages.Foundation)
local BuilderIconsModule = require(CorePackages.Packages.BuilderIcons)
local IconSize = FoundationModule.Enums.IconSize
local IconSize1 = UIBloxModule.App.ImageSet.Enum.IconSize
local Loading = FoundationModule.Loading
local Focusable = RoactGamepadModule.Focusable
local AppPageModule = require(Modules.LuaApp.AppPage)
local TopBarModule = require(Modules.LuaApp.Components.TopBar.TopBar)
local RoactNetworkingModule = require(Modules.LuaApp.Services.RoactNetworking)
local UseRoactServiceModule = require(Modules.LuaApp.Hooks.useRoactService)
local UseLocalizationModule = require(Modules.LuaApp.Hooks.useLocalization)
local AvatarExperienceViewModule = require(Modules.AvatarExperience.Common.Components.AvatarExperienceView)
local LookViewportModule = require(Modules.AvatarExperience.Common.Components.Looks.LookViewport)
local ConstantsModule = require(Modules.AvatarExperience.Common.Constants)
local NavigationUtilsModule = require(Modules.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils)
local SetTryOnManagerPeekViewStateFunction = require(CorePackages.Workspace.Packages.AvatarExperienceRodux).Actions.SetTryOnManagerPeekViewState
local CreateDraftLookModule = require(Modules.AvatarExperience.AvatarEditor.Thunks.CreateDraftLook)
local DraftLookFinalPreviewModule = require(Modules.AvatarExperience.AvatarEditor.Thunks.DraftLookFinalPreview)
local AvatarScreen = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen
local LookEmotePickerModule = require(script.Parent.LookEmotePicker)
local LookBackgroundPickerModule = require(script.Parent.LookBackgroundPicker)
local LookInfoFormModule = require(script.Parent.LookInfoForm)
local ActionBar = UIBloxModule.App.Button.ActionBar
local ButtonStack = UIBloxModule.App.Button.ButtonStack
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local Images = UIBloxModule.App.ImageSet.Images
local IconButton = UIBloxModule.App.Button.IconButton
local IconButton1 = FoundationModule.IconButton
local GetFFlagAXLookComposerBackgroundsEnabledModule = require(Modules.AvatarExperience.Flags.GetFFlagAXLookComposerBackgroundsEnabled)
local GetFFlagAXLooksTranslationAuditModule = require(Modules.AvatarExperience.Flags.GetFFlagAXLooksTranslationAudit)
local AXFixLookComposerExitPrompt = game:DefineFastFlag("AXFixLookComposerExitPrompt", false)
local AXLookComposerEmotesPickerEnabled = game:DefineFastFlag("AXLookComposerEmotesPickerEnabled", false)
local AXLookComposerStepsRefactor = game:DefineFastFlag("AXLookComposerStepsRefactor", false)
local AXFixLookComposerCloseButton = game:DefineFastFlag("AXFixLookComposerCloseButton", false)
local FFlagAXMigrateAXToGlobalAutofocus = require(CorePackages.Workspace.Packages.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus
local config = {
	ApplyEmote = true,
	ApplyBackground = false,
	EditInfo = false
}
local List = {}

if AXLookComposerStepsRefactor then
	if AXLookComposerEmotesPickerEnabled then
		table.insert(List, "ApplyEmote")
	end
	if GetFFlagAXLookComposerBackgroundsEnabledModule() then
		table.insert(List, "ApplyBackground")
	end
	table.insert(List, "EditInfo")
end
local function v42(p1)
	-- upvalues: UseNavigationFunction (copy), AppPageModule (copy), NavigationUtilsModule (copy), AXFixLookComposerCloseButton (copy), ReactModule (copy), IconButton1 (copy), IconSize (copy), BuilderIconsModule (copy), IconButton (copy), IconSize1 (copy), Images (copy)
	local UseNavigationResult = UseNavigationFunction()
	
	local function OnActivated()
		-- upvalues: p1 (copy), UseNavigationResult (copy), AppPageModule (upval), NavigationUtilsModule (upval)
		if p1.onActivated then
			p1.onActivated()
			
			return
		else
			local PrevNavPageParam = UseNavigationResult.getParam("prevNavPage") or AppPageModule.Home
			NavigationUtilsModule.closeLookComposer(UseNavigationResult)
			UseNavigationResult.navigate(PrevNavPageParam)
		end
	end
	
	return if AXFixLookComposerCloseButton then ReactModule.createElement(IconButton1, {
		size = IconSize.Medium,
		icon = BuilderIconsModule.Icon.X,
		onActivated = OnActivated
	}) else ReactModule.createElement(IconButton, {
		size = UDim2.fromOffset(0, 0),
		iconSize = IconSize1.Medium,
		icon = Images["icons/navigation/close"],
		onActivated = OnActivated
	})
end

local function v43(p1): boolean
	-- upvalues: ConstantsModule (copy)
	return p1.AvatarExperience.AvatarScene.Looks[ConstantsModule.DraftLookId] and (p1.AvatarExperience.AvatarScene.Looks[ConstantsModule.DraftLookId].displayProperties and p1.AvatarExperience.AvatarScene.Looks[ConstantsModule.DraftLookId].displayProperties.emoteAssetId ~= nil)
end

function trimWhitespaceFromString(p1)
	return p1:match("^%s*(.-)%s*$")
end

return function()
	-- upvalues: UseDispatchFunction (copy), UseNavigationFunction (copy), UseStyleFunction (copy), FFlagAXMigrateAXToGlobalAutofocus (copy), ReactModule (copy), RoactGamepadModule (copy), AXLookComposerStepsRefactor (copy), List (copy), GetFFlagAXLooksTranslationAuditModule (copy), UseLocalizationModule (copy), UseSelectorFunction (copy), ConstantsModule (copy), v43 (copy), PeekViewState (copy), UseRoactServiceModule (copy), RoactNetworkingModule (copy), SetTryOnManagerPeekViewStateFunction (copy), CreateDraftLookModule (copy), NavigationUtilsModule (copy), LookViewportModule (copy), GetFFlagAXLookComposerBackgroundsEnabledModule (copy), DraftLookFinalPreviewModule (copy), ButtonType (copy), AppPageModule (copy), AXFixLookComposerExitPrompt (copy), AvatarScreen (copy), v42 (copy), Focusable (copy), AvatarExperienceViewModule (copy), TopBarModule (copy), config (copy), Loading (copy), IconSize (copy), LookEmotePickerModule (copy), LookBackgroundPickerModule (copy), LookInfoFormModule (copy), ActionBar (copy), ButtonStack (copy)
	local UseDispatchResult = UseDispatchFunction()
	local UseNavigationResult = UseNavigationFunction()
	local UseStyleResult = UseStyleFunction()
	local Current = if FFlagAXMigrateAXToGlobalAutofocus then nil else ReactModule.useRef(RoactGamepadModule.createFocusController()).current
	local UseStateResult, UseStateResult2 = ReactModule.useState(Vector2.new())
	local Entry = if AXLookComposerStepsRefactor then List[1] else "ApplyEmote"
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(Entry)
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState(true)
	local UseStateResult4, UseStateResult2_3 = ReactModule.useState(true)
	local UseLocalizationModuleResult = if GetFFlagAXLooksTranslationAuditModule() then UseLocalizationModule({
		goBack = "Feature.Avatar.Action.GoBack",
		next = "Feature.Avatar.Action.Next",
		previewAndPost = "Feature.Avatar.Action.ComposerPreviewAndPost",
		postHeader = "Feature.Avatar.Header.Post"
	}) else nil
	local UseSelectorResult = UseSelectorFunction(function(p1)
		-- upvalues: ConstantsModule (upval)
		return p1.AvatarExperience.AvatarScene.Looks[ConstantsModule.DraftLookId]
	end)
	local UseSelectorResult1 = UseSelectorFunction(v43)
	local UseStateResult5, UseStateResult2_4 = ReactModule.useState(false)
	local UseStateResult6, UseStateResult2_5 = ReactModule.useState(false)
	local IsNotUseSelectorResultMatch = UseSelectorFunction(function(p1)
		return p1.AvatarExperience.Common.ItemDetailsPeekView.tryOnManagerViewState
	end) ~= PeekViewState.Closed
	local UseRoactServiceModuleResult = UseRoactServiceModule(RoactNetworkingModule)
	ReactModule.useEffect(function()
		-- upvalues: UseDispatchResult (copy), SetTryOnManagerPeekViewStateFunction (upval), PeekViewState (upval), CreateDraftLookModule (upval), UseRoactServiceModuleResult (copy), UseStateResult2_2 (copy), NavigationUtilsModule (upval), UseNavigationResult (copy)
		UseDispatchResult(SetTryOnManagerPeekViewStateFunction(PeekViewState.Closed))
		UseDispatchResult(CreateDraftLookModule(UseRoactServiceModuleResult)):andThen(function(Result)
			-- upvalues: UseStateResult2_2 (upval), NavigationUtilsModule (upval), UseNavigationResult (upval)
			if Result then
				UseStateResult2_2(false)
				
				return
			else
				NavigationUtilsModule.closeLookComposer(UseNavigationResult)
			end
		end)
	end, {})
	local _Color3 = if UseSelectorResult and UseSelectorResult.displayProperties and UseSelectorResult.displayProperties.backgroundType == "Hex" then Color3.fromHex(UseSelectorResult.displayProperties.backgroundValue) else UseStyleResult.Theme.PlaceHolder.Color
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: AXLookComposerStepsRefactor (upval), UseStateResult2_1 (copy), List (upval), UseStateResult1 (copy), GetFFlagAXLookComposerBackgroundsEnabledModule (upval)
		if AXLookComposerStepsRefactor then
			UseStateResult2_1(function(Value)
				-- upvalues: List (upval)
				local FoundIndex: number? = table.find(List, Value)
				
				return List[if FoundIndex then FoundIndex - 1 else 1]
			end)
			
			return
		end
		if UseStateResult1 == "ApplyBackground" then
			UseStateResult2_1("ApplyEmote")
			
			return
		end
		if UseStateResult1 == "EditInfo" then
			if GetFFlagAXLookComposerBackgroundsEnabledModule() then
				UseStateResult2_1("ApplyBackground")
				
				return
			end
			UseStateResult2_1("ApplyEmote")
		end
	end, if AXLookComposerStepsRefactor then {} else { UseStateResult1 })
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: UseResult (copy), GetFFlagAXLooksTranslationAuditModule (upval), UseLocalizationModuleResult (copy)
		return {
			props = {
				onActivated = UseResult,
				text = if GetFFlagAXLooksTranslationAuditModule() then UseLocalizationModuleResult.goBack else "Go Back"
			}
		}
	end, { UseResult })
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: AXLookComposerStepsRefactor (upval), UseStateResult1 (copy), List (upval), UseDispatchResult (copy), DraftLookFinalPreviewModule (upval), UseNavigationResult (copy), UseStateResult2_1 (copy), GetFFlagAXLookComposerBackgroundsEnabledModule (upval)
		if AXLookComposerStepsRefactor then
			if UseStateResult1 == List[#List] then
				UseDispatchResult(DraftLookFinalPreviewModule(UseNavigationResult))
				
				return
			else
				UseStateResult2_1(function(Value)
					-- upvalues: List (upval)
					local FoundIndex: number? = table.find(List, Value)
					
					return List[if FoundIndex then FoundIndex + 1 else 1]
				end)
				
				return
			end
		elseif UseStateResult1 == "ApplyEmote" then
			if GetFFlagAXLookComposerBackgroundsEnabledModule() then
				UseStateResult2_1("ApplyBackground")
				
				return
			else
				UseStateResult2_1("EditInfo")
				
				return
			end
		elseif UseStateResult1 == "ApplyBackground" then
			UseStateResult2_1("EditInfo")
			
			return
		else
			if UseStateResult1 == "EditInfo" then
				UseDispatchResult(DraftLookFinalPreviewModule(UseNavigationResult))
			end
		end
	end, { UseStateResult1 })
	local UseMemoResult1 = ReactModule.useMemo(function()
		-- upvalues: ButtonType (upval), UseResult1 (copy), AXLookComposerStepsRefactor (upval), UseStateResult1 (copy), List (upval), UseLocalizationModuleResult (copy), GetFFlagAXLooksTranslationAuditModule (upval), UseStateResult4 (copy)
		return {
			isDefaultChild = true,
			buttonType = ButtonType.PrimarySystem,
			props = {
				onActivated = UseResult1,
				text = if AXLookComposerStepsRefactor then if UseStateResult1 == List[#List] then UseLocalizationModuleResult.previewAndPost else UseLocalizationModuleResult.next elseif GetFFlagAXLooksTranslationAuditModule() then if UseStateResult1 == "EditInfo" then UseLocalizationModuleResult.previewAndPost else UseLocalizationModuleResult.next elseif UseStateResult1 == "EditInfo" then "Preview & Share" else "Next",
				isDisabled = if UseStateResult1 == "EditInfo" then UseStateResult4 else nil
			}
		}
	end, { UseResult1, UseStateResult4 })
	local UseResult2 = ReactModule.useCallback(function()
		-- upvalues: UseNavigationResult (copy), AppPageModule (upval), AXFixLookComposerExitPrompt (upval), NavigationUtilsModule (upval)
		local PrevNavPageParam = UseNavigationResult.getParam("prevNavPage") or AppPageModule.Home
		
		if AXFixLookComposerExitPrompt then
			NavigationUtilsModule.closeFocusedScreen(UseNavigationResult)
		end
		NavigationUtilsModule.closeLookComposer(UseNavigationResult)
		UseNavigationResult.navigate(PrevNavPageParam)
	end, { UseNavigationResult })
	local UseSelectorResult1_1 = UseSelectorResult1 or (UseStateResult5 or UseStateResult6)
	local UseResult3 = ReactModule.useCallback(function()
		-- upvalues: UseSelectorResult1_1 (copy), UseNavigationResult (copy), AvatarScreen (upval), UseResult2 (copy)
		if UseSelectorResult1_1 then
			UseNavigationResult.navigate(AvatarScreen.LooksConfirmationPrompt, { onOverlayClosed = UseResult2 })
			
			return
		end
		if UseResult2 then
			UseResult2()
		end
	end, { UseNavigationResult, UseSelectorResult1_1, UseResult2 })
	
	return ReactModule.createElement(Focusable.Frame, {
		BackgroundTransparency = 1,
		Size = UDim2.fromScale(1, 1),
		focusController = if FFlagAXMigrateAXToGlobalAutofocus then nil else Current
	}, {
		AvatarExperienceView = ReactModule.createElement(AvatarExperienceViewModule, {
			bottomBarEnabled = false,
			allowAdaptiveScrolling = false,
			isSceneFullView = false,
			isUIFullView = false,
			topBar = ReactModule.createElement(TopBarModule.Container, {
				transparentBackground = false,
				titleText = if GetFFlagAXLooksTranslationAuditModule() then UseLocalizationModuleResult.postHeader else "Post",
				leftItem = ReactModule.useCallback(function()
					-- upvalues: v42 (upval), UseResult3 (copy)
					return v42({ onActivated = UseResult3 })
				end, { UseResult3 })
			}),
			sceneUi = ReactModule.useMemo(function()
				-- upvalues: ReactModule (upval), UseStyleResult (copy), _Color3 (copy), UseSelectorResult (copy), LookViewportModule (upval)
				return ReactModule.createElement("Frame", {
					BorderSizePixel = 1,
					BackgroundTransparency = 0,
					Size = UDim2.fromScale(1, 1),
					BorderColor3 = UseStyleResult.Theme.BackgroundDefault.Color,
					BackgroundColor3 = UseStyleResult.Theme.BackgroundDefault.Color
				}, {
					ThumbnailBackground = ReactModule.createElement("Frame", {
						BorderSizePixel = 1,
						Size = UDim2.fromScale(1, 1),
						BorderColor3 = _Color3,
						BackgroundColor3 = _Color3,
						BackgroundTransparency = UseStyleResult.Theme.PlaceHolder.Transparency
					}, {
						LookViewport = if UseSelectorResult then ReactModule.createElement(LookViewportModule, { lookDetails = UseSelectorResult }) else nil
					})
				})
			end, { _Color3, UseSelectorResult }),
			showRobuxBalance = config[UseStateResult1]
		}, {
			Overlay = IsNotUseSelectorResultMatch and ReactModule.createElement("Frame", {
				ZIndex = 2,
				BackgroundTransparency = UseStyleResult.Theme.Overlay.Transparency,
				BackgroundColor3 = UseStyleResult.Theme.Overlay.Color,
				Size = UDim2.fromScale(1, 1)
			}),
			Content = ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 1, -UseStateResult.Y)
			}, {
				LoadingFrame = UseStateResult3 and ReactModule.createElement("Frame", {
					BorderSizePixel = 0,
					Size = UDim2.fromScale(1, 1),
					BackgroundColor3 = UseStyleResult.Theme.BackgroundDefault.Color
				}, {
					LoadingSpinner = ReactModule.createElement(Loading, {
						Position = UDim2.fromScale(0.5, 0.5),
						size = IconSize.Large,
						AnchorPoint = Vector2.new(0.5, 0.5)
					})
				}),
				Content = not UseStateResult3 and ReactModule.createElement(ReactModule.Fragment, {}, {
					EmotePicker = UseStateResult1 == "ApplyEmote" and ReactModule.createElement(LookEmotePickerModule),
					BackgroundPicker = UseStateResult1 == "ApplyBackground" and ReactModule.createElement(LookBackgroundPickerModule),
					InfoForm = UseStateResult1 == "EditInfo" and ReactModule.createElement(LookInfoFormModule, {
						interactable = not IsNotUseSelectorResultMatch,
						disableNextButton = function(p1)
							-- upvalues: UseStateResult2_3 (copy)
							UseStateResult2_3(p1)
						end,
						onTitleChange = function(p1)
							-- upvalues: UseStateResult2_4 (copy)
							UseStateResult2_4(string.len((trimWhitespaceFromString(p1))) ~= 0)
						end,
						onSubtitleChange = function(p1)
							-- upvalues: UseStateResult2_5 (copy)
							UseStateResult2_5(string.len((trimWhitespaceFromString(p1))) ~= 0)
						end
					})
				})
			}),
			ActionBarBackground = ReactModule.createElement("Frame", {
				BorderSizePixel = 0,
				ZIndex = 0,
				AnchorPoint = Vector2.new(0, 1),
				Position = UDim2.fromScale(0, 1),
				Size = UDim2.new(1, 0, 0, UseStateResult.Y),
				BackgroundColor3 = UseStyleResult.Theme.BackgroundDefault.Color
			}),
			ActionBar = not UseStateResult3 and (not IsNotUseSelectorResultMatch and ReactModule.createElement(ActionBar, {
				onAbsoluteSizeChanged = function(p1)
					-- upvalues: UseStateResult2 (copy)
					UseStateResult2(p1 + Vector2.new(0, 12))
				end
			}, {
				ButtonStack = ReactModule.createElement(ButtonStack, {
					buttons = if UseStateResult1 == Entry then { UseMemoResult1 } else { UseMemoResult, UseMemoResult1 }
				})
			}))
		})
	})
end