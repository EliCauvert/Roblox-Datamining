local _ = require("../types")
local _ = require("../host")
local OwnerModule = require("../ownership/owner")
local _ = require("../reactive/types")
local CellModule = require("../reactive/cell")
local SupportModule = require("../structure/support")
local FrameModule = require("../ownership/frame")

return function(p1, Callback)
	-- upvalues: CellModule (copy), FrameModule (copy), OwnerModule (copy), SupportModule (copy)
	return function(p2)
		-- upvalues: Callback (copy), p1 (copy), CellModule (upval), FrameModule (upval), OwnerModule (upval), SupportModule (upval)
		local Settled = Callback("settled")
		local ComposeSettledRequiresHostFrames = assert(p1.frames, "Compose settled requires host.frames")
		local Frames = p2.frames or 2
		local NoTimeout: boolean = Frames >= 1 and Frames < 1e999 and Frames % 1 == 0
		assert(NoTimeout, "Compose settled frames must be a positive integer")
		NoTimeout = p2.timeout == nil or p2.timeout >= 0 and p2.timeout < 1e999
		assert(NoTimeout, "Compose settled timeout must be finite and nonnegative")
		local CellResult = CellModule.cell(false)
		NoTimeout = nil
		local Count = 0
		
		local function _()
			-- upvalues: Count (ref), NoTimeout (ref)
			Count += 1
			NoTimeout.stop()
		end
		
		local Config = nil
		local Equals = p2.equals or CellModule.defaultEquals
		local v1 = 0
		local Total = 0
		NoTimeout = FrameModule(Settled, ComposeSettledRequiresHostFrames.onFrame, function(Amount: number)
			-- upvalues: p2 (copy), v1 (ref), Total (ref), Count (ref), OwnerModule (upval), Settled (copy), Config (ref), Equals (copy), Frames (copy), NoTimeout (ref), CellResult (copy)
			if p2.ready and not p2.ready() then
				v1 = 0
				Total = 0
				
				return
			end
			local SampleResult = p2.sample()
			
			if Count ~= Count or OwnerModule.isDisposed(Settled) then return end
			Total += Amount
			v1 = if v1 > 0 and Config ~= nil and Equals(Config.value, SampleResult) then v1 + 1 else 1
			
			if Config == nil then
				Config = { value = SampleResult }
			else
				Config.value = SampleResult
			end
			if Frames <= v1 or p2.timeout ~= nil and p2.timeout <= Total then
				Count += 1
				NoTimeout.stop()
				CellResult:set(true)
			end
		end)
		
		local _ = function()
			-- upvalues: Count (ref), NoTimeout (ref), OwnerModule (upval), Settled (copy), CellResult (copy), Config (ref), v1 (ref), Total (ref)
			Count += 1
			NoTimeout.stop()
			
			if not OwnerModule.isDisposed(Settled) then
				CellResult:set(false)
				Config = nil
				v1 = 0
				Total = 0
				NoTimeout.start()
				
				return
			end
		end
		
		if p2.restart then
			local Settled1 = SupportModule.sourceOf(p2.restart, "settled", "restart")
			local v2 = nil
			local Flag = false
			OwnerModule.watch(Settled, function(p3)
				-- upvalues: Settled1 (copy), Flag (ref), v2 (ref), Count (ref), NoTimeout (ref), OwnerModule (upval), Settled (copy), CellResult (copy), Config (ref), v1 (ref), Total (ref)
				local SettledResult = Settled1(p3)
				
				if not Flag or SettledResult ~= v2 then
					Flag = true
					v2 = SettledResult
					Count += 1
					NoTimeout.stop()
					
					if OwnerModule.isDisposed(Settled) then return end
					CellResult:set(false)
					Config = nil
					v1 = 0
					Total = 0
					NoTimeout.start()
				end
			end)
		else
			Count += 1
			NoTimeout.stop()
			
			if not OwnerModule.isDisposed(Settled) then
				CellResult:set(false)
				Config = nil
				v1 = 0
				Total = 0
				NoTimeout.start()
			end
		end
		return CellResult
	end
end