local Signal = require(script:FindFirstAncestor("SocialServerDrivenUi").Parent.AppCommonLib).Signal
local v1 = nil
local v2 = nil

local function _()
	-- upvalues: v1 (ref), Signal (copy)
	local v3 = v1
	
	if v3 == nil then
		local NewSignal = Signal.new()
		v1 = NewSignal
		
		return NewSignal
	else
		return v3
	end
end

local _ = function()
	-- upvalues: v2 (ref), Signal (copy)
	local v3 = v2
	
	if v3 == nil then
		local NewSignal = Signal.new()
		v2 = NewSignal
		
		return NewSignal
	else
		return v3
	end
end

return {
	requestOpenProfile = function(UserId, ExtraProps)
		-- upvalues: v1 (ref), Signal (copy)
		local v3 = v1
		local v4 = nil
		
		if v3 == nil then
			local NewSignal = Signal.new()
			v1 = NewSignal
			v4 = NewSignal
		else
			v4 = v3
		end
		v4:fire({ userId = UserId, extraProps = ExtraProps })
	end,
	subscribeOpenProfile = function(p1)
		-- upvalues: v1 (ref), Signal (copy)
		local v3 = v1
		local v4 = nil
		
		if v3 == nil then
			local NewSignal = Signal.new()
			v1 = NewSignal
			v4 = NewSignal
		else
			v4 = v3
		end
		return v4:connect(p1)
	end,
	requestOpenAddFriends = function()
		-- upvalues: v2 (ref), Signal (copy)
		local v3 = v2
		local v4 = nil
		
		if v3 == nil then
			local NewSignal = Signal.new()
			v2 = NewSignal
			v4 = NewSignal
		else
			v4 = v3
		end
		v4:fire()
	end,
	subscribeOpenAddFriends = function(p1)
		-- upvalues: v2 (ref), Signal (copy)
		local v3 = v2
		local v4 = nil
		
		if v3 == nil then
			local NewSignal = Signal.new()
			v2 = NewSignal
			v4 = NewSignal
		else
			v4 = v3
		end
		return v4:connect(p1)
	end
}