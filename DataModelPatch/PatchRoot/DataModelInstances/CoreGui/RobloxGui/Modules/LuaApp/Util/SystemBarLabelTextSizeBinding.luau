local TextService = game:GetService("TextService")
local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local FFlagAppNavLabelScaling = require(CorePackages.Workspace.Packages.SharedFlags).FFlagAppNavLabelScaling
local BuilderSansNavbarFlagSize = game:DefineFastFlag("BuilderSansNavbarFlagSize", false)
local BuilderSansNavBarMinSize = game:DefineFastInt("BuilderSansNavBarMinSize", 10.08)
local BuilderSansNavBarMaxSize = game:DefineFastInt("BuilderSansNavBarMaxSize", 13.86)
local BuilderSansNavBarMinSize1 = if BuilderSansNavbarFlagSize then BuilderSansNavBarMinSize else 10.08
local BuilderSansNavBarMaxSize1 = if BuilderSansNavbarFlagSize then BuilderSansNavBarMaxSize else 12.6
local SystemBarLabelTextSizeBindingModule = {}
SystemBarLabelTextSizeBindingModule.__index = SystemBarLabelTextSizeBindingModule

function SystemBarLabelTextSizeBindingModule.new()
	-- upvalues: ReactModule (copy), BuilderSansNavBarMaxSize1 (copy), SystemBarLabelTextSizeBindingModule (copy)
	local Binding, Binding2 = ReactModule.createBinding(BuilderSansNavBarMaxSize1)
	
	return (setmetatable({ _textSize = Binding, _setTextSize = Binding2 }, SystemBarLabelTextSizeBindingModule))
end

function SystemBarLabelTextSizeBindingModule:getBinding()
	return self._textSize
end

function SystemBarLabelTextSizeBindingModule:getMinTextSize(String, p1, Vector)
	-- upvalues: BuilderSansNavBarMinSize1 (copy), TextService (copy)
	local Value = self._textSize:getValue()
	local _Vector2 = Vector2.new(2147483647, Vector.Y)
	local _Vector2_1 = Vector2.new(2147483647, Vector.Y)
	while BuilderSansNavBarMinSize1 < Value and Vector.X < _Vector2_1.X do
		_Vector2_1 = TextService:GetTextSize(String, Value, p1, _Vector2)
		
		if Vector.X < _Vector2_1.X then
			Value -= 1
		end
	end
	if Value < self._textSize:getValue() then
		self._setTextSize(Value)
	end
	return Value
end

if FFlagAppNavLabelScaling then
	function SystemBarLabelTextSizeBindingModule:setTextToMaxSize(String, p2, Vector, Count)
		-- upvalues: BuilderSansNavBarMinSize1 (copy), TextService (copy)
		local Count1: number = Count
		local _Vector2 = Vector2.new(2147483647, Vector.Y)
		local _Vector2_1 = Vector2.new(2147483647, Vector.Y)
		while BuilderSansNavBarMinSize1 < Count1 and Vector.X < _Vector2_1.X do
			_Vector2_1 = TextService:GetTextSize(String, Count1, p2, _Vector2)
			
			if Vector.X < _Vector2_1.X then
				Count1 -= 1
			end
		end
		self._setTextSize(Count1)
	end
end
SystemBarLabelTextSizeBindingModule.default = SystemBarLabelTextSizeBindingModule.new()

return SystemBarLabelTextSizeBindingModule