local HttpService = game:GetService("HttpService")
local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local FFlagRenameDeprecatedUIBloxTokens = require(CorePackages.Workspace.Packages.SharedFlags).FFlagRenameDeprecatedUIBloxTokens
local ExpandableTextArea = UIBloxModule.App.Text.ExpandableTextArea
local GetCanExpandFunction = UIBloxModule.Core.Text.ExpandableText.GetCanExpand
local UseDesignTokensFunction = require(CorePackages.Workspace.Packages.Style).useDesignTokens
local RetrievalStatus = UIBloxModule.App.Loading.Enum.RetrievalStatus
local StyledTextLabel = UIBloxModule.App.Text.StyledTextLabel
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local UseLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).Hooks.useLocalization
local GetTextSizeFunction = require(CorePackages.Workspace.Packages.Style).GetTextSize
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ExperienceDetailsPanelModule = require(Modules.LuaApp.Components.ExperienceDetails.ExperienceDetailsPanel)
local SendExpandableTextImpressionEventModule = require(Modules.LuaApp.Components.ExperienceDetails.sendExpandableTextImpressionEvent)
local ContentThresholdImpressionsDetector = require(CorePackages.Workspace.Packages.Impressions).ContentThresholdImpressionsDetector
local UseAppPolicyModule = require(Modules.LuaApp.Hooks.useAppPolicy)
local FFlagExperienceDetailsTextUseTokensModule = require(script.Parent.Flags.FFlagExperienceDetailsTextUseTokens)
local FFlagLuaAppExpandableTextImpressionsEnabled = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppExpandableTextImpressionsEnabled
local LuaAppFixDescriptionImpressionExpanded = game:DefineFastFlag("LuaAppFixDescriptionImpressionExpanded", false)
local UseCursorFunction = require(CorePackages.Packages.Foundation).Hooks.useCursor
local Thresholds = { 0.01, 0.5, 1 }

local function NOOP_NEEDED_FOR_SELECTION() end

