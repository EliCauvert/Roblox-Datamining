-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:33:02 2026 Pacific Standard Time.

local parent = script.Parent
local parent_1 = parent.Parent.Parent
local parent_2 = parent_1.Parent
local roactModule = require(parent_2.Roact)
local uiblox = require(parent_2.BuilderIcons).Migration.uiblox
local foundationModule = require(parent_2.Foundation)
local useTokens = foundationModule.Hooks.useTokens
local useTextSizeOffset = foundationModule.Hooks.useTextSizeOffset
local scaleSliceToResolutionModule = require(parent_1.App.ImageSet.scaleSliceToResolution)
local imagesInverseModule = require(parent_1.App.ImageSet.ImagesInverse)
local getBuilderIconElementModule = require(parent.getBuilderIconElement)

return function(p0, p1) --[[ line: 16 ]]
	-- upvalues: roactModule (ref), uiblox (ref), useTokens (ref), useTextSizeOffset (ref), imagesInverseModule (ref), getBuilderIconElementModule (ref), scaleSliceToResolutionModule (ref)
	assert(p1 > 0, "resolutionScale for ImageSet must be greater than 0! got " .. tostring(p1))
	
	return roactModule.forwardRef(function(p2, p3) --[[ line: 22 ]]
		-- upvalues: roactModule (copy), uiblox (copy), useTokens (copy), useTextSizeOffset (copy), imagesInverseModule (copy), getBuilderIconElementModule (copy), p0 (ref), p1 (ref), scaleSliceToResolutionModule (copy)
		local t = {
			[roactModule.Ref] = p3,
			[roactModule.Children] = p2[roactModule.Children]
		}
		local var6 = nil
		local image = nil
		local var7 = false
		local var8 = false
		
		for i, v in pairs(p2) do
			if i ~= "Image" or typeof(v) ~= "table" then
				t[i] = v
			elseif uiblox[v.Image] then
				var8 = true
				image = v.Image
			else
				var7 = true
				var6 = v
			end
		end
		local var9 = useTokens()
		local var10 = useTextSizeOffset()
		
		if var7 or var8 then
			local var11 = if var8 then image else imagesInverseModule[var6]
			
			if var11 and uiblox[var11] then
				if not var9.Stroke then
					error(`No StyleProvider in tree for migrated icon ImageSetComponent.\n UIBlox Icon: {var11}, BuilderIcon: {uiblox[var11]}`)
				end
				return getBuilderIconElementModule(t, p0, uiblox[var11], var11, var9, var10, var9.Stroke.Standard)
			elseif var7 then
				for i_1, v_1 in pairs(var6) do
					if not t[i_1] then
						t[i_1] = v_1
					elseif i_1 == "ImageRectOffset" then
						t[i_1] = v_1 + t[i_1] * p1
					elseif i_1 == "ImageRectSize" then
						t[i_1] *= p1
					end
				end
			end
			if var7 then
				t = scaleSliceToResolutionModule(t, p1)
			end
			return roactModule.createElement(p0, t)
		end
	end)
end