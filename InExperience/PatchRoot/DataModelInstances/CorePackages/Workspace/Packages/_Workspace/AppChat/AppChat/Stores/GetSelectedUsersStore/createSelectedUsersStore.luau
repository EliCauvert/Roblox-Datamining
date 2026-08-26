local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local signalsModule = require(parent.Signals)
local signal = require(parent.AppCommonLib).Signal
local arraySet = require(appChat.DataStructures).ArraySet

return function()
	-- upvalues: signalsModule (ref), arraySet (ref), signal (ref)
	local var1, var2 = signalsModule.createSignal(0)
	local var3, var4 = signalsModule.createSignal(arraySet.new({}))
	local var5 = signalsModule.createComputed(function(p1)
		-- upvalues: var3 (ref), var1 (ref)
		return var3(p1):size() < var1(p1)
	end)
	local var6 = signalsModule.createComputed(function(p1)
		-- upvalues: var3 (ref)
		return var3(p1):size()
	end)
	local var7 = signalsModule.createComputed(function(p1)
		-- upvalues: var3 (ref)
		return var3(p1):toArray()
	end)
	local var8 = signal.new()
	local t = {}
	local t_1 = {}
	
	local function _()
		-- upvalues: var8 (write)
		var8:fire()
	end
	
	local function addUserId(p1)
		-- upvalues: var3 (ref), var5 (ref), var8 (write), var4 (ref)
		if var3(false):has(p1) then
			return true
		elseif var5(false) then
			var4(function(p2)
				-- upvalues: p1 (ref)
				local var9 = p2:clone()
				var9:add(p1)
				
				return var9
			end)
			
			return true
		end
		var8:fire()
		
		return false
	end
	
	return {
		setMaxSize = function(a)
			-- upvalues: var2 (ref)
			var2(function(_)
				-- upvalues: a (ref)
				return a
			end)
		end,
		getSelectedUserIdsCount = function()
			-- upvalues: var6 (ref)
			return var6
		end,
		getSelectedUserIdAtIndex = function(p1)
			-- upvalues: t (write), signalsModule (copy), var3 (ref)
			if not t[p1] then
				t[p1] = signalsModule.createComputed(function(p2)
					-- upvalues: var3 (copy), p1 (ref)
					return var3(p2):at(p1)
				end)
			end
			return t[p1]
		end,
		getIsUserSelected = function(p1)
			-- upvalues: t_1 (write), signalsModule (copy), var3 (ref)
			if not t_1[p1] then
				t_1[p1] = signalsModule.createComputed(function(p2)
					-- upvalues: var3 (copy), p1 (ref)
					return var3(p2):has(p1)
				end)
			end
			return t_1[p1]
		end,
		getMaxSize = function()
			-- upvalues: var1 (ref)
			return var1
		end,
		getSelectedUserIdsArray = function()
			-- upvalues: var7 (ref)
			return var7
		end,
		addUserId = addUserId,
		removeUserId = function(p1)
			-- upvalues: var4 (ref)
			var4(function(p2)
				-- upvalues: p1 (ref)
				if p2:has(p1) then
					local var9 = p2:clone()
					var9:remove(p1)
					
					return var9
				end
				return p2
			end)
		end,
		toggleUserId = function(p1)
			-- upvalues: var3 (ref), var4 (ref), addUserId (ref)
			if var3(false):has(p1) then
				var4(function(p2)
					-- upvalues: p1 (ref)
					if p2:has(p1) then
						local var9 = p2:clone()
						var9:remove(p1)
						
						return var9
					end
					return p2
				end)
				
				return true
			end
			return addUserId(p1)
		end,
		clearStore = function()
			-- upvalues: var8 (write), signal (copy), t (write), t_1 (write), var4 (ref), arraySet (copy)
			var8 = signal.new()
			t = {}
			t_1 = {}
			var4(function(_)
				-- upvalues: arraySet (copy)
				return arraySet.new({})
			end)
		end,
		onMaxSizeExceeded = function(a)
			-- upvalues: var8 (write)
			local var9 = var8:connect(a)
			
			return function()
				-- upvalues: var9 (ref)
				var9:disconnect()
			end
		end,
		hasUserId = function(p1)
			-- upvalues: var3 (ref)
			return var3(false):has(p1)
		end,
		getCount = function()
			-- upvalues: var3 (ref)
			return var3(false):size()
		end
	}
end