local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local UserInputService = game:GetService("UserInputService")
local ReactModule = require(CorePackages.Packages.React)
local UseDispatchFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch
local UseDesignTokensFunction = require(CorePackages.Workspace.Packages.Style).useDesignTokens
local UseSelectorFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local FFlagRenameDeprecatedUIBloxTokens = require(CorePackages.Workspace.Packages.SharedFlags).FFlagRenameDeprecatedUIBloxTokens
local SetCurrentToastMessageModule = require(Modules.LuaApp.Actions.SetCurrentToastMessage)
local ToastTypeModule = require(Modules.LuaApp.Enum.ToastType)
local ConstantsModule = require(Modules.AvatarExperience.Common.Constants)
local UpdateLookDetailsModule = require(Modules.AvatarExperience.Common.Actions.UpdateLookDetails)
local UseLocalizationModule = require(Modules.LuaApp.Hooks.useLocalization)
local UseStyleFunction = require(CorePackages.Packages.UIBlox).Core.Style.useStyle
local ExternalEventConnection = require(CorePackages.Workspace.Packages.RoactUtils).ExternalEventConnection
local GetFFlagAXLooksTranslationAuditModule = require(Modules.AvatarExperience.Flags.GetFFlagAXLooksTranslationAudit)
local AXFormPositionWhenKeyboardVisible = game:DefineFastString("AXFormPositionWhenKeyboardVisible", "-0.4")
local SelectIsPortraitModule = require(Modules.AvatarExperience.Common.Selectors.selectIsPortrait)
local config = {
	toastMessage = "Feature.Avatar.Toast.AvatarTitleExceedMaximum",
	isLocalized = false,
	toastType = ToastTypeModule.InformationMessage
}
local config1 = {
	toastMessage = "Feature.Avatar.Toast.AvatarCaptionExceedMaximum",
	isLocalized = false,
	toastType = ToastTypeModule.InformationMessage
}

local function _(p1, p2): number
	return tonumber(p1) or p2
end

