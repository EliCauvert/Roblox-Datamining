local parent = script.Parent
local parent_1 = parent.Parent
local parent_2 = parent_1.Parent
local parent_3 = parent_2.Parent
local core = parent_2.Core
local foundationModule = require(parent_3.Foundation)
local buttonVariant = foundationModule.Enums.ButtonVariant
local inputSize = foundationModule.Enums.InputSize
local flags = foundationModule.Utility.Flags
local getTextSizeModule = require(core.Text.GetTextSize)
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
local t_3 = {
	[inputSize.XSmall] = {
		padding = "Small",
		typography = "Small",
		height = "Size_600"
	},
	[inputSize.Small] = {
		padding = "Small",
		typography = "Small",
		height = "Size_800"
	},
	[inputSize.Medium] = {
		padding = "Medium",
		typography = "Medium",
		height = "Size_1000"
	},
	[inputSize.Large] = {
		padding = "Medium",
		typography = "Large",
		height = "Size_1200"
	}
}
local vector2 = Vector2.new(10000, 10000)

return {
	buttonMapping = t,
	sizeMapping = t_1,
	findIcon = function(p1)
		-- upvalues: uiblox (ref), imagesInverseModule (ref)
		if not p1 then
			return nil
		end
		local var1 = if p1.Image and uiblox[p1.Image] ~= nil then p1.Image else imagesInverseModule[p1]
		
		if var1 == nil then
			warn("Icon not found")
		end
		return var1
	end,
	getSizeMapping = function(p1, p2, p3)
		-- upvalues: t_1 (ref), inputSize (ref)
		return if p1 then t_1[p1] elseif p2 then if p3.Size.Size_1200 <= p2.Y.Offset then inputSize.Large elseif p2.Y.Scale > 0 then inputSize.Medium elseif p3.Size.Size_1000 <= p2.Y.Offset then inputSize.Medium elseif p3.Size.Size_800 <= p2.Y.Offset then inputSize.Small else inputSize.XSmall else nil
	end,
	getWidth = function(p1, p2, p3)
		-- upvalues: t_2 (ref)
		if p1 then
			local var1 = t_2[p1]
			
			if p3 == nil then
				p3 = var1
			end
			return if p3 then nil else UDim.new(1, 0)
		else
			return if p2 then p2.X elseif p3 then nil else UDim.new(1, 0)
		end
	end,
	getMaxWidth = function(a, b)
		return if a == nil then nil elseif b == nil then 640 else b
	end,
	getFitContentSize = function(p1, p2, p3)
		-- upvalues: t_1 (ref), t_3 (ref), flags (ref), getTextSizeModule (ref), vector2 (ref)
		local var1 = if p2 then t_1[p2] else nil
		local var2 = if var1 then t_3[var1] else nil
		
		if var2 then
			local var3 = p3.Typography[(if flags.FoundationButtonLabelTypography then "Label" else "Title") .. var13.typography]
			
			return Vector2.new(math.ceil(getTextSizeModule(p1, var3.FontSize, var3.Font, vector2).X) + p3.Padding[var2.padding] * 2, p3.Size[var2.height])
		end
		return nil
	end,
	getTestId = function(p1)
		return if p1 and #p1 ~= 0 then p1:match("data%-testid=([^%s]+)") else nil
	end
}