local Parent = script:FindFirstAncestor("BuildExperience").Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local ChatAttachmentTileStatusModule = require(script.Parent.ChatAttachmentTileStatus)
local Icon = FoundationModule.Icon
local IconButton = FoundationModule.IconButton
local Progress = FoundationModule.Progress
local View = FoundationModule.View
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local IconName = FoundationModule.Enums.IconName
local IconSize = FoundationModule.Enums.IconSize
local InputSize = FoundationModule.Enums.InputSize
local ProgressShape = FoundationModule.Enums.ProgressShape
local ProgressSize = FoundationModule.Enums.ProgressSize
local UseTokensFunction = FoundationModule.Hooks.useTokens

local function PendingOverlay(p1)
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), ChatAttachmentTileStatusModule (copy), View (copy), Icon (copy), IconName (copy), IconSize (copy), Progress (copy), ProgressShape (copy), ProgressSize (copy)
	local UseBindingResult = ReactModule.useBinding(0)
	local IsStatusMatch = p1.status == ChatAttachmentTileStatusModule.Error
	
	return ReactModule.createElement(View, {
		tag = "size-full radius-medium",
		ZIndex = 2,
		backgroundStyle = UseTokensFunction().Color.Common.Scrim,
		onActivated = if IsStatusMatch then p1.onRetry else nil,
		testId = `{p1.testId}.Scrim`
	}, {
		Status = ReactModule.createElement(View, {
			tag = "position-center-center anchor-center-center auto-xy padding-xsmall stroke-standard stroke-contrast radius-circle bg-over-media-100",
			testId = `{p1.testId}.Status`
		}, {
			Indicator = if IsStatusMatch then ReactModule.createElement(Icon, {
				name = IconName.TriangleExclamation,
				size = IconSize.Small,
				testId = `{p1.testId}.ErrorIcon`
			}) else ReactModule.createElement(View, {
				tag = "auto-xy clip",
				GroupTransparency = UseBindingResult
			}, {
				Progress = ReactModule.createElement(Progress, {
					shape = ProgressShape.Circle,
					size = ProgressSize.Small,
					testId = `{p1.testId}.Progress`
				})
			})
		})
	})
end

return function(p1)
	-- upvalues: UseTokensFunction (copy), ChatAttachmentTileStatusModule (copy), ReactModule (copy), View (copy), PendingOverlay (copy), IconButton (copy), IconName (copy), InputSize (copy), ButtonVariant (copy)
	local UseTokensResult = UseTokensFunction()
	
	if p1.aspectRatio <= 0 or p1.aspectRatio >= 1e999 then
		error(`ChatAttachmentTile needs a positive, finite aspectRatio, got {p1.aspectRatio}`)
	end
	local TestId = p1.testId or "ChatAttachmentTile"
	local Tile = p1.tile
	local Status = Tile.status or ChatAttachmentTileStatusModule.Ready
	local IsStatusMatch = Status == ChatAttachmentTileStatusModule.Ready
	local Size2000 = UseTokensResult.Size.Size_2000
	local XSmall = UseTokensResult.Padding.XSmall
	
	return ReactModule.createElement(View, {
		tag = "radius-medium clip bg-surface-100",
		LayoutOrder = Tile.LayoutOrder,
		Size = UDim2.fromOffset(math.round(Size2000 * p1.aspectRatio / 2) * 2, Size2000),
		testId = TestId
	}, {
		Content = ReactModule.createElement(ReactModule.Fragment, nil, p1.children),
		Pending = if IsStatusMatch then nil else ReactModule.createElement(PendingOverlay, { status = Status, onRetry = Tile.onRetry, testId = TestId }),
		Press = if IsStatusMatch and Tile.onActivated ~= nil then ReactModule.createElement(View, {
			tag = "size-full radius-medium",
			ZIndex = 3,
			onActivated = Tile.onActivated,
			testId = `{TestId}.Press`
		}) else nil,
		Remove = if Tile.onRemove == nil then nil else ReactModule.createElement(IconButton, {
			isCircular = true,
			ZIndex = 4,
			AnchorPoint = Vector2.new(1, 0),
			icon = IconName.X,
			onActivated = Tile.onRemove,
			Position = UDim2.new(1, -XSmall, 0, XSmall),
			size = InputSize.XSmall,
			variant = if p1.isMedia or not IsStatusMatch then ButtonVariant.OverMedia else ButtonVariant.Utility,
			testId = `{TestId}.Remove`
		})
	})
end