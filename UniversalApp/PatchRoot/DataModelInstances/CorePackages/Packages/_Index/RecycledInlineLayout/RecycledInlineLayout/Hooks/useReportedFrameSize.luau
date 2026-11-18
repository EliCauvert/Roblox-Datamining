local RecycledInlineLayout = script:FindFirstAncestor("RecycledInlineLayout")
local Parent = RecycledInlineLayout.Parent
local ReactModule = require(Parent.React)
local SignalsModule = require(Parent.Signals)
local UiScaleModule = require(RecycledInlineLayout.Utils.uiScale)
local UseReportedSizeModule = require(RecycledInlineLayout.Hooks.useReportedSize)

local function _(Frame): Vector2?
	-- upvalues: UiScaleModule (copy)
	local UiScaleModuleResult = UiScaleModule(Frame)
	
	if UiScaleModuleResult == 0 then
		return nil
	else
		local AbsoluteSizeRatio = Frame.AbsoluteSize / UiScaleModuleResult
		
		return Vector2.new(math.round(AbsoluteSizeRatio.X * 100) / 100, math.round(AbsoluteSizeRatio.Y * 100) / 100)
	end
end

return function()
	-- upvalues: ReactModule (copy), SignalsModule (copy), UseReportedSizeModule (copy), UiScaleModule (copy)
	local UseStateResult = ReactModule.useState(function()
		-- upvalues: SignalsModule (upval)
		local Signal, Signal2 = SignalsModule.createSignal(nil)
		
		return { size = Signal, setSize = Signal2 }
	end)
	UseReportedSizeModule(UseStateResult.size)
	
	return ReactModule.useCallback(function(Frame)
		-- upvalues: UiScaleModule (upval), UseStateResult (copy)
		local UiScaleModuleResult = UiScaleModule(Frame)
		local v1 = nil
		
		if UiScaleModuleResult == 0 then
			v1 = nil
		else
			local AbsoluteSizeRatio = Frame.AbsoluteSize / UiScaleModuleResult
			v1 = Vector2.new(math.round(AbsoluteSizeRatio.X * 100) / 100, math.round(AbsoluteSizeRatio.Y * 100) / 100)
		end
		if v1 ~= nil then
			UseStateResult.setSize(v1)
		end
	end, { UseStateResult })
end