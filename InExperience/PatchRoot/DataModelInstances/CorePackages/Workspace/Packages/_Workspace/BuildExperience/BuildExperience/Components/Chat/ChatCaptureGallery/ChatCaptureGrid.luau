local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local CaptureGridItemModule = require(BuildExperience.Components.MediaSelectionPage.CaptureGridItem)
local Button = FoundationModule.Button
local Text = FoundationModule.Text
local View = FoundationModule.View
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local FillBehavior = FoundationModule.Enums.FillBehavior
local InputSize = FoundationModule.Enums.InputSize
local _UDim2 = UDim2.new(0.25, -3, 0, 1)

local function renderTile(LayoutOrder, Element)
	-- upvalues: ReactModule (copy), View (copy), _UDim2 (copy)
	return ReactModule.createElement(View, {
		LayoutOrder = LayoutOrder,
		Size = _UDim2,
		testId = `ChatCaptureGrid.Tile.{LayoutOrder}`,
		aspectRatio = {
			AspectRatio = 1,
			AspectType = Enum.AspectType.ScaleWithParentSize,
			DominantAxis = Enum.DominantAxis.Width
		}
	}, { Content = Element })
end

local function _(Text1)
	-- upvalues: ReactModule (copy), Text (copy)
	return ReactModule.createElement(Text, {
		LayoutOrder = 1,
		tag = "size-full-0 auto-y text-body-medium text-align-x-center content-muted",
		Text = Text1
	})
end

return ReactModule.memo(function(p1)
	-- upvalues: ReactModule (copy), renderTile (copy), View (copy), CaptureGridItemModule (copy), Text (copy), Button (copy), FillBehavior (copy), InputSize (copy), ButtonVariant (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(function(): number
		-- upvalues: p1 (copy)
		return if p1.shouldProgressivelyLoad then 0 else #p1.captures
	end)
	local UseRefResult = ReactModule.useRef(UseStateResult)
	ReactModule.useEffect(function()
		-- upvalues: p1 (copy), UseRefResult (copy), UseStateResult2 (copy)
		if p1.isLoading then
			UseRefResult.current = 0
			UseStateResult2(0)
			
			return
		end
		if not p1.shouldProgressivelyLoad then
			UseRefResult.current = #p1.captures
			UseStateResult2(#p1.captures)
			
			return
		end
		local Flag = false
		task.spawn(function()
			-- upvalues: UseRefResult (upval), p1 (upval), Flag (ref), UseStateResult2 (upval)
			task.wait(0.3)
			
			for i = UseRefResult.current + 1, #p1.captures do
				task.wait()
				
				if Flag then break end
				UseRefResult.current = i
				UseStateResult2(i)
			end
		end)
		
		return function()
			-- upvalues: Flag (ref)
			Flag = true
		end
	end, { p1.isLoading, p1.shouldProgressivelyLoad, #p1.captures })
	local t = {}
	
	if p1.isLoading then
		for i = 1, 8 do
			t[`Placeholder-{i}`] = renderTile(i, ReactModule.createElement(View, {
				tag = "size-full radius-medium bg-shift-200",
				testId = `ChatCaptureGrid.Placeholder.{i}`
			}))
		end
	else
		for i1, capture in p1.captures do
			t[`Capture-{i1}`] = renderTile(i1, ReactModule.createElement(CaptureGridItemModule, {
				capture = capture,
				imageContentEnabled = i1 <= UseStateResult,
				isSelected = p1.isSelected(capture),
				onActivated = p1.onCaptureToggled,
				testId = `ChatCaptureGrid.Capture.{i1}`
			}))
		end
	end
	return ReactModule.createElement(View, { tag = "col gap-medium size-full-0 auto-y" }, {
		EmptyState = if #p1.captures == 0 and not p1.isLoading then ReactModule.createElement(Text, {
			LayoutOrder = 1,
			tag = "size-full-0 auto-y text-body-medium text-align-x-center content-muted",
			Text = p1.emptyText
		}) else nil,
		Grid = if #p1.captures > 0 or p1.isLoading then ReactModule.createElement(View, {
			LayoutOrder = 1,
			tag = "row wrap gap-xsmall size-full-0 auto-y"
		}, {
			Captures = ReactModule.createElement(ReactModule.Fragment, nil, t)
		}) else nil,
		ShowMore = if p1.isFinished or p1.isLoading then nil else ReactModule.createElement(Button, {
			LayoutOrder = 2,
			testId = "ChatCaptureGrid.ShowMore",
			fillBehavior = FillBehavior.Fill,
			onActivated = p1.onShowMore,
			size = InputSize.Medium,
			text = p1.showMoreText,
			variant = ButtonVariant.Standard
		})
	})
end)