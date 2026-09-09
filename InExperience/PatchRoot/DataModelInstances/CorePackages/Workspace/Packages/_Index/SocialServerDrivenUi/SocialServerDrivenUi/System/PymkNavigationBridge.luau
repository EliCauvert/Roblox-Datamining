local signal = require(script:FindFirstAncestor("SocialServerDrivenUi").Parent.AppCommonLib).Signal
local var1 = nil
local var2 = nil

local function _()
	-- upvalues: var1 (write), signal (ref)
	if var1 == nil then
		local var3 = signal.new()
		var1 = var3
		
		return var3
	end
	return var1
end

local _ = function()
	-- upvalues: var2 (write), signal (ref)
	if var2 == nil then
		local var3 = signal.new()
		var2 = var3
		
		return var3
	end
	return var2
end

return {
	requestOpenProfile = function(p1, p2)
		-- upvalues: var1 (write), signal (ref)
		local var3
		if var1 == nil then
			local var4 = signal.new()
			var1 = var4
			var3 = var4
		else
			var3 = var1
		end
		var3:fire({ userId = p1, extraProps = p2 })
	end,
	subscribeOpenProfile = function(p1)
		-- upvalues: var1 (write), signal (ref)
		local var3
		if var1 == nil then
			local var4 = signal.new()
			var1 = var4
			var3 = var4
		else
			var3 = var1
		end
		return var3:connect(p1)
	end,
	requestOpenAddFriends = function()
		-- upvalues: var2 (write), signal (ref)
		local var3
		if var2 == nil then
			local var4 = signal.new()
			var2 = var4
			var3 = var4
		else
			var3 = var2
		end
		var3:fire()
	end,
	subscribeOpenAddFriends = function(p1)
		-- upvalues: var2 (write), signal (ref)
		local var3
		if var2 == nil then
			local var4 = signal.new()
			var2 = var4
			var3 = var4
		else
			var3 = var2
		end
		return var3:connect(p1)
	end
}