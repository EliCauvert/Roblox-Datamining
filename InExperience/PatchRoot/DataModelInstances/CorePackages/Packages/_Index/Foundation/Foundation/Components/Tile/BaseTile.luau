local Foundation = script:FindFirstAncestor("Foundation")
local ReactModule = require(Foundation.Parent.React)
local BaseTileContentModule = require(script.Parent.BaseTileContent)
local BaseTileMediaModule = require(script.Parent.BaseTileMedia)
local BaseTileMediaClippingModule = require(Foundation.Enums.BaseTileMediaClipping)
local TileAspectRatioModule = require(Foundation.Enums.TileAspectRatio)
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
	mediaAspectRatio = TileAspectRatioModule.Ratio16x9,
	mediaClippingStyle = BaseTileMediaClippingModule.Default
}

return ReactModule.memo(ReactModule.forwardRef(function(p1, p2)
	-- upvalues: WithDefaultsModule (copy), config (copy), UseTokensModule (copy), ReactModule (copy), UseCursorModule (copy), MapBindableModule (copy), JoinBindablesModule (copy), UseGuiControlStateModule (copy), GetTestIdTagModule (copy), BaseTileMediaModule (copy), BaseTileContentModule (copy)
	local WithDefaultsModuleResult = WithDefaultsModule(p1, config)
	local UseTokensModuleResult = UseTokensModule()
	local UseCursorModuleResult = UseCursorModule((ReactModule.useMemo(function()
		-- upvalues: UseTokensModuleResult (copy)
		return {
			radius = UDim.new(0, UseTokensModuleResult.Radius.Medium),
			offset = UseTokensModuleResult.Size.Size_200,
			borderWidth = UseTokensModuleResult.Stroke.Thicker
		}
	end, { UseTokensModuleResult })))
	local Size = WithDefaultsModuleResult.Size or UDim2.fromOffset(250 * UseTokensModuleResult.Config.UI.Scale, 0)
	local MapBindableModuleResult = MapBindableModule(Size, function(Vector)
		local IsNotScaleMatch: boolean = Vector.Y.Scale ~= 0 or Vector.Y.Offset ~= 0
		
		return if IsNotScaleMatch then Enum.AutomaticSize.None else Enum.AutomaticSize.Y
	end)
	local IsNotUDim2: boolean = typeof(Size) ~= "UDim2" or Size.Y.Scale ~= 0 or Size.Y.Offset ~= 0
	local UseRefResult = ReactModule.useRef(nil)
	
	if IsNotUDim2 and UseRefResult.current == nil then
		local Binding, Binding2 = ReactModule.createBinding(0)
		local Binding1, Binding2_1 = ReactModule.createBinding(0)
		UseRefResult.current = {
			tileHeight = Binding,
			setTileHeight = Binding2,
			contentHeight = Binding1,
			setContentHeight = Binding2_1
		}
	end
	local OnAbsoluteSizeChangedFunction = WithDefaultsModuleResult.onAbsoluteSizeChanged
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: UseRefResult (copy), IsNotUDim2 (copy), JoinBindablesModule (upval), Size (copy), OnAbsoluteSizeChangedFunction (copy)
		local Current = UseRefResult.current
		
		return if IsNotUDim2 and Current ~= nil then {
			mediaMaxHeight = JoinBindablesModule({
				size = Size,
				tileHeight = Current.tileHeight,
				contentHeight = Current.contentHeight
			}, function(Current)
				local Size = Current.size
				local IsNotScaleMatch: boolean = Size.Y.Scale ~= 0 or Size.Y.Offset ~= 0
				
				return if IsNotScaleMatch then math.max(Current.tileHeight - Current.contentHeight, 0) else nil
			end),
			onTileAbsoluteSizeChanged = function(Frame)
				-- upvalues: Current (copy), OnAbsoluteSizeChangedFunction (upval)
				Current.setTileHeight(Frame.AbsoluteSize.Y)
				
				if OnAbsoluteSizeChangedFunction ~= nil then
					OnAbsoluteSizeChangedFunction(Frame)
				end
			end,
			onContentAbsoluteSizeChanged = function(Frame)
				-- upvalues: Current (copy)
				Current.setContentHeight(Frame.AbsoluteSize.Y)
			end
		} else nil
	end, { Size, IsNotUDim2, OnAbsoluteSizeChangedFunction })
	local OnActivated = WithDefaultsModuleResult.onActivated
	local OnSecondaryActivated = WithDefaultsModuleResult.onSecondaryActivated
	local OnStateChanged = WithDefaultsModuleResult.onStateChanged
	local HasOnActivated: boolean = OnActivated ~= nil or OnSecondaryActivated ~= nil
	local HasMinSize: boolean = WithDefaultsModuleResult.minSize ~= nil or WithDefaultsModuleResult.maxSize ~= nil
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
		[ReactModule.Change.AbsoluteSize] = if UseMemoResult == nil then OnAbsoluteSizeChangedFunction else UseMemoResult.onTileAbsoluteSizeChanged,
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
		Corner = ReactModule.createElement("UICorner", {
			CornerRadius = UDim.new(0, UseTokensModuleResult.Radius.Medium)
		}),
		SizeConstraint = if HasMinSize then ReactModule.createElement("UISizeConstraint", {
			MinSize = WithDefaultsModuleResult.minSize,
			MaxSize = WithDefaultsModuleResult.maxSize
		}) else nil,
		Layout = ReactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			SortOrder = Enum.SortOrder.LayoutOrder
		}),
		Media = ReactModule.createElement(BaseTileMediaModule, {
			LayoutOrder = 1,
			content = WithDefaultsModuleResult.mediaContent,
			clippingStyle = WithDefaultsModuleResult.mediaClippingStyle,
			aspectRatio = WithDefaultsModuleResult.mediaAspectRatio,
			backgroundStyle = WithDefaultsModuleResult.mediaBackgroundStyle or UseTokensModuleResult.Color.Shift.Shift_200,
			isSizeConstrained = HasMinSize,
			isContained = WithDefaultsModuleResult.isContained,
			tileSize = Size,
			maxHeight = if UseMemoResult == nil then nil else UseMemoResult.mediaMaxHeight,
			testId = `{WithDefaultsModuleResult.testId}--media`
		}),
		Content = ReactModule.createElement(BaseTileContentModule, {
			LayoutOrder = 2,
			title = WithDefaultsModuleResult.title,
			metadata = WithDefaultsModuleResult.metadata,
			contentAction = WithDefaultsModuleResult.contentAction,
			footer = WithDefaultsModuleResult.footer,
			isContained = WithDefaultsModuleResult.isContained,
			onAbsoluteSizeChanged = if UseMemoResult == nil then nil else UseMemoResult.onContentAbsoluteSizeChanged,
			testId = WithDefaultsModuleResult.testId
		})
	})
end))