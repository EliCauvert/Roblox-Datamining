local GamePlayButton = script:FindFirstAncestor("GamePlayButton")
local FetchGamePlayabilityAndProductInfo = require(GamePlayButton.Parent.GameDetailRodux).FetchGamePlayabilityAndProductInfo
local GetFFlagLuaAppFetchPlayabilityKillSwitchModule = require(GamePlayButton.Flags.GetFFlagLuaAppFetchPlayabilityKillSwitch)
local t = {}

return function(p1, p2, Callback, Callback1)
	-- upvalues: t (copy), GetFFlagLuaAppFetchPlayabilityKillSwitchModule (copy), FetchGamePlayabilityAndProductInfo (copy)
	return function(p3)
		-- upvalues: p2 (copy), Callback1 (copy), Callback (copy), t (upval), GetFFlagLuaAppFetchPlayabilityKillSwitchModule (upval), FetchGamePlayabilityAndProductInfo (upval), p1 (copy)
		local function _()
			-- upvalues: p3 (copy), p2 (upval), Callback1 (upval), Callback (upval)
			local PlayabilityStatusEntry = p3:getState().PlayabilityStatus[p2]
			
			if PlayabilityStatusEntry and PlayabilityStatusEntry.isPlayable == false then
				Callback1()
				
				return
			else
				Callback()
			end
		end
		
		local function settle()
			-- upvalues: t (upval), p2 (upval), p3 (copy), Callback1 (upval), Callback (upval)
			t[p2] = nil
			local PlayabilityStatusEntry = p3:getState().PlayabilityStatus[p2]
			
			if PlayabilityStatusEntry and PlayabilityStatusEntry.isPlayable == false then
				Callback1()
				
				return
			else
				Callback()
			end
		end
		
		if t[p2] then return end
		if p3:getState().PlayabilityStatus[p2] ~= nil then
			local PlayabilityStatusEntry = p3:getState().PlayabilityStatus[p2]
			
			if PlayabilityStatusEntry and PlayabilityStatusEntry.isPlayable == false then
				Callback1()
				
				return
			else
				Callback()
				
				return
			end
		elseif GetFFlagLuaAppFetchPlayabilityKillSwitchModule() then
			Callback()
			
			return
		else
			t[p2] = true
			p3:dispatch(FetchGamePlayabilityAndProductInfo.Fetch(p1, p2)):andThen(settle, settle)
		end
	end
end