local Foundation = script:FindFirstAncestor("Foundation")
local ReactModule = require(Foundation.Parent.React)
local BaseTileContentModule = require(script.Parent.BaseTileContent)
local BaseTileMediaModule = require(script.Parent.BaseTileMedia)
local CornerRadiusModule = require(Foundation.Components.CornerRadius)
local _ = require(Foundation.Components.Types)
local GetTestIdTagModule = require(Foundation.Utility.getTestIdTag)
local JoinBindablesModule = require(Foundation.Utility.joinBindables)
local MapBindableModule = require(Foundation.Utility.mapBindable)
local UseCursorModule = require(Foundation.Providers.Cursor.useCursor)
local UseGuiControlStateModule = require(Foundation.Utility.Control.useGuiControlState)
local UseTokensModule = require(Foundation.Providers.Style.useTokens)
local WithDefaultsModule = require(Foundation.Utility.withDefaults)

local function _(Vector): boolean
	return Vector.Y.Scale ~= 0 or Vector.Y.Offset ~= 0
end

local config = {
	isContained = false,
	testId = "--foundation-base-tile",
	mediaAspectRatio = require(Foundation.Enums.TileAspectRatio).Ratio16x9
}

return ReactModule.memo(ReactModule.forwardRef(function(p1, p2)
	-- upvalues: WithDefaultsModule (copy), config (copy), UseTokensModule (copy), UseCursorModule (copy), MapBindableModule (copy), ReactModule (copy), JoinBindablesModule (copy), UseGuiControlStateModule (copy), GetTestIdTagModule (copy), CornerRadiusModule (copy), BaseTileMediaModule (copy), BaseTileContentModule (copy)
	local WithDefaultsModuleResult = WithDefaultsModule(p1, config)
	local UseTokensModuleResult = UseTokensModule()
	local UseCursorModuleResult = UseCursorModule({
		radius = UDim.new(0, UseTokensModuleResult.Radius.Medium),
		offset = UseTokensModuleResult.Size.Size_200,
		borderWidth = UseTokensModuleResult.Stroke.Thicker
	})
	local Size = WithDefaultsModuleResult.Size or UDim2.fromOffset(250 * UseTokensModuleResult.Config.UI.Scale, 0)
	local MapBindableModuleResult = MapBindableModule(Size, function(Vector)
		local IsNotScaleMatch: boolean = Vector.Y.Scale ~= 0 or Vector.Y.Offset ~= 0
		
		return if IsNotScaleMatch then Enum.AutomaticSize.None else Enum.AutomaticSize.Y
	end)
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(0)
	local UseBindingResult1, UseBindingResult2_1 = ReactModule.useBinding(0)
	local IsNotUDim2: boolean = typeof(Size) ~= "UDim2" or Size.Y.Scale ~= 0 or Size.Y.Offset ~= 0
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: IsNotUDim2 (copy), JoinBindablesModule (upval), Size (copy), UseBindingResult (copy), UseBindingResult1 (copy)
		return if IsNotUDim2 then JoinBindablesModule({
			size = Size,
			tileHeight = UseBindingResult,
			contentHeight = UseBindingResult1
		}, function(p3)
			local Size = p3.size
			local IsNotScaleMatch: boolean = Size.Y.Scale ~= 0 or Size.Y.Offset ~= 0
			
			return if IsNotScaleMatch then math.max(p3.tileHeight - p3.contentHeight, 0) else nil
		end) else nil
	end, { Size, IsNotUDim2 })
	local OnAbsoluteSizeChangedFunction = WithDefaultsModuleResult.onAbsoluteSizeChanged
	local UseResult = ReactModule.useCallback(function(Frame)
		-- upvalues: UseBindingResult2 (copy), OnAbsoluteSizeChangedFunction (copy)
		UseBindingResult2(Frame.AbsoluteSize.Y)
		
		if OnAbsoluteSizeChangedFunction ~= nil then
			OnAbsoluteSizeChangedFunction(Frame)
		end
	end, { OnAbsoluteSizeChangedFunction })
	local UseResult1 = ReactModule.useCallback(function(Frame)
		-- upvalues: UseBindingResult2_1 (copy)
		UseBindingResult2_1(Frame.AbsoluteSize.Y)
	end, {})
	local OnActivated = WithDefaultsModuleResult.onActivated
	local OnSecondaryActivated = WithDefaultsModuleResult.onSecondaryActivated
	local OnStateChanged = WithDefaultsModuleResult.onStateChanged
	local HasOnActivated: boolean = OnActivated ~= nil or OnSecondaryActivated ~= nil
	local HasOnStateChanged = OnStateChanged ~= nil
	local ContainedBackgroundStyle = if WithDefaultsModuleResult.isContained then WithDefaultsModuleResult.containedBackgroundStyle or UseTokensModuleResult.Color.Shift.Shift_200 else nil
	local UseGuiControlStateModuleResult = UseGuiControlStateModule(if HasOnStateChanged then p2 else nil, OnStateChanged)
	local HasOnActivated1: boolean = HasOnActivated or HasOnStateChanged
	local config1 = {
		AnchorPoint = WithDefaultsModuleResult.AnchorPoint,
		AutomaticSize = MapBindableModuleResult,
		BackgroundColor3 = if ContainedBackgroundStyle == nil then nil else MapBindableModule(ContainedBackgroundStyle, function(p3)
			return p3.Color3
		end),
		BackgroundTransparency = if ContainedBackgroundStyle == nil then 1 else MapBindableModule(ContainedBackgroundStyle, function(p3)
			return p3.Transparency
		end),
		BorderSizePixel = 0,
		LayoutOrder = WithDefaultsModuleResult.LayoutOrder,
		Position = WithDefaultsModuleResult.Position,
		Size = Size,
		Visible = WithDefaultsModuleResult.Visible,
		ZIndex = WithDefaultsModuleResult.ZIndex,
		ref = if HasOnStateChanged then UseGuiControlStateModuleResult else p2,
		[ReactModule.Change.AbsoluteSize] = if IsNotUDim2 then UseResult else OnAbsoluteSizeChangedFunction,
		[ReactModule.Change.AbsolutePosition] = WithDefaultsModuleResult.onAbsolutePositionChanged,
		[ReactModule.Tag] = GetTestIdTagModule(WithDefaultsModuleResult.testId)
	}
	
	if HasOnActivated1 then
		config1.Active = HasOnActivated
		config1.AutoButtonColor = false
		config1.Selectable = HasOnActivated
		config1.SelectionImageObject = UseCursorModuleResult
		config1.Text = ""
		config1[ReactModule.Event.Activated] = OnActivated
		config1[ReactModule.Event.SecondaryActivated] = OnSecondaryActivated
	end
	return ReactModule.createElement(if HasOnActivated1 then "TextButton" else "Frame", config1, {
		Corner = ReactModule.createElement(CornerRadiusModule, { value = UDim.new(0, UseTokensModuleResult.Radius.Medium) }),
		Layout = ReactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			SortOrder = Enum.SortOrder.LayoutOrder
		}),
		Media = ReactModule.createElement(BaseTileMediaModule, {
			LayoutOrder = 1,
			content = WithDefaultsModuleResult.mediaContent,
			aspectRatio = WithDefaultsModuleResult.mediaAspectRatio,
			backgroundStyle = WithDefaultsModuleResult.mediaBackgroundStyle or UseTokensModuleResult.Color.Shift.Shift_200,
			isContained = WithDefaultsModuleResult.isContained,
			tileSize = Size,
			maxHeight = UseMemoResult,
			testId = `{WithDefaultsModuleResult.testId}--media`
		}),
		Content = ReactModule.createElement(BaseTileContentModule, {
			LayoutOrder = 2,
			title = WithDefaultsModuleResult.title,
			metadata = WithDefaultsModuleResult.metadata,
			contentAction = WithDefaultsModuleResult.contentAction,
			footer = WithDefaultsModuleResult.footer,
			isContained = WithDefaultsModuleResult.isContained,
			onAbsoluteSizeChanged = if IsNotUDim2 then UseResult1 else nil,
			testId = WithDefaultsModuleResult.testId
		})
	})
end))