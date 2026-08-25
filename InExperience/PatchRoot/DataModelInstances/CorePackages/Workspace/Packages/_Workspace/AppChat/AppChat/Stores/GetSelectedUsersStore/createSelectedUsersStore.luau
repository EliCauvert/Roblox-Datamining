local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local signalsModule = require(parent.Signals)
local signal = require(parent.AppCommonLib).Signal
local arraySet = require(appChat.DataStructures).ArraySet

return function()
	-- upvalues: signalsModule (ref), arraySet (ref), signal (ref)
	local var2, var3 = signalsModule.createSignal(0)
	local var4, var5 = signalsModule.createSignal(arraySet.new({}))
	local var6 = signalsModule.createComputed(function(p0)
		-- upvalues: var4 (ref), var2 (ref)
		return var4(p0):size() < var2(p0)
	end)
	local var7 = signalsModule.createComputed(function(p1)
		-- upvalues: var4 (ref)
		return var4(p1):size()
	end)
	local var8 = signalsModule.createComputed(function(p2)
		-- upvalues: var4 (ref)
		return var4(p2):toArray()
	end)
	local var9 = signal.new()
	local t = {}
	local t_1 = {}
	
	local function _()
		-- upvalues: var9 (write)
		var9:fire()
	end
	
	local function addUserId(p3)
		-- upvalues: var4 (ref), var6 (ref), var9 (write), var5 (ref)
		if var4(false):has(p3) then
			return true
		elseif var6(false) then
			var5(function(p4)
				-- upvalues: p3 (ref)
				local var13 = p4:clone()
				var13:add(p3)
				
				return var13
			end)
			
			return true
		end
		var9:fire()
		
		return false
	end
	
	return {
		setMaxSize = function(a)
			-- upvalues: var3 (ref)
			var3(function(_)
				-- upvalues: a (ref)
				return a
			end)
		end,
		getSelectedUserIdsCount = function()
			-- upvalues: var7 (ref)
			return var7
		end,
		getSelectedUserIdAtIndex = function(p5)
			-- upvalues: t (write), signalsModule (copy), var4 (ref)
			if not t[p5] then
				t[p5] = signalsModule.createComputed(function(p6)
					-- upvalues: var4 (copy), p5 (ref)
					return var4(p6):at(p5)
				end)
			end
			return t[p5]
		end,
		getIsUserSelected = function(p7)
			-- upvalues: t_1 (write), signalsModule (copy), var4 (ref)
			if not t_1[p7] then
				t_1[p7] = signalsModule.createComputed(function(p8)
					-- upvalues: var4 (copy), p7 (ref)
					return var4(p8):has(p7)
				end)
			end
			return t_1[p7]
		end,
		getMaxSize = function()
			-- upvalues: var2 (ref)
			return var2
		end,
		getSelectedUserIdsArray = function()
			-- upvalues: var8 (ref)
			return var8
		end,
		addUserId = addUserId,
		removeUserId = function(p9)
			-- upvalues: var5 (ref)
			var5(function(p10)
				-- upvalues: p9 (ref)
				if p10:has(p9) then
					local var14 = p10:clone()
					var14:remove(p9)
					
					return var14
				end
				return p10
			end)
		end,
		toggleUserId = function(p11)
			-- upvalues: var4 (ref), var5 (ref), addUserId (ref)
			if var4(false):has(p11) then
				var5(function(p12)
					-- upvalues: p11 (ref)
					if p12:has(p11) then
						local var14 = p12:clone()
						var14:remove(p11)
						
						return var14
					end
					return p12
				end)
				
				return true
			end
			return addUserId(p11)
		end,
		clearStore = function()
			-- upvalues: var9 (write), signal (copy), t (write), t_1 (write), var5 (ref), arraySet (copy)
			var9 = signal.new()
			t = {}
			t_1 = {}
			var5(function(_)
				-- upvalues: arraySet (copy)
				return arraySet.new({})
			end)
		end,
		onMaxSizeExceeded = function(a)
			-- upvalues: var9 (write)
			local var15 = var9:connect(a)
			
			return function()
				-- upvalues: var15 (ref)
				var15:disconnect()
			end
		end,
		hasUserId = function(p13)
			-- upvalues: var4 (ref)
			return var4(false):has(p13)
		end,
		getCount = function()
			-- upvalues: var4 (ref)
			return var4(false):size()
		end
	}
end