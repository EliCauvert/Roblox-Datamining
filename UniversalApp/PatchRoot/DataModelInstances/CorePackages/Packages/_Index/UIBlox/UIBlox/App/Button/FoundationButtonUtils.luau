local parent = script.Parent
local parent_1 = parent.Parent
local parent_2 = parent_1.Parent
local parent_3 = parent_2.Parent
local core = parent_2.Core
local foundationModule = require(parent_3.Foundation)
local buttonVariant = foundationModule.Enums.ButtonVariant
local inputSize = foundationModule.Enums.InputSize
local uiblox = require(parent_3.BuilderIcons).Migration.uiblox
local buttonTypeModule = require(parent.Enum.ButtonType)
local standardButtonSizeModule = require(core.Button.Enum.StandardButtonSize)
local imagesInverseModule = require(parent_1.ImageSet.ImagesInverse)
local t = {
	[buttonTypeModule.Alert] = buttonVariant.Alert,
	[buttonTypeModule.PrimaryContextual] = buttonVariant.Emphasis,
	[buttonTypeModule.PrimarySystem] = buttonVariant.SubEmphasis,
	[buttonTypeModule.Secondary] = buttonVariant.Subtle
}
local t_1 = {
	[standardButtonSizeModule.Regular] = inputSize.Large,
	[standardButtonSizeModule.Small] = inputSize.Small,
	[standardButtonSizeModule.XSmall] = inputSize.XSmall
}
local t_2 = {
	[standardButtonSizeModule.Regular] = false,
	[standardButtonSizeModule.Small] = false,
	[standardButtonSizeModule.XSmall] = true
}

return {
	buttonMapping = t,
	sizeMapping = t_1,
	findIcon = function(p0) --[[ line: 38 ]]
		-- upvalues: uiblox (ref), imagesInverseModule (ref)
		if not p0 then
			return nil
		end
		local var7 = if p0.Image and uiblox[p0.Image] ~= nil then p0.Image else imagesInverseModule[p0]
		
		if var7 == nil then
			warn("Icon not found")
		end
		return var7
	end,
	getSizeMapping = function(p1, p2, p3) --[[ line: 52 ]]
		-- upvalues: t_1 (ref), inputSize (ref)
		return if p1 then t_1[p1] elseif p2 then if p3.Size.Size_1200 <= p2.Y.Offset then inputSize.Large elseif p2.Y.Scale > 0 then inputSize.Medium elseif p3.Size.Size_1000 <= p2.Y.Offset then inputSize.Medium elseif p3.Size.Size_800 <= p2.Y.Offset then inputSize.Small else inputSize.XSmall else nil
	end,
	getWidth = function(p4, p5, p6) --[[ line: 71 ]]
		-- upvalues: t_2 (ref)
		if p4 then
			local var8 = t_2[p4]
			
			if p6 == nil then
				p6 = var8
			end
			return if p6 then nil else UDim.new(1, 0)
		else
			return if p5 then p5.X elseif p6 then nil else UDim.new(1, 0)
		end
	end,
	getMaxWidth = function(a, b) --[[ line: 92 ]]
		return if a == nil then nil elseif b == nil then 640 else b
	end,
	getTestId = function(p7) --[[ line: 100 ]]
		return if p7 and #p7 ~= 0 then p7:match("data%-testid=([^%s]+)") else nil
	end
}