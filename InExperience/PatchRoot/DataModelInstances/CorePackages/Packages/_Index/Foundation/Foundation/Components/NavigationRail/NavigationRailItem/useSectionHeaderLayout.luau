local Foundation = script:FindFirstAncestor("Foundation")
local ReactModule = require(Foundation.Parent.React)
local UseTokensModule = require(Foundation.Providers.Style.useTokens)

return function(p1, p2, p3, p4, XOffset)
	-- upvalues: UseTokensModule (copy), ReactModule (copy)
	local UseTokensModuleResult = UseTokensModule()
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: p2 (copy)
		return if p2 == nil then nil else p2:map(function(p5: number): number
			return 1 - p5
		end)
	end, { p2 })
	local UseMemoResult1 = ReactModule.useMemo(function()
		-- upvalues: p1 (copy), p2 (copy), p3 (copy), UseTokensModuleResult (copy), p4 (copy), XOffset (copy)
		if p1 and p2 ~= nil and p3 ~= nil then
			local Size1000 = UseTokensModuleResult.Size.Size_1000
			
			return p2:map(function(p5: number): UDim2
				-- upvalues: Size1000 (copy), p4 (upval), XOffset (upval)
				local ScaledSize = Size1000 * (1 - p5)
				
				return if p4 and XOffset ~= nil then UDim2.fromOffset(XOffset, ScaledSize) else UDim2.new(1, 0, 0, ScaledSize)
			end)
		else
			return nil
		end
	end, {
		p1, p2, p3, p4, XOffset, UseTokensModuleResult
	})
	local UseMemoResult2 = ReactModule.useMemo(function()
		-- upvalues: p1 (copy), p2 (copy), p3 (copy), UseTokensModuleResult (copy)
		if p1 and p2 ~= nil and p3 ~= nil then
			local NewSize = UseTokensModuleResult.Size.Size_200 * 2 + UseTokensModuleResult.Stroke.Standard
			
			return p2:map(function(p5): UDim2
				-- upvalues: NewSize (copy)
				return UDim2.new(1, 0, 0, NewSize * p5)
			end)
		else
			return nil
		end
	end, { p1, p2, p3, UseTokensModuleResult })
	
	if p1 then
		return UseMemoResult, UseMemoResult1, UseMemoResult2, UseTokensModuleResult.Size.Size_1000
	else
		return UseMemoResult, UseMemoResult1, UseMemoResult2, nil
	end
end