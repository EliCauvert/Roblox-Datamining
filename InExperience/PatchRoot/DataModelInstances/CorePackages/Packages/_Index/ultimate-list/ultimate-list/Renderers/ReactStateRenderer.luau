local UltimateList = script:FindFirstAncestor("ultimate-list")
local _ = require(UltimateList.Dimensions)
local DimensionsMethodsModule = require(UltimateList.Dimensions.DimensionsMethods)
local ReactModule = require(UltimateList.Parent.React)
local _ = require(UltimateList.Renderers)
local AdjustPositionToScrollAxisModule = require(UltimateList.Dimensions.adjustPositionToScrollAxis)
local _ = require(UltimateList.createVirtualizedListController)
local JoinAndMapBindingsModule = require(UltimateList.Util.joinAndMapBindings)
local CreateElementFunction = ReactModule.createElement

local function getKeyDefault(_, p1): string
	return (tostring(p1))
end

return function(p1)
	-- upvalues: ReactModule (copy), getKeyDefault (copy), DimensionsMethodsModule (copy), CreateElementFunction (copy), JoinAndMapBindingsModule (copy), AdjustPositionToScrollAxisModule (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(p1.virtualizedListController.get)
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(nil)
	ReactModule.useEffect(function()
		-- upvalues: p1 (copy), UseStateResult2 (copy), UseBindingResult2 (copy)
		local GetResult = p1.virtualizedListController.get()
		UseStateResult2(GetResult)
		
		return p1.virtualizedListController.bindToUpdate(function()
			-- upvalues: UseBindingResult2 (upval), GetResult (ref), p1 (upval), UseStateResult2 (upval)
			UseBindingResult2({
				lockedTo = GetResult,
				scrollAxis = p1.scrollAxisBinding:getValue()
			})
			GetResult = p1.virtualizedListController.get()
			UseStateResult2(GetResult)
		end)
	end, { p1.virtualizedListController, p1.scrollAxisBinding })
	local Frames = {}
	local GetKey = p1.getKey or getKeyDefault
	local Range = p1.virtualizedListController.getRange()
	
	for i, value in UseStateResult do
		local NewX = Range.X + (i - 1)
		local UDimRect = DimensionsMethodsModule.getUDimRect(p1.dimensions, value, NewX, p1.virtualizedListController.getWindowSize(), p1.direction)
		Frames[GetKey(value, NewX)] = CreateElementFunction("Frame", {
			BackgroundTransparency = 1,
			Position = JoinAndMapBindingsModule(function(p2, p3)
				-- upvalues: p1 (copy), UseStateResult (copy), AdjustPositionToScrollAxisModule (upval), UDimRect (copy)
				return if p1.config.freezeViewWhileScrolling == false or p3 == nil or p3.lockedTo ~= UseStateResult then AdjustPositionToScrollAxisModule(UDimRect.position, p2, p1.direction) else AdjustPositionToScrollAxisModule(UDimRect.position, p3.scrollAxis, p1.direction)
			end, p1.scrollAxisBinding, UseBindingResult),
			Size = UDimRect.size
		}, p1.callback(value))
	end
	return CreateElementFunction(ReactModule.Fragment, nil, Frames)
end