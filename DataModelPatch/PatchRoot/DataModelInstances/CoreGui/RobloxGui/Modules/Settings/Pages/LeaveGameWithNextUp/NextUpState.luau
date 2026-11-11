local CryoModule = require(game:GetService("CorePackages").Packages.Cryo)
local NextUpStateModule = {}

if require(script.Parent.Flags.FFlagEnableNextUpImageLatencyTelemetry) then
	local CurrentTime = nil
	local GetNextUpTilesLoaded = nil
	local v1 = nil
	
	function NextUpStateModule.getNextUpComponentSortLatency()
		-- upvalues: v1 (ref)
		return v1
	end
	
	function NextUpStateModule.nextUpComponentShown()
		-- upvalues: CurrentTime (ref)
		CurrentTime = time()
	end
	
	function NextUpStateModule.nextUpComponentSortDataLoaded()
		-- upvalues: GetNextUpTilesLoaded (ref), v1 (ref), CurrentTime (ref)
		if not GetNextUpTilesLoaded then
			local CurrentTime1 = time()
			GetNextUpTilesLoaded = CurrentTime1
			v1 = if CurrentTime then CurrentTime1 - CurrentTime else 0
			
			return
		end
	end
	
	local t = {}
	
	function NextUpStateModule.getNextUpTileImageTextureLatencies()
		-- upvalues: CryoModule (copy), t (ref)
		return CryoModule.Dictionary.values(t)
	end
	
	function NextUpStateModule.nextUpTileImageTextureLoaded(p1)
		-- upvalues: t (ref), GetNextUpTilesLoaded (ref)
		local Text = tostring(p1)
		
		if not t[Text] then
			t[Text] = if GetNextUpTilesLoaded then time() - GetNextUpTilesLoaded else 0
			
			return
		end
	end
	
	function NextUpStateModule.resetNextUpLatencyTelemetry()
		-- upvalues: GetNextUpTilesLoaded (ref), t (ref), CurrentTime (ref), v1 (ref)
		GetNextUpTilesLoaded = nil
		t = {}
		CurrentTime = nil
		v1 = nil
	end
	
	return NextUpStateModule
else
	local CurrentTime = false
	
	local function GetNextUpTilesLoaded(Value)
		-- upvalues: CurrentTime (ref)
		CurrentTime = Value
	end
	
	NextUpStateModule.setNextUpTilesLoaded = GetNextUpTilesLoaded
	
	GetNextUpTilesLoaded = function()
		-- upvalues: CurrentTime (ref)
		return CurrentTime
	end
	
	NextUpStateModule.getNextUpTilesLoaded = GetNextUpTilesLoaded
	
	return NextUpStateModule
end