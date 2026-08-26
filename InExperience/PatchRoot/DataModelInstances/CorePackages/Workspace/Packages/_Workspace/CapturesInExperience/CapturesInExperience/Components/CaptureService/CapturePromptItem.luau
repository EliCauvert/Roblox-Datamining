local parent = script.Parent.Parent.Parent.Parent
local capturesCommonModule = require(parent.CapturesCommon)
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local checkbox = foundationModule.Checkbox
local view = foundationModule.View
local getCropSize = capturesCommonModule.Utils.getCropSize

return function(p1)
	-- upvalues: reactModule (ref), view (ref), foundationModule (ref), checkbox (ref), getCropSize (ref)
	local var1, var2 = reactModule.useState(Vector2.new(0, 0))
	local var3 = reactModule.useRef(nil)
	local var4, var5 = reactModule.useState(Vector2.new(0, 0))
	local var6 = reactModule.useCallback(function()
		-- upvalues: p1 (ref)
		p1.updateSelected(not p1.isSelected)
	end, { p1.isSelected, p1.updateSelected })
	local var7 = reactModule.useCallback(function(p2)
		-- upvalues: var2 (ref)
		var2(p2.AbsoluteSize)
	end, {})
	local var8 = reactModule.useCallback(function(p2)
		-- upvalues: var3 (ref), var5 (ref)
		var3.current = p2
		var5(p2.Resolution)
	end, {})
	reactModule.useEffect(function()
		-- upvalues: var3 (ref)
		return function()
			-- upvalues: var3 (copy)
			if var3.current then
				var3.current.Video = ""
			end
		end
	end, {})
	local var9 = typeof(p1.content) == "Content" and (p1.content.Object ~= nil and p1.content.Object:IsA("VideoCapture"))
	
	return reactModule.createElement(view, { tag = "clip size-full", onAbsoluteSizeChanged = var7 }, {
		CheckboxOverlay = if p1.showCheckbox then reactModule.createElement(view, {
			tag = "size-full padding-small",
			ZIndex = 2,
			onActivated = var6,
			stateLayer = {
				affordance = foundationModule.Enums.StateLayerAffordance.None
			}
		}, {
			Checkbox = reactModule.createElement(checkbox, {
				label = "",
				AnchorPoint = Vector2.new(1, 0),
				isChecked = p1.isSelected,
				onActivated = var6,
				Position = UDim2.fromScale(1, 0)
			})
		}) else nil,
		Image = if not var9 then reactModule.createElement("ImageLabel", {
			BackgroundTransparency = 1,
			AnchorPoint = Vector2.new(0.5, 0.5),
			ImageContent = p1.content,
			Position = UDim2.fromScale(0.5, 0.5),
			ScaleType = Enum.ScaleType.Crop,
			Size = UDim2.fromScale(1, 1)
		}) else nil,
		Video = if var9 then reactModule.createElement("VideoFrame", {
			AnchorPoint = Vector2.new(0.5, 0.5),
			BackgroundTransparency = 1,
			Looped = true,
			Playing = true,
			Position = UDim2.fromScale(0.5, 0.5),
			Size = getCropSize(var1, var4),
			VideoContent = p1.content,
			Volume = 0,
			[reactModule.Event.Loaded] = var8
		}) else nil
	})
end