local MomentsCommon = script:FindFirstAncestor("MomentsCommon")
local SignalsModule = require(MomentsCommon.Parent.Signals)
local _ = require(MomentsCommon.Media.MediaTypes)
local _ = require(MomentsCommon.Media.Preload.selectPreloadPolicy)
local _ = require(MomentsCommon.Media.Telemetry.mediaTelemetry)
local CreateMomentMediaControllerModule = require(MomentsCommon.Media.createMomentMediaController)
local DefaultMediaNodeRegistryModule = require(MomentsCommon.Media.defaultMediaNodeRegistry)
local _ = require(MomentsCommon.Media.mediaNodeRegistry)
local CreateSignalFunction = SignalsModule.createSignal
local CreateEffectFunction = SignalsModule.createEffect

local function _(p1, p2, p3): boolean
	return p2 - p3.back <= p1 and p1 <= p2 + p3.forward
end

return function(p1, p2, p3, AudioDeviceOutput, Services, p4)
	-- upvalues: DefaultMediaNodeRegistryModule (copy), CreateMomentMediaControllerModule (copy), CreateSignalFunction (copy), CreateEffectFunction (copy)
	local P8 = p4 or {}
	local Now = Services.now or os.clock
	local Registry = P8.registry or DefaultMediaNodeRegistryModule()
	local CreateController = P8.createController or function(p5)
		-- upvalues: CreateMomentMediaControllerModule (upval), Services (copy), AudioDeviceOutput (copy), Registry (copy), P8 (copy)
		return CreateMomentMediaControllerModule(p5, {
			services = Services,
			audioDeviceOutput = AudioDeviceOutput,
			registry = Registry,
			parent = P8.parent,
			masterVolume = P8.masterVolume
		})
	end
	local Tbl = {}
	local MomentId = nil
	local Flag = false
	local Signal, Signal2 = CreateSignalFunction({})
	
	local function _()
		-- upvalues: Tbl (copy), Signal2 (copy)
		local Controllers = {}
		
		for i, value in Tbl do
			Controllers[i] = value.controller
		end
		Signal2(Controllers)
	end
	
	local function reconcile(p5)
		-- upvalues: p1 (copy), p2 (copy), Tbl (copy), MomentId (ref), CreateController (copy), Flag (ref), Signal2 (copy), Now (copy), p3 (copy)
		local Items = p1.getItems(p5)
		local ActiveIndex = p1.getActiveIndex(p5)
		local PlaybackActive = p1.getPlaybackActive(p5)
		local Item = Items[ActiveIndex]
		local MomentId1 = if Item == nil then nil else Item.momentId
		local t = {}
		local t1 = {}
		local t2 = {}
		
		for i, item in Items do
			local DownloadWindow = p2.downloadWindow
			
			if ActiveIndex - DownloadWindow.back <= i and i <= ActiveIndex + DownloadWindow.forward then
				t[item.momentId] = true
				t2[item.momentId] = item
				local DecodeWindow = p2.decodeWindow
				
				if ActiveIndex - DecodeWindow.back <= i and i <= ActiveIndex + DecodeWindow.forward then
					t1[item.momentId] = true
				end
			end
		end
		local Flag1 = false
		
		for i1, value in Tbl do
			if not t[i1] then
				if MomentId == i1 then
					MomentId = nil
				end
				value.controller.dispose()
				Tbl[i1] = nil
				Flag1 = true
			end
		end
		for i2 in t do
			if Tbl[i2] == nil then
				local Controller = CreateController(t2[i2])
				local config = {
					active = nil,
					decoded = false,
					recordedTtff = false,
					decodeStartedAt = nil,
					controller = Controller
				}
				Tbl[i2] = config
				Flag1 = true
				task.spawn(function()
					-- upvalues: Flag (upval), Tbl (upval), i2 (copy), config (copy), Controller (copy)
					if not Flag and Tbl[i2] == config then
						Controller.download()
						
						return
					end
				end)
			end
		end
		if Flag1 then
			local Controllers = {}
			
			for i3, value1 in Tbl do
				Controllers[i3] = value1.controller
			end
			Signal2(Controllers)
		end
		for i4, value2 in Tbl do
			local IsEntry = t1[i4] == true
			
			if IsEntry and not value2.decoded then
				value2.decodeStartedAt = Now()
				value2.controller.decode()
				value2.decoded = true
			elseif not IsEntry and value2.decoded then
				value2.controller.releaseDecoder()
				value2.decoded = false
			end
		end
		for i5, value3 in Tbl do
			local IsMomentIdMatch = i5 == MomentId1
			
			if value3.active ~= IsMomentIdMatch then
				value3.controller.setActive(IsMomentIdMatch)
				value3.active = IsMomentIdMatch
			end
		end
		local Entry = if MomentId1 == nil then nil else Tbl[MomentId1]
		local IsReady: boolean = Entry ~= nil and Entry.controller.getState(p5).readiness == "Ready"
		
		if PlaybackActive and Entry ~= nil and IsReady then
			if MomentId ~= MomentId1 then
				if MomentId ~= nil and Tbl[MomentId] ~= nil then
					Tbl[MomentId].controller.pause()
				end
				MomentId = MomentId1
				Entry.controller.play()
				
				if not Entry.recordedTtff then
					Entry.recordedTtff = true
					local DecodeStartedAt = Entry.decodeStartedAt
					
					if DecodeStartedAt ~= nil and MomentId1 ~= nil then
						p3.recordTimeToFirstFrame({
							momentId = MomentId1,
							durationSeconds = Now() - DecodeStartedAt
						})
						
						return
					end
				end
			end
		elseif MomentId ~= nil then
			if Tbl[MomentId] ~= nil then
				Tbl[MomentId].controller.pause()
			end
			MomentId = nil
		end
	end
	
	local Effect = CreateEffectFunction(function(p6)
		-- upvalues: Flag (ref), reconcile (copy)
		if not Flag then
			reconcile(p6)
			
			return
		end
	end)
	
	return {
		getControllerFor = function(p6)
			-- upvalues: Tbl (copy)
			local Entry = Tbl[p6]
			
			return if Entry == nil then nil else Entry.controller
		end,
		getControllerMap = Signal,
		dispose = function()
			-- upvalues: Flag (ref), Effect (copy), Tbl (copy), MomentId (ref), Signal2 (copy)
			if Flag then return end
			Flag = true
			Effect()
			
			for _, value in Tbl do
				value.controller.dispose()
			end
			table.clear(Tbl)
			MomentId = nil
			Signal2({})
		end
	}
end