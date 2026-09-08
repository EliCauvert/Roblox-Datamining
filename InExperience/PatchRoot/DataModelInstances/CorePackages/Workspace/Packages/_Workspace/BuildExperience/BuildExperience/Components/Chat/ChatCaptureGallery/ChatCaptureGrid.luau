local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local captureGridItemModule = require(buildExperience.Components.MediaSelectionPage.CaptureGridItem)
local button = foundationModule.Button
local text = foundationModule.Text
local view = foundationModule.View
local buttonVariant = foundationModule.Enums.ButtonVariant
local fillBehavior = foundationModule.Enums.FillBehavior
local inputSize = foundationModule.Enums.InputSize
local uDim2 = UDim2.new(0.25, -3, 0, 1)

local function renderTile(p1, p2)
	-- upvalues: reactModule (ref), view (ref), uDim2 (ref)
	return reactModule.createElement(view, {
		LayoutOrder = p1,
		Size = uDim2,
		testId = `ChatCaptureGrid.Tile.{p1}`,
		aspectRatio = {
			AspectRatio = 1,
			AspectType = Enum.AspectType.ScaleWithParentSize,
			DominantAxis = Enum.DominantAxis.Width
		}
	}, { Content = p2 })
end

local function _(p1)
	-- upvalues: reactModule (ref), text (ref)
	return reactModule.createElement(text, {
		LayoutOrder = 1,
		tag = "size-full-0 auto-y text-body-medium text-align-x-center content-muted",
		Text = p1
	})
end

return reactModule.memo(function(p1)
	-- upvalues: reactModule (ref), renderTile (ref), view (ref), captureGridItemModule (ref), text (ref), button (ref), fillBehavior (ref), inputSize (ref), buttonVariant (ref)
	local var1, var2 = reactModule.useState(function()
		-- upvalues: p1 (ref)
		return if p1.shouldProgressivelyLoad then 0 else #p1.captures
	end)
	local var3 = reactModule.useRef(var1)
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), var3 (ref), var2 (ref)
		if p1.isLoading then
			var3.current = 0
			var2(0)
			
			return
		elseif p1.shouldProgressivelyLoad then
			local var4 = false
			task.spawn(function()
				-- upvalues: var3 (copy), p1 (copy), var4 (write), var2 (copy)
				task.wait(0.3)
				
				for i = var3.current + 1, #p1.captures do
					task.wait()
					
					if not var4 then
						var3.current = i
						var2(i)
						continue
					end
					return
				end
			end)
			
			return function()
				-- upvalues: var4 (write)
				var4 = true
			end
		end
		var3.current = #p1.captures
		var2(#p1.captures)
	end, { p1.isLoading, p1.shouldProgressivelyLoad, #p1.captures })
	local t = {}
	
	if p1.isLoading then
		for i = 1, 8 do
			t[`Placeholder-{i}`] = renderTile(i, reactModule.createElement(view, {
				tag = "size-full radius-medium bg-shift-200",
				testId = `ChatCaptureGrid.Placeholder.{i}`
			}))
		end
	else
		for i_1, v in p1.captures do
			t[`Capture-{i_1}`] = renderTile(i_1, reactModule.createElement(captureGridItemModule, {
				capture = v,
				imageContentEnabled = i_1 <= var1,
				isSelected = p1.isSelected(v),
				onActivated = p1.onCaptureToggled,
				testId = `ChatCaptureGrid.Capture.{i_1}`
			}))
		end
	end
	return reactModule.createElement(view, { tag = "col gap-medium size-full-0 auto-y" }, {
		EmptyState = if #p1.captures == 0 and not p1.isLoading then reactModule.createElement(text, {
			LayoutOrder = 1,
			tag = "size-full-0 auto-y text-body-medium text-align-x-center content-muted",
			Text = p1.emptyText
		}) else nil,
		Grid = if #p1.captures > 0 or p1.isLoading then reactModule.createElement(view, {
			LayoutOrder = 1,
			tag = "row wrap gap-xsmall size-full-0 auto-y"
		}, {
			Captures = reactModule.createElement(reactModule.Fragment, nil, t)
		}) else nil,
		ShowMore = if p1.isFinished or p1.isLoading then nil else reactModule.createElement(button, {
			LayoutOrder = 2,
			testId = "ChatCaptureGrid.ShowMore",
			fillBehavior = fillBehavior.Fill,
			onActivated = p1.onShowMore,
			size = inputSize.Medium,
			text = p1.showMoreText,
			variant = buttonVariant.Standard
		})
	})
end)