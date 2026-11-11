local Songbird = script:FindFirstAncestor("Songbird")
local CryoModule = require(Songbird.Parent.Cryo)
local ReactModule = require(Songbird.Parent.React)
local UseStateFunction = ReactModule.useState
local UseCallbackFunction = ReactModule.useCallback
local Context = ReactModule.createContext(nil)

local function noOp() end

local config = {
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
	Context = Context,
	Provider = function(p1)
		-- upvalues: CryoModule (copy), config (copy), UseStateFunction (copy), UseCallbackFunction (copy), ReactModule (copy), Context (copy)
		local JoinResult = CryoModule.Dictionary.join(config, p1)
		local UseStateResult, UseStateResult2 = UseStateFunction(JoinResult.value.isVisible)
		local UseCallbackResult = UseCallbackFunction(function(p2)
			-- upvalues: UseStateResult2 (copy)
			UseStateResult2(function(p3)
				-- upvalues: p2 (copy)
				return if p3 == p2 then p3 else p2
			end)
		end, {})
		local UseStateResult1, UseStateResult2_1 = UseStateFunction(nil)
		local UseCallbackResult1 = UseCallbackFunction(function(p2)
			-- upvalues: UseStateResult2_1 (copy)
			UseStateResult2_1(function(p3)
				-- upvalues: p2 (copy)
				return if p3 == p2 then p3 else p2
			end)
		end, {})
		local UseStateResult3, UseStateResult2_2 = UseStateFunction(JoinResult.value.hasThumbnail or false)
		
		return ReactModule.createElement(Context.Provider, {
			value = {
				isVisible = UseStateResult,
				setVisibility = UseCallbackResult,
				assetId = UseStateResult1,
				setAssetId = UseCallbackResult1,
				hasThumbnail = UseStateResult3,
				setHasThumbnail = UseCallbackFunction(function(p2)
					-- upvalues: UseStateResult2_2 (copy)
					UseStateResult2_2(function(p3)
						-- upvalues: p2 (copy)
						return if p3 == p2 then p3 else p2
					end)
				end, {})
			}
		}, JoinResult.children)
	end,
	use = function()
		-- upvalues: ReactModule (copy), Context (copy)
		local UseContextResult = ReactModule.useContext(Context)
		
		if UseContextResult then
			return UseContextResult
		else
			error("attempt to use ReportAudioPopupContext with no provider. Add `ReportAudioPopupContext.Provider` to the React tree and try again")
		end
	end
}