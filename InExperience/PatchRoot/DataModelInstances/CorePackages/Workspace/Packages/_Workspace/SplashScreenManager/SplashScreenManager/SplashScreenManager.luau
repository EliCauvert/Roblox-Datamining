local _ = game:GetService("RunService")
local runService = require(script:FindFirstAncestor("SplashScreenManager").Parent.MockableProxyServices).RunService
local var0 = nil

local function _() --[[ line: 19 | named "obfuscateEnvironment" ]]
	-- upvalues: var0 (write)
	var0 = Instance.new("ColorCorrectionEffect")
	
	if var0 then
		var0.Name = "__SplashScreenManager_Fader__"
		var0.Parent = game:GetService("Lighting")
		var0.TintColor = Color3.new(0, 0, 0)
		var0.Enabled = true
	end
end

local _ = function() --[[ line: 30 | named "unobfuscateEnvironment" ]]
	-- upvalues: var0 (write)
	if var0 then
		var0:Destroy()
		var0 = nil
	end
end

local var1 = false
local var2 = true
local var3 = false
local t = {}

local _ = function() --[[ line: 43 | named "callCallbacks" ]]
	-- upvalues: t (ref), var2 (write)
	for i, v in t do
		v(var2)
	end
end

return {
	initialize = function(p0, p1, p2) --[[ line: 50 ]]
		-- upvalues: var3 (write), var1 (write), var2 (write), var0 (write), t (ref), runService (write)
		if not var3 and not var1 then
			var2 = false
			var0 = Instance.new("ColorCorrectionEffect")
			
			if var0 then
				var0.Name = "__SplashScreenManager_Fader__"
				var0.Parent = game:GetService("Lighting")
				var0.TintColor = Color3.new(0, 0, 0)
				var0.Enabled = true
			end
			for i, v in t do
				v(var2)
			end
			local t_1 = {}
			local var6 = 0
			local var7 = 1 / p0
			p2 = p2 or p0
			local currentTime = tick()
			local var10 = 0
			local renderSteppedConnection = nil
			
			local _ = function() --[[ line: 65 ]]
				-- upvalues: renderSteppedConnection (write), var0 (copy), var2 (copy), var3 (copy)
				if renderSteppedConnection then
					renderSteppedConnection:Disconnect()
				end
				if var0 then
					var0:Destroy()
					var0 = nil
				end
				var2 = true
				var3 = false
			end
			
			renderSteppedConnection = runService.RenderStepped:Connect(function(p3) --[[ line: 74 ]]
				-- upvalues: var10 (write), currentTime (ref), t_1 (ref), var6 (write), p2 (ref), p1 (ref), var7 (ref), var2 (copy), t (copy), renderSteppedConnection (write), var0 (copy), var3 (copy)
				var10 = tick() - currentTime
				table.insert(t_1, p3)
				var6 += p3
				
				if p2 < #t_1 then
					local removed = table.remove(t_1, 1)
					
					if removed ~= nil then
						var6 -= removed
					end
				end
				if p1 and p1 < var10 or p2 <= #t_1 and math.floor(var6 / #t_1 * 100) <= math.floor(var7 * 100) then
					var2 = true
					
					for i, v in t do
						v(var2)
					end
					if renderSteppedConnection then
						renderSteppedConnection:Disconnect()
					end
					if var0 then
						var0:Destroy()
						var0 = nil
					end
					var2 = true
					var3 = false
				end
			end)
			var3 = true
		end
	end,
	addStatusChangeListener = function(p4) --[[ line: 106 ]]
		-- upvalues: t (ref)
		table.insert(t, p4)
		
		return p4
	end,
	removeStatusChangeListener = function(p5) --[[ line: 111 ]]
		-- upvalues: t (ref)
		for i, v in t do
			if v == p5 then
				table.remove(t, i)
			end
		end
	end,
	isFPSAtTarget = function() --[[ line: 119 ]]
		-- upvalues: var2 (write)
		return var2
	end,
	__setTestMode = function() --[[ line: 123 ]]
		-- upvalues: var1 (write)
		var1 = true
	end
}