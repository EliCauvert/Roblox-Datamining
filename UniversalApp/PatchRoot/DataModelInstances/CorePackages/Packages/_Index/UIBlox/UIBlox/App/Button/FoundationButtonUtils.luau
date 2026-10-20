local Parent = script.Parent
local Parent1 = Parent.Parent
local Parent2 = Parent1.Parent
local Parent3 = Parent2.Parent
local Core = Parent2.Core
local FoundationModule = require(Parent3.Foundation)
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local InputSize = FoundationModule.Enums.InputSize
local GetTextSizeModule = require(Core.Text.GetTextSize)
local Uiblox = require(Parent3.BuilderIcons).Migration.uiblox
local ButtonTypeModule = require(Parent.Enum.ButtonType)
local StandardButtonSizeModule = require(Core.Button.Enum.StandardButtonSize)
local ImagesInverseModule = require(Parent1.ImageSet.ImagesInverse)
local SizeMapping = {
	[StandardButtonSizeModule.Regular] = InputSize.Large,
	[StandardButtonSizeModule.Small] = InputSize.Small,
	[StandardButtonSizeModule.XSmall] = InputSize.XSmall
}
local config = {
	[StandardButtonSizeModule.Regular] = false,
	[StandardButtonSizeModule.Small] = false,
	[StandardButtonSizeModule.XSmall] = true
}
local config1 = {
	[InputSize.XSmall] = {
		padding = "Small",
		typography = "Small",
		height = "Size_600"
	},
	[InputSize.Small] = {
		padding = "Small",
		typography = "Small",
		height = "Size_800"
	},
	[InputSize.Medium] = {
		padding = "Medium",
		typography = "Medium",
		height = "Size_1000"
	},
	[InputSize.Large] = {
		padding = "Medium",
		typography = "Large",
		height = "Size_1200"
	}
}
local _Vector2 = Vector2.new(10000, 10000)

return {
	buttonMapping = {
		[ButtonTypeModule.Alert] = ButtonVariant.Alert,
		[ButtonTypeModule.PrimaryContextual] = ButtonVariant.Emphasis,
		[ButtonTypeModule.PrimarySystem] = ButtonVariant.SubEmphasis,
		[ButtonTypeModule.Secondary] = ButtonVariant.Subtle
	},
	sizeMapping = SizeMapping,
	findIcon = function(p1)
		-- upvalues: Uiblox (copy), ImagesInverseModule (copy)
		if not p1 then
			return nil
		end
		local HasUibloxEntry: boolean = p1.Image and Uiblox[p1.Image] ~= nil
		local Image = if HasUibloxEntry then p1.Image else ImagesInverseModule[p1]
		
		if Image == nil then
			warn("Icon not found")
		end
		return Image
	end,
	getSizeMapping = function(p1, Vector, p2)
		-- upvalues: SizeMapping (copy), InputSize (copy)
		return if p1 then SizeMapping[p1] elseif Vector then if p2.Size.Size_1200 <= Vector.Y.Offset then InputSize.Large elseif Vector.Y.Scale > 0 then InputSize.Medium elseif p2.Size.Size_1000 <= Vector.Y.Offset then InputSize.Medium elseif p2.Size.Size_800 <= Vector.Y.Offset then InputSize.Small else InputSize.XSmall else nil
	end,
	getWidth = function(p1, p2, p3)
		-- upvalues: config (copy)
		if not p1 then
			return if p2 then p2.X elseif p3 then nil else UDim.new(1, 0)
		end
		local Entry = config[p1]
		
		if p3 == nil then
			p3 = Entry
		end
		return if p3 then nil else UDim.new(1, 0)
	end,
	getMaxWidth = function(p1, p2)
		return if p1 == nil then nil elseif p2 == nil then 640 else p2
	end,
	getFitContentSize = function(p1, p2, p3): Vector2?
		-- upvalues: SizeMapping (copy), config1 (copy), GetTextSizeModule (copy), _Vector2 (copy)
		local SizeMappingEntry = if p2 then SizeMapping[p2] else nil
		local Entry = if SizeMappingEntry then config1[SizeMappingEntry] else nil
		
		if Entry then
			local TypographyEntry = p3.Typography["Label" .. Entry.typography]
			
			return Vector2.new(math.ceil(GetTextSizeModule(p1, TypographyEntry.FontSize, TypographyEntry.Font, _Vector2).X) + p3.Padding[Entry.padding] * 2, p3.Size[Entry.height])
		else
			return nil
		end
	end,
	getTestId = function(p1)
		return if p1 and #p1 ~= 0 then p1:match("data%-testid=([^%s]+)") else nil
	end
}