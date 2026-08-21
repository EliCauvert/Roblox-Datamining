local songbird = script:FindFirstAncestor("Songbird")
local cryoModule = require(songbird.Parent.Cryo)
local reactModule = require(songbird.Parent.React)
local useState = reactModule.useState
local useCallback = reactModule.useCallback
local var3 = reactModule.createContext(nil)

local function noOp() --[[ line: 32 ]] end

local t = {
	value = {
		assetId = nil,
		isVisible = false,
		hasThumbnail = false,
		setVisibility = noOp,
		setAssetId = noOp,
		setHasThumbnail = noOp
	}
}

return {
	Context = var3,
	Provider = function(p0) --[[ line: 47 ]]
		-- upvalues: cryoModule (ref), t (ref), useState (ref), useCallback (ref), reactModule (ref), var3 (ref)
		local var6 = cryoModule.Dictionary.join(t, p0)
		local var7, var8 = useState(var6.value.isVisible)
		local var9 = useCallback(function(p1) --[[ line: 53 ]]
			-- upvalues: var8 (ref)
			var8(function(p2) --[[ line: 54 ]]
				-- upvalues: p1 (ref)
				return if p2 == p1 then p2 else p1
			end)
		end, {})
		local var10, var11 = useState(nil)
		local var12 = useCallback(function(p3) --[[ line: 63 ]]
			-- upvalues: var11 (ref)
			var11(function(p4) --[[ line: 64 ]]
				-- upvalues: p3 (ref)
				return if p4 == p3 then p4 else p3
			end)
		end, {})
		local var13, var14 = useState(var6.value.hasThumbnail or false)
		
		return reactModule.createElement(var3.Provider, {
			value = {
				isVisible = var7,
				setVisibility = var9,
				assetId = var10,
				setAssetId = var12,
				hasThumbnail = var13,
				setHasThumbnail = useCallback(function(p5) --[[ line: 73 ]]
					-- upvalues: var14 (ref)
					var14(function(p6) --[[ line: 74 ]]
						-- upvalues: p5 (ref)
						return if p6 == p5 then p6 else p5
					end)
				end, {})
			}
		}, var6.children)
	end,
	use = function() --[[ line: 94 ]]
		-- upvalues: reactModule (ref), var3 (ref)
		local var15 = reactModule.useContext(var3)
		
		if var15 then
			return var15
		end
		error("attempt to use ReportAudioPopupContext with no provider. Add `ReportAudioPopupContext.Provider` to the React tree and try again")
	end
}