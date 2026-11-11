local RunService = game:GetService("RunService")
RunService = require(script:FindFirstAncestor("SplashScreenManager").Parent.MockableProxyServices).RunService
local ColorCorrect = nil

local function _()
	-- upvalues: ColorCorrect (ref)
	ColorCorrect = Instance.new("ColorCorrectionEffect")
	
	if ColorCorrect then
		ColorCorrect.Name = "__SplashScreenManager_Fader__"
		ColorCorrect.Parent = game:GetService("Lighting")
		ColorCorrect.TintColor = Color3.new(0, 0, 0)
		ColorCorrect.Enabled = true
	end
end

local _ = function()
	-- upvalues: ColorCorrect (ref)
	if ColorCorrect then
		ColorCorrect:Destroy()
		ColorCorrect = nil
	end
end

local Flag = false
local Flag1 = true
local Flag2 = false
local List = {}

local _ = function()
	-- upvalues: List (copy), Flag1 (ref)
	for _, value in List do
		value(Flag1)
	end
end

return {
	initialize = function(p1: number, p2, p3)
		-- upvalues: Flag2 (ref), Flag (ref), Flag1 (ref), ColorCorrect (ref), List (copy), RunService (ref)
		if not Flag2 and not Flag then
			Flag1 = false
			ColorCorrect = Instance.new("ColorCorrectionEffect")
			
			if ColorCorrect then
				ColorCorrect.Name = "__SplashScreenManager_Fader__"
				ColorCorrect.Parent = game:GetService("Lighting")
				ColorCorrect.TintColor = Color3.new(0, 0, 0)
				ColorCorrect.Enabled = true
			end
			for _, value in List do
				value(Flag1)
			end
			local List1 = {}
			local Total = 0
			local v1 = 1 / p1
			local P2 = p3 or p1
			local CurrentTime = tick()
			local Elapsed = 0
			local Connection = nil
			
			local function _()
				-- upvalues: Connection (ref), ColorCorrect (upval), Flag1 (upval), Flag2 (upval)
				if Connection then
					Connection:Disconnect()
				end
				if ColorCorrect then
					ColorCorrect:Destroy()
					ColorCorrect = nil
				end
				Flag1 = true
				Flag2 = false
			end
			
			Connection = RunService.RenderStepped:Connect(function(DeltaTime)
				-- upvalues: Elapsed (ref), CurrentTime (copy), List1 (copy), Total (ref), P2 (copy), p2 (copy), v1 (copy), Flag1 (upval), List (upval), Connection (ref), ColorCorrect (upval), Flag2 (upval)
				Elapsed = tick() - CurrentTime
				table.insert(List1, DeltaTime)
				Total += DeltaTime
				
				if P2 < #List1 then
					local Removed = table.remove(List1, 1)
					
					if Removed ~= nil then
						Total -= Removed
					end
				end
				local TotalRatio = Total / #List1
				
				if p2 and p2 < Elapsed or P2 <= #List1 and math.floor(TotalRatio * 100) <= math.floor(v1 * 100) then
					Flag1 = true
					
					for _, value in List do
						value(Flag1)
					end
					if Connection then
						Connection:Disconnect()
					end
					if ColorCorrect then
						ColorCorrect:Destroy()
						ColorCorrect = nil
					end
					Flag1 = true
					Flag2 = false
				end
			end)
			Flag2 = true
		end
	end,
	addStatusChangeListener = function(p4)
		-- upvalues: List (copy)
		table.insert(List, p4)
		
		return p4
	end,
	removeStatusChangeListener = function(p4)
		-- upvalues: List (copy)
		for i, value in List do
			if value == p4 then
				table.remove(List, i)
			end
		end
	end,
	isFPSAtTarget = function()
		-- upvalues: Flag1 (ref)
		return Flag1
	end,
	__setTestMode = function()
		-- upvalues: Flag (ref)
		Flag = true
	end
}