return function(p1)
	-- upvalues: UseDispatchFunction (copy), UseStyleFunction (copy), ReactModule (copy), UseDesignTokensFunction (copy), GetFFlagAXLooksTranslationAuditModule (copy), UseLocalizationModule (copy), UseSelectorFunction (copy), ConstantsModule (copy), SelectIsPortraitModule (copy), UpdateLookDetailsModule (copy), SetCurrentToastMessageModule (copy), config (copy), config1 (copy), UserInputService (copy), AXFormPositionWhenKeyboardVisible (copy), ExternalEventConnection (copy), FFlagRenameDeprecatedUIBloxTokens (copy)
	local UseDispatchResult = UseDispatchFunction()
	local UseStyleResult = UseStyleFunction()
	local UseRefResult = ReactModule.useRef(nil)
	local UseRefResult1 = ReactModule.useRef(nil)
	local UseDesignTokensResult = UseDesignTokensFunction()
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(UDim2.new(0, 0, 0, 0))
	local UseRefResult2 = ReactModule.useRef(nil)
	local UseLocalizationModuleResult = if GetFFlagAXLooksTranslationAuditModule() then UseLocalizationModule({
		avatarTitle = "Feature.Avatar.Placeholder.NameYourAvatar",
		describeAvatar = "Feature.Avatar.Placeholder.WriteAvatarCaption"
	}) else nil
	local UseSelectorResult = UseSelectorFunction(function(p2)
		-- upvalues: ConstantsModule (upval)
		return p2.AvatarExperience.AvatarScene.Looks[ConstantsModule.DraftLookId]
	end)
	local UseSelectorResult1 = UseSelectorFunction(SelectIsPortraitModule)
	ReactModule.useEffect(function()
		-- upvalues: UseSelectorResult (copy), UseRefResult (copy), UseRefResult1 (copy)
		if UseSelectorResult and UseRefResult.current and UseRefResult1.current then
			UseRefResult.current.Text = UseSelectorResult.name or ""
			UseRefResult1.current.Text = UseSelectorResult.description or ""
		end
	end, { UseSelectorResult, UseRefResult, UseRefResult1 })
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult (copy)
		if UseRefResult.current then
			UseRefResult.current:CaptureFocus()
		end
	end, {})
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseRefResult (copy), UseRefResult1 (copy), UseDispatchResult (copy), UpdateLookDetailsModule (upval), ConstantsModule (upval)
		if UseRefResult.current and UseRefResult1.current then
			UseDispatchResult(UpdateLookDetailsModule(ConstantsModule.DraftLookId, {
				name = UseRefResult.current.Text,
				description = UseRefResult1.current.Text
			}))
		end
	end, { UseRefResult, UseRefResult1, UseDispatchResult })
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: UseRefResult (copy), UseRefResult1 (copy), p1 (copy), UseDispatchResult (copy), SetCurrentToastMessageModule (upval), config (upval), config1 (upval)
		local Length: number = if UseRefResult and UseRefResult.current then string.len(UseRefResult.current.Text) else 0
		local Length1: number = if UseRefResult1 and UseRefResult1.current then string.len(UseRefResult1.current.Text) else 0
		local IsLengthBelow: boolean = Length >= 1 and Length <= 50
		local IsLengthBelow1 = Length1 < 1001
		
		if p1.disableNextButton then
			p1.disableNextButton(not (IsLengthBelow and IsLengthBelow1))
		end
		if Length > 50 then
			UseDispatchResult(SetCurrentToastMessageModule(config))
		end
		if Length1 >= 1001 then
			UseDispatchResult(SetCurrentToastMessageModule(config1))
		end
	end, {
		UseSelectorResult,
		UseRefResult,
		UseRefResult1,
		UseDispatchResult
	})
	local UseResult2 = ReactModule.useCallback(function()
		-- upvalues: p1 (copy), UseRefResult (copy), UseResult1 (copy)
		if p1.onTitleChange and UseRefResult and UseRefResult.current then
			p1.onTitleChange(UseRefResult.current.Text)
		end
		if UseResult1 then
			UseResult1()
		end
	end, { UseRefResult, p1.onTitleChange, UseResult1 })
	local UseResult3 = ReactModule.useCallback(function()
		-- upvalues: p1 (copy), UseRefResult1 (copy), UseResult1 (copy)
		if p1.onSubtitleChange and UseRefResult1 and UseRefResult1.current then
			p1.onSubtitleChange(UseRefResult1.current.Text)
		end
		if UseResult1 then
			UseResult1()
		end
	end, { UseRefResult1, p1.onSubtitleChange, UseResult1 })
	local UseResult4 = ReactModule.useCallback(function()
		-- upvalues: UseStateResult2 (copy), UserInputService (upval)
		UseStateResult2(function(OnScreenKeyboardVisible)
			-- upvalues: UserInputService (upval)
			return if OnScreenKeyboardVisible == UserInputService.OnScreenKeyboardVisible then OnScreenKeyboardVisible else UserInputService.OnScreenKeyboardVisible
		end)
	end, { UseSelectorResult1 })
	ReactModule.useEffect(function()
		-- upvalues: UseSelectorResult1 (copy), AXFormPositionWhenKeyboardVisible (upval), UseStateResult (copy), UseStateResult2_1 (copy)
		if UseSelectorResult1 then
			local Number: number = tonumber(AXFormPositionWhenKeyboardVisible) or -0.4
			UseStateResult2_1(if UseStateResult then UDim2.new(0, 0, Number, 0) else UDim2.new(0, 0, 0, 0))
			
			return
		end
	end, { UseStateResult, UseSelectorResult1 })
	
	return ReactModule.createElement("Frame", {
		BorderSizePixel = 0,
		ClipsDescendants = true,
		Size = UDim2.fromScale(1, 1),
		BackgroundColor3 = UseStyleResult.Theme.BackgroundDefault.Color,
		Position = if UseSelectorResult1 then UseStateResult1 else nil,
		ref = if UseSelectorResult1 then UseRefResult2 else nil
	}, {
		KeyboardConnection = if UseSelectorResult1 then ReactModule.createElement(ExternalEventConnection, {
			event = UserInputService:GetPropertyChangedSignal("OnScreenKeyboardVisible"),
			callback = UseResult4
		}) else nil,
		Padding = ReactModule.createElement("UIPadding", {
			PaddingTop = UDim.new(0, if FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Size.Size_300 else UseDesignTokensResult.Global.Space_150),
			PaddingBottom = UDim.new(0, if FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Size.Size_300 else UseDesignTokensResult.Global.Space_150),
			PaddingLeft = UDim.new(0, if FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Size.Size_300 else UseDesignTokensResult.Global.Space_150),
			PaddingRight = UDim.new(0, if FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Size.Size_300 else UseDesignTokensResult.Global.Space_150)
		}),
		ListLayout = ReactModule.createElement("UIListLayout", {
			Padding = UDim.new(0, if FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Size.Size_300 else UseDesignTokensResult.Global.Space_150),
			SortOrder = Enum.SortOrder.LayoutOrder
		}),
		NameBox = ReactModule.createElement("TextBox", {
			ref = UseRefResult,
			Size = UDim2.fromScale(1, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			BackgroundTransparency = 1,
			Font = UseStyleResult.Font.Header2.Font,
			ClearTextOnFocus = false,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextSize = UseStyleResult.Font.BaseSize * UseStyleResult.Font.Header2.RelativeSize,
			TextColor3 = UseStyleResult.Theme.TextEmphasis.Color,
			PlaceholderColor3 = UseStyleResult.Theme.TextDefault.Color,
			PlaceholderText = if GetFFlagAXLooksTranslationAuditModule() then UseLocalizationModuleResult.avatarTitle else "Name your Avatar",
			Interactable = p1.interactable,
			LayoutOrder = 1,
			[ReactModule.Event.FocusLost] = UseResult,
			[ReactModule.Change.Text] = UseResult2
		}),
		Spacer = ReactModule.createElement("Frame", {
			BorderSizePixel = 0,
			LayoutOrder = 2,
			Size = UDim2.new(1, 0, 0, 1),
			BackgroundColor3 = UseStyleResult.Theme.Divider.Color,
			BackgroundTransparency = UseStyleResult.Theme.Divider.Transparency
		}),
		DescriptionBox = ReactModule.createElement("TextBox", {
			ref = UseRefResult1,
			BackgroundTransparency = 1,
			Size = UDim2.fromScale(1, 1),
			AutomaticSize = Enum.AutomaticSize.Y,
			MultiLine = true,
			ClearTextOnFocus = false,
			Font = UseStyleResult.Font.Body.Font,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextSize = UseStyleResult.Font.BaseSize * UseStyleResult.Font.Body.RelativeSize,
			TextColor3 = UseStyleResult.Theme.TextDefault.Color,
			TextYAlignment = Enum.TextYAlignment.Top,
			TextWrapped = true,
			PlaceholderColor3 = UseStyleResult.Theme.TextDefault.Color,
			PlaceholderText = if GetFFlagAXLooksTranslationAuditModule() then UseLocalizationModuleResult.describeAvatar else "Describe your Avatar (Optional)",
			Interactable = p1.interactable,
			LayoutOrder = 3,
			[ReactModule.Event.FocusLost] = UseResult,
			[ReactModule.Change.Text] = UseResult3
		})
	})
end