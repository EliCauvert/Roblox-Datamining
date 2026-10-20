local Foundation = script:FindFirstAncestor("Foundation")
local Parent = Foundation.Parent
local ReactModule = require(Parent.React)
local ReactIsModule = require(Parent.ReactIs)
local GetTestIdTagModule = require(Foundation.Utility.getTestIdTag)
local MapBindableModule = require(Foundation.Utility.mapBindable)
local _ = require(Foundation.Components.Types)

local function _(p1)
	-- upvalues: MapBindableModule (copy)
	return if p1 == nil then nil else MapBindableModule(p1, function(Offset)
		return if typeof(Offset) == "number" then UDim.new(0, Offset) else Offset
	end)
end

local function getCornerRadius(Offset)
	-- upvalues: ReactIsModule (copy), MapBindableModule (copy)
	if ReactIsModule.isBinding(Offset) then
		return {
			TopLeftRadius = Offset,
			TopRightRadius = Offset,
			BottomRightRadius = Offset,
			BottomLeftRadius = Offset
		}
	elseif typeof(Offset) == "number" then
		return {
			TopLeftRadius = UDim.new(0, Offset),
			TopRightRadius = UDim.new(0, Offset),
			BottomRightRadius = UDim.new(0, Offset),
			BottomLeftRadius = UDim.new(0, Offset)
		}
	elseif typeof(Offset) == "UDim" then
		return {
			TopLeftRadius = Offset,
			TopRightRadius = Offset,
			BottomRightRadius = Offset,
			BottomLeftRadius = Offset
		}
	elseif typeof(Offset) == "table" then
		local TopLeft = Offset.topLeft
		local MapBindableModuleResult = if TopLeft == nil then nil else MapBindableModule(TopLeft, function(Offset)
			return if typeof(Offset) == "number" then UDim.new(0, Offset) else Offset
		end)
		local TopRight = Offset.topRight
		local MapBindableModuleResult1 = if TopRight == nil then nil else MapBindableModule(TopRight, function(Offset)
			return if typeof(Offset) == "number" then UDim.new(0, Offset) else Offset
		end)
		local BottomRight = Offset.bottomRight
		local MapBindableModuleResult2 = if BottomRight == nil then nil else MapBindableModule(BottomRight, function(Offset)
			return if typeof(Offset) == "number" then UDim.new(0, Offset) else Offset
		end)
		local BottomLeft = Offset.bottomLeft
		
		return {
			TopLeftRadius = MapBindableModuleResult,
			TopRightRadius = MapBindableModuleResult1,
			BottomRightRadius = MapBindableModuleResult2,
			BottomLeftRadius = if BottomLeft == nil then nil else MapBindableModule(BottomLeft, function(Offset)
				return if typeof(Offset) == "number" then UDim.new(0, Offset) else Offset
			end)
		}
	else
		return {}
	end
end

return ReactModule.memo(function(p1)
	-- upvalues: getCornerRadius (copy), ReactModule (copy), GetTestIdTagModule (copy)
	local CornerRadius = getCornerRadius(p1.value)
	
	return ReactModule.createElement("UICorner", {
		TopLeftRadius = CornerRadius.TopLeftRadius,
		TopRightRadius = CornerRadius.TopRightRadius,
		BottomRightRadius = CornerRadius.BottomRightRadius,
		BottomLeftRadius = CornerRadius.BottomLeftRadius,
		[ReactModule.Tag] = GetTestIdTagModule(p1.testId)
	})
end)