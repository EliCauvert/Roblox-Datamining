local _ = game:GetService("RunService")
local runService = require(script:FindFirstAncestor("SplashScreenManager").Parent.MockableProxyServices).RunService
local var1 = nil

local function _()
	-- upvalues: var1 (write)
	var1 = Instance.new("ColorCorrectionEffect")
	
	if var1 then
		var1.Name = "__SplashScreenManager_Fader__"
		var1.Parent = game:GetService("Lighting")
		var1.TintColor = Color3.new(0, 0, 0)
		var1.Enabled = true
	end
end

local _ = function()
	-- upvalues: var1 (write)
	if var1 then
		var1:Destroy()
		var1 = nil
	end
end

local var2 = false
local var3 = true
local var4 = false
local t = {}

local _ = function()
	-- upvalues: t (ref), var3 (write)
	for i, v in t do
		v(var3)
	end
end

return {
	initialize = function(p1, p2, p3)
		-- upvalues: var4 (write), var2 (write), var3 (write), var1 (write), t (ref), runService (write)
		if not var4 and not var2 then
			var3 = false
			var1 = Instance.new("ColorCorrectionEffect")
			
			if var1 then
				var1.Name = "__SplashScreenManager_Fader__"
				var1.Parent = game:GetService("Lighting")
				var1.TintColor = Color3.new(0, 0, 0)
				var1.Enabled = true
			end
			for i, v in t do
				v(var3)
			end
			local t_1 = {}
			local var5 = 0
			local var6 = 1 / p1
			p3 = p3 or p1
			local currentTime = tick()
			local var7 = 0
			local renderSteppedConnection = nil
			
			local _ = function()
				-- upvalues: renderSteppedConnection (write), var1 (copy), var3 (copy), var4 (copy)
				if renderSteppedConnection then
					renderSteppedConnection:Disconnect()
				end
				if var1 then
					var1:Destroy()
					var1 = nil
				end
				var3 = true
				var4 = false
			end
			
			renderSteppedConnection = runService.RenderStepped:Connect(function(p4)
				-- upvalues: var7 (write), currentTime (ref), t_1 (ref), var5 (write), p3 (ref), p2 (ref), var6 (ref), var3 (copy), t (copy), renderSteppedConnection (write), var1 (copy), var4 (copy)
				var7 = tick() - currentTime
				table.insert(t_1, p4)
				var5 += p4
				
				if p3 < #t_1 then
					local removed = table.remove(t_1, 1)
					
					if removed ~= nil then
						var5 -= removed
					end
				end
				if p2 and p2 < var7 or p3 <= #t_1 and math.floor(var5 / #t_1 * 100) <= math.floor(var6 * 100) then
					var3 = true
					
					for i, v in t do
						v(var3)
					end
					if renderSteppedConnection then
						renderSteppedConnection:Disconnect()
					end
					if var1 then
						var1:Destroy()
						var1 = nil
					end
					var3 = true
					var4 = false
				end
			end)
			var4 = true
		end
	end,
	addStatusChangeListener = function(p4)
		-- upvalues: t (ref)
		table.insert(t, p4)
		
		return p4
	end,
	removeStatusChangeListener = function(p4)
		-- upvalues: t (ref)
		for i, v in t do
			if v == p4 then
				table.remove(t, i)
			end
		end
	end,
	isFPSAtTarget = function()
		-- upvalues: var3 (write)
		return var3
	end,
	__setTestMode = function()
		-- upvalues: var2 (write)
		var2 = true
	end
}