return function(Frame)
	-- upvalues: UseCursorFunction (copy), UseStyleFunction (copy), UseLocalizationFunction (copy), UseAppPolicyModule (copy), UseDesignTokensFunction (copy), RetrievalStatus (copy), FFlagRenameDeprecatedUIBloxTokens (copy), FFlagExperienceDetailsTextUseTokensModule (copy), ReactModule (copy), FFlagLuaAppExpandableTextImpressionsEnabled (copy), GetTextSizeFunction (copy), LuaAppFixDescriptionImpressionExpanded (copy), GetCanExpandFunction (copy), SendExpandableTextImpressionEventModule (copy), HttpService (copy), ExpandableTextArea (copy), StyledTextLabel (copy), NOOP_NEEDED_FOR_SELECTION (copy), ContentThresholdImpressionsDetector (copy), Thresholds (copy), ExperienceDetailsPanelModule (copy)
	local RoundedRect = UseCursorFunction("RoundedRect")
	local UseStyleResult = UseStyleFunction()
	local UseLocalizationResult = UseLocalizationFunction({
		DescriptionTitle = "Feature.ExperienceDetails.Body.DescriptionTitle"
	})
	local UseAppPolicyModuleResult = UseAppPolicyModule(function(p1)
		return p1.enableExperienceDetailsPanel()
	end)
	local UseDesignTokensResult = UseDesignTokensFunction(function(p1)
		return if p1 then p1.LuaApps.ExperienceDetails.PanelWidthScale else 1
	end)
	local UseDesignTokensResult1 = UseDesignTokensFunction(function(p1)
		return if p1 then p1.LuaApps.ExperienceDetails.PanelInnerPadding else 0
	end)
	local IsDataStatusMatch = Frame.dataStatus == RetrievalStatus.Done
	local v1: boolean = Frame.descriptionText and #Frame.descriptionText > 0
	local UseDesignTokensResult2 = UseDesignTokensFunction(function(p1)
		-- upvalues: FFlagRenameDeprecatedUIBloxTokens (upval)
		return if FFlagRenameDeprecatedUIBloxTokens then p1.Typography.BodyLarge else p1.Semantic.Typography.Body
	end)
	local UseDesignTokensResult3 = UseDesignTokensFunction(function(p1)
		-- upvalues: FFlagRenameDeprecatedUIBloxTokens (upval)
		return if FFlagRenameDeprecatedUIBloxTokens then p1.Typography.HeadingSmall else p1.Semantic.Typography.Header
	end)
	local FontSize = nil
	local UseDesignTokensResultFont = nil
	local LineHeight = UseDesignTokensResult2.LineHeight
	
	if FFlagExperienceDetailsTextUseTokensModule then
		FontSize = UseDesignTokensResult2.FontSize
		UseDesignTokensResultFont = UseDesignTokensResult2.Font
	else
		FontSize = UseStyleResult.Font.BaseSize * UseStyleResult.Font.Body.RelativeSize
		UseDesignTokensResultFont = UseStyleResult.Font.Body.Font
	end
	local UseStateResult, UseStateResult2 = ReactModule.useState(0)
	local X = UseStateResult * UseDesignTokensResult
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: v1 (copy), FFlagLuaAppExpandableTextImpressionsEnabled (upval), UseAppPolicyModuleResult (copy), GetTextSizeFunction (upval), Frame (copy), FontSize (ref), UseDesignTokensResultFont (ref), X (copy), LineHeight (copy)
		if v1 and (FFlagLuaAppExpandableTextImpressionsEnabled or UseAppPolicyModuleResult) then
			local TextSize = GetTextSizeFunction(Frame.descriptionText, FontSize, UseDesignTokensResultFont, Vector2.new(X, 1e999))
			
			return if FFlagLuaAppExpandableTextImpressionsEnabled and Frame.expandable then TextSize.Y else TextSize.Y * LineHeight
		else
			return 0
		end
	end, {
		Frame.descriptionText, FontSize, UseDesignTokensResultFont, X,
		if FFlagLuaAppExpandableTextImpressionsEnabled then nil else UseAppPolicyModuleResult,
		LineHeight,
		if FFlagLuaAppExpandableTextImpressionsEnabled then Frame.expandable else nil,
		if FFlagLuaAppExpandableTextImpressionsEnabled then v1 else nil
	})
	local UseRefResult = nil
	local UseResult = nil
	
	if FFlagLuaAppExpandableTextImpressionsEnabled then
		UseRefResult = ReactModule.useRef(false)
		UseResult = ReactModule.useCallback(function()
			-- upvalues: UseRefResult (ref)
			UseRefResult.current = not UseRefResult.current
		end)
	end
	local UseRefResult1 = if LuaAppFixDescriptionImpressionExpanded and FFlagLuaAppExpandableTextImpressionsEnabled then ReactModule.useRef(nil) else nil
	local UseResult1 = if FFlagLuaAppExpandableTextImpressionsEnabled then ReactModule.useCallback(function(List)
		-- upvalues: LuaAppFixDescriptionImpressionExpanded (upval), Frame (copy), UseRefResult1 (ref), GetCanExpandFunction (upval), UseStyleResult (copy), SendExpandableTextImpressionEventModule (upval), UseRefResult (ref), HttpService (upval)
		local v2 = nil
		
		if LuaAppFixDescriptionImpressionExpanded and Frame.expandable then
			local X = UseRefResult1.current and UseRefResult1.current.AbsoluteSize.X or 0
			
			if X > 0 then
				v2 = GetCanExpandFunction(UseStyleResult.Font, X, Frame.descriptionText, 3)
			end
		end
		for _, value in List do
			SendExpandableTextImpressionEventModule({
				contentType = "description",
				impressionThreshold = value * 100,
				isButtonExpanded = if LuaAppFixDescriptionImpressionExpanded then if v2 then UseRefResult.current else nil elseif Frame.expandable then UseRefResult.current else nil,
				interactionUuid = HttpService:GenerateGUID(false),
				pageContext = Frame.pageContext,
				itemId = tonumber(Frame.universeId),
				componentType = Frame.componentType or "unknown"
			})
		end
	end, {
		if LuaAppFixDescriptionImpressionExpanded then Frame.descriptionText else nil,
		UseRefResult, Frame.expandable, Frame.componentType, Frame.pageContext,
		Frame.universeId,
		if LuaAppFixDescriptionImpressionExpanded then UseStyleResult.Font else nil
	}) else nil
	local ExperienceDescriptionName = if FFlagLuaAppExpandableTextImpressionsEnabled then `ExperienceDescription_{Frame.universeId}_{Frame.componentType}_{Frame.pageContext}` else nil
	
	if not LuaAppFixDescriptionImpressionExpanded then
		UseRefResult1 = if FFlagLuaAppExpandableTextImpressionsEnabled then ReactModule.useRef(nil) else nil
	end
	local UseRefResult2 = ReactModule.useRef(nil)
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult2 (copy), UseStateResult2 (copy)
		if UseRefResult2.current then
			UseStateResult2(UseRefResult2.current.AbsoluteSize.X)
		end
	end)
	
	if IsDataStatusMatch and v1 then
		local Element = if Frame.expandable then ReactModule.createElement(ExpandableTextArea, {
			Text = Frame.descriptionText,
			compactNumberOfLines = if LuaAppFixDescriptionImpressionExpanded then 3 else 3,
			padding = Vector2.new(0, 0),
			gradientColor = UseStyleResult.Theme.BackgroundContrast.Color,
			onClick = if FFlagLuaAppExpandableTextImpressionsEnabled then UseResult else nil
		}) else ReactModule.createElement(StyledTextLabel, {
			richText = false,
			fluidSizing = false,
			text = Frame.descriptionText,
			size = UDim2.new(UseDesignTokensResult, 0, 0, UseMemoResult),
			textYAlignment = Enum.TextYAlignment.Top,
			fontStyle = if FFlagExperienceDetailsTextUseTokensModule then UseDesignTokensResult2 else UseStyleResult.Font.Body,
			colorStyle = UseStyleResult.Theme.TextDefault,
			automaticSize = if UseAppPolicyModuleResult then nil else Enum.AutomaticSize.Y,
			lineHeight = LineHeight
		})
		local Frame1 = ReactModule.createElement("Frame", {
			ref = UseRefResult2,
			[ReactModule.Change.AbsoluteSize] = function(Frame)
				-- upvalues: UseStateResult2 (copy)
				UseStateResult2(Frame.AbsoluteSize.X)
			end,
			Size = UDim2.fromScale(1, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			BackgroundTransparency = 1,
			LayoutOrder = Frame.LayoutOrder,
			Selectable = true,
			[ReactModule.Event.SelectionGained] = NOOP_NEEDED_FOR_SELECTION,
			SelectionImageObject = RoundedRect
		}, {
			Padding = if UseAppPolicyModuleResult then ReactModule.createElement("UIPadding", {
				PaddingLeft = UDim.new(0, UseDesignTokensResult1),
				PaddingTop = UDim.new(0, UseDesignTokensResult1),
				PaddingRight = UDim.new(0, UseDesignTokensResult1),
				PaddingBottom = UDim.new(0, UseDesignTokensResult1)
			}) else nil,
			UIListLayout = ReactModule.createElement("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				FillDirection = Enum.FillDirection.Vertical,
				Padding = UDim.new(0, Frame.listPadding or 24)
			}),
			Title = if UseAppPolicyModuleResult then nil else ReactModule.createElement(StyledTextLabel, {
				richText = false,
				fluidSizing = false,
				text = Frame.headerText or UseLocalizationResult.DescriptionTitle,
				size = UDim2.fromScale(1, 0),
				fontStyle = if FFlagExperienceDetailsTextUseTokensModule then UseDesignTokensResult3 else UseStyleResult.Font.Header1,
				colorStyle = UseStyleResult.Theme.TextEmphasis,
				automaticSize = Enum.AutomaticSize.Y
			}),
			Description = if FFlagLuaAppExpandableTextImpressionsEnabled then ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 2,
				ref = UseRefResult1,
				Size = UDim2.fromScale(1, 0),
				AutomaticSize = Enum.AutomaticSize.Y
			}, { Body = Element }) else Element,
			ContentThresholdImpressionsDetector = if FFlagLuaAppExpandableTextImpressionsEnabled then ReactModule.createElement(ContentThresholdImpressionsDetector, {
				containerRef = UseRefResult1,
				fullContentHeight = UseMemoResult,
				thresholds = Thresholds,
				impressionsTag = ExperienceDescriptionName,
				sendImpressions = UseResult1,
				viewportBoundsOffset = Frame.viewportBoundsOffset
			}) else nil
		})
		
		return if UseAppPolicyModuleResult then ReactModule.createElement(ExperienceDetailsPanelModule, {
			title = Frame.headerText or UseLocalizationResult.DescriptionTitle,
			onFocusChanged = Frame.onFocusChanged
		}, Frame1) else Frame1
	else
		return nil
	end
end