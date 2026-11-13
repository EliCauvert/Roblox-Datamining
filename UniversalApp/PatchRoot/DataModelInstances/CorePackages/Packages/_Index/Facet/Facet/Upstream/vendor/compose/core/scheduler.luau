local _ = require("./types")
local ActiveModule = require("./ownership/active")
local DiagnosticsModule = require("./diagnostics")
local OwnerModule = require("./ownership/owner")
local _ = require("./host")
local FrameModule = require("./ownership/frame")

local function noop(): boolean
	return false
end

local function checkDelay(p1: number)
	-- upvalues: DiagnosticsModule (copy)
	if type(p1) == "number" and p1 == p1 and p1 >= 0 and p1 ~= 1e999 then return end
	return DiagnosticsModule.raise("scheduler/invalid-delay", "a scheduled task needs a finite delay of zero or more seconds", {
		expected = "seconds, e.g. 0.25; zero runs on the next frame",
		actual = DiagnosticsModule.describe(p1)
	})
end

local function _(Callback)
	-- upvalues: DiagnosticsModule (copy)
	if type(Callback) == "function" then return end
	return DiagnosticsModule.raise("scheduler/invalid-body", "a scheduled task needs a function to run", {
		expected = "a function taking no arguments",
		actual = DiagnosticsModule.describe(Callback)
	})
end

local _ = function(p1)
	-- upvalues: DiagnosticsModule (copy)
	if p1 ~= nil and p1 == p1 then return end
	return DiagnosticsModule.raise("scheduler/invalid-key", "a replacement key must be a value other than nil or NaN", {
		expected = "a string, number, boolean or table identifying the work",
		actual = DiagnosticsModule.describe(p1)
	})
end

return {
	createSchedulers = function(p1, Callback)
		-- upvalues: OwnerModule (copy), DiagnosticsModule (copy), ActiveModule (copy), FrameModule (copy), checkDelay (copy), noop (copy)
		return function(p2)
			-- upvalues: OwnerModule (upval), DiagnosticsModule (upval), Callback (copy), p1 (copy), ActiveModule (upval), FrameModule (upval), checkDelay (upval), noop (upval)
			local Scheduler = nil
			if p2 == nil then
				Scheduler = Callback("scheduler")
			else
				if not OwnerModule.isOwner(p2) then
					return DiagnosticsModule.raise("scheduler/invalid-owner", "a scheduler can only be bound to an owner", {
						expected = "an owner from Compose.createOwner or Compose.owner.createChild",
						actual = DiagnosticsModule.describe(p2)
					})
				end
				Scheduler = p2
			end
			local Child = OwnerModule.createChild(Scheduler)
			local Tbl = {}
			local Tbl1 = {}
			local Count = 0
			local Sequence = 0
			local Frames = p1.frames
			
			if Frames == nil then
				OwnerModule.dispose(Child)
				
				return DiagnosticsModule.raise("animation/no-frames", "a scheduler needs host.frames", {})
			else
				local Total = 0
				local v1 = nil
				
				local function _(Key): boolean
					-- upvalues: Tbl (copy), Count (ref), Tbl1 (copy), v1 (ref)
					if not Key.live then
						return false
					end
					Key.live = false
					Tbl[Key] = nil
					Count -= 1
					
					if Key.key ~= nil and Tbl1[Key.key] == Key then
						Tbl1[Key.key] = nil
					end
					if Count == 0 then
						v1.stop()
					end
					return true
				end
				
				local function drain(Total)
					-- upvalues: Tbl (copy), Count (ref), Tbl1 (copy), v1 (ref), ActiveModule (upval), Child (copy), OwnerModule (upval)
					local List = {}
					
					for i in Tbl do
						if i.due <= Total then
							table.insert(List, i)
						end
					end
					if #List == 0 then return end
					table.sort(List, function(A, B): boolean
						return if A.due == B.due then A.sequence < B.sequence else A.due < B.due
					end)
					local List1 = {}
					
					for _, value in List do
						if value.live then
							if value.live then
								value.live = false
								Tbl[value] = nil
								Count -= 1
								
								if value.key ~= nil and Tbl1[value.key] == value then
									Tbl1[value.key] = nil
								end
								if Count == 0 then
									v1.stop()
								end
							end
							local Success, Result = pcall(function()
								-- upvalues: ActiveModule (upval), Child (upval), value (copy)
								ActiveModule.withOwner(Child, value.body)
								
								return nil
							end)
							
							if not Success then
								table.insert(List1, Result)
							end
						end
					end
					OwnerModule.raiseAll(List1)
				end
				
				v1 = FrameModule(Child, Frames.onFrame, function(Amount)
					-- upvalues: Total (ref), drain (copy)
					Total += Amount
					drain(Total)
				end)
				OwnerModule.own(Child, function()
					-- upvalues: Tbl (copy), Tbl1 (copy), Count (ref)
					for i in Tbl do
						i.live = false
					end
					table.clear(Tbl)
					table.clear(Tbl1)
					Count = 0
				end)
				
				local function schedule(Key, p3, Callback)
					-- upvalues: checkDelay (upval), DiagnosticsModule (upval), OwnerModule (upval), Child (copy), noop (upval), Tbl1 (copy), Tbl (copy), Count (ref), v1 (ref), Sequence (ref), Total (ref)
					checkDelay(p3)
					
					if type(Callback) ~= "function" then
						local _ = DiagnosticsModule.raise("scheduler/invalid-body", "a scheduled task needs a function to run", {
							expected = "a function taking no arguments",
							actual = DiagnosticsModule.describe(Callback)
						})
					end
					if OwnerModule.isDisposed(Child) then
						return noop
					end
					if Key ~= nil then
						local Entry = Tbl1[Key]
						
						if Entry ~= nil and Entry.live then
							Entry.live = false
							Tbl[Entry] = nil
							Count -= 1
							
							if Entry.key ~= nil and Tbl1[Entry.key] == Entry then
								Tbl1[Entry.key] = nil
							end
							if Count == 0 then
								v1.stop()
							end
						end
					end
					Sequence += 1
					local config = {
						live = true,
						due = Total + p3,
						sequence = Sequence,
						key = Key,
						body = Callback
					}
					Tbl[config] = true
					
					if Key ~= nil then
						Tbl1[Key] = config
					end
					Count += 1
					
					if Count == 1 then
						v1.start()
					end
					return function(): boolean
						-- upvalues: config (copy), Tbl (upval), Count (upval), Tbl1 (upval), v1 (upval)
						if not config.live then
							return false
						end
						config.live = false
						Tbl[config] = nil
						Count -= 1
						
						if config.key ~= nil and Tbl1[config.key] == config then
							Tbl1[config.key] = nil
						end
						if Count == 0 then
							v1.stop()
						end
						return true
					end
				end
				
				return {
					after = function(p3, Body)
						-- upvalues: schedule (copy)
						return (schedule(nil, p3, Body))
					end,
					replace = function(Key, p3, Body)
						-- upvalues: DiagnosticsModule (upval), schedule (copy)
						if Key == nil or Key ~= Key then
							local _ = DiagnosticsModule.raise("scheduler/invalid-key", "a replacement key must be a value other than nil or NaN", {
								expected = "a string, number, boolean or table identifying the work",
								actual = DiagnosticsModule.describe(Key)
							})
						end
						return (schedule(Key, p3, Body))
					end,
					cancel = function(p3): boolean
						-- upvalues: Tbl1 (copy), Tbl (copy), Count (ref), v1 (ref)
						local Entry = Tbl1[p3]
						local Flag = false
						
						if Entry ~= nil then
							if not Entry.live then
								return false
							end
							Entry.live = false
							Tbl[Entry] = nil
							Count -= 1
							
							if Entry.key ~= nil and Tbl1[Entry.key] == Entry then
								Tbl1[Entry.key] = nil
							end
							if Count == 0 then
								v1.stop()
							end
							Flag = true
						end
						return Flag
					end,
					clear = function()
						-- upvalues: Tbl (copy), Count (ref), Tbl1 (copy), v1 (ref)
						for i in Tbl do
							if i.live then
								i.live = false
								Tbl[i] = nil
								Count -= 1
								
								if i.key ~= nil and Tbl1[i.key] == i then
									Tbl1[i.key] = nil
								end
								if Count == 0 then
									v1.stop()
								end
							end
						end
					end,
					pending = function()
						-- upvalues: Count (ref)
						return Count
					end,
					dispose = OwnerModule.disposer(Child)
				}
			end
		end
	end
}