local Parent = script.Parent
local Parent1 = Parent.Parent.Parent
local Parent2 = Parent1.Parent
local RoactModule = require(Parent2.Roact)
local Uiblox = require(Parent2.BuilderIcons).Migration.uiblox
local FoundationModule = require(Parent2.Foundation)
local UseTokensFunction = FoundationModule.Hooks.useTokens
local UseTextSizeOffsetFunction = FoundationModule.Hooks.useTextSizeOffset
local ScaleSliceToResolutionModule = require(Parent1.App.ImageSet.scaleSliceToResolution)
local ImagesInverseModule = require(Parent1.App.ImageSet.ImagesInverse)
local GetBuilderIconElementModule = require(Parent.getBuilderIconElement)

return function(p1, p2: number) --[[ Line: 16 ]]
	-- upvalues: RoactModule (copy), Uiblox (copy), UseTokensFunction (copy), UseTextSizeOffsetFunction (copy), ImagesInverseModule (copy), GetBuilderIconElementModule (copy), ScaleSliceToResolutionModule (copy)
	assert(p2 > 0, "resolutionScale for ImageSet must be greater than 0! got " .. tostring(p2))
	
	return RoactModule.forwardRef(function(List, p3) --[[ Line: 22 ]]
		-- upvalues: RoactModule (upval), Uiblox (upval), UseTokensFunction (upval), UseTextSizeOffsetFunction (upval), ImagesInverseModule (upval), GetBuilderIconElementModule (upval), p1 (copy), p2 (copy), ScaleSliceToResolutionModule (upval)
		local config = {
			[RoactModule.Ref] = p3,
			[RoactModule.Children] = List[RoactModule.Children]
		}
		local v1 = nil
		local Image = nil
		local Flag = false
		local Flag1 = false
		
		for i, value in pairs(List) do
			if i ~= "Image" or typeof(value) ~= "table" then
				config[i] = value
				continue
			end
			if Uiblox[value.Image] then
				Flag1 = true
				Image = value.Image
			else
				Flag = true
				v1 = value
			end
		end
		local UseTokensResult = UseTokensFunction()
		local UseTextSizeOffsetResult = UseTextSizeOffsetFunction()
		
		if Flag or Flag1 then
			local Image1 = if Flag1 then Image else ImagesInverseModule[v1]
			
			if Image1 and Uiblox[Image1] then
				if not UseTokensResult.Stroke then
					error(`No StyleProvider in tree for migrated icon ImageSetComponent.\n UIBlox Icon: {Image1}, BuilderIcon: {Uiblox[Image1]}`)
				end
				return GetBuilderIconElementModule(config, p1, Uiblox[Image1], Image1, UseTokensResult, UseTextSizeOffsetResult, UseTokensResult.Stroke.Standard)
			end
		end
		if Flag then
			for i1, value1 in pairs(v1) do
				if not config[i1] then
					config[i1] = value1
					continue
				end
				if i1 == "ImageRectOffset" then
					config[i1] = value1 + config[i1] * p2
				elseif i1 == "ImageRectSize" then
					config[i1] *= p2
				end
			end
		end
		if Flag then
			config = ScaleSliceToResolutionModule(config, p2)
		end
		return RoactModule.createElement(p1, config)
	end)
end