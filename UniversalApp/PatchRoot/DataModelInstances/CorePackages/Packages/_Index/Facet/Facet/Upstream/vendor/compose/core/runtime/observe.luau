local _ = require("../types")
local _ = require("../host")
local OwnerModule = require("../ownership/owner")
local _ = require("../reactive/types")
local CellModule = require("../reactive/cell")
local ReactorModule = require("../reactive/reactor")

return function(p1, Callback, p2)
	-- upvalues: ReactorModule (copy), OwnerModule (copy), CellModule (copy)
	local t = {}
	local t1 = {}
	local t2 = {}
	local OnFrameResult = nil
	
	local function _()
		-- upvalues: t1 (ref), t2 (copy), OnFrameResult (ref)
		if next(t1) == nil and next(t2) == nil and OnFrameResult then
			local Callback: () -> () = OnFrameResult
			OnFrameResult = nil
			Callback()
		end
	end
	
	local function releaseRecord(p3)
		-- upvalues: t (copy), t1 (ref), t2 (copy), OnFrameResult (ref)
		p3.references -= 1
		
		if p3.references > 0 then return end
		local Properties = p3.properties
		
		if Properties[p3.key] == p3 then
			Properties[p3.key] = nil
			
			if next(Properties) == nil and t[p3.node] == Properties then
				t[p3.node] = nil
			end
		end
		local Entry = p3.entry
		
		if Entry ~= nil then
			Entry.live = false
			t1[Entry] = nil
			t2[Entry] = nil
			
			if next(t1) == nil and next(t2) == nil and OnFrameResult then
				local Callback: () -> () = OnFrameResult
				OnFrameResult = nil
				Callback()
			end
		end
		local UnsubscribeFunction: () -> () = p3.unsubscribe
		p3.unsubscribe = nil
		
		if UnsubscribeFunction ~= nil then
			UnsubscribeFunction()
		end
	end
	
	local t3 = {}
	local Tbl = {}
	local Tbl1 = {}
	local v1 = 0
	
	local function publish()
		-- upvalues: v1 (ref), Tbl (copy), Tbl1 (copy)
		local v2: number = v1
		v1 = 0
		
		for i = 1, v2 do
			local Entry = Tbl[i]
			
			if Entry.live then
				Entry.value:set(Tbl1[i])
			end
		end
		table.clear(Tbl)
		table.clear(Tbl1)
	end
	
	local _ = function()
		-- upvalues: OnFrameResult (ref), p1 (copy), t1 (ref), t3 (ref), t2 (copy), Tbl (copy), Tbl1 (copy), v1 (ref), ReactorModule (upval), p2 (copy), publish (copy), OwnerModule (upval)
		if not OnFrameResult then
			OnFrameResult = assert(p1.frames, "Compose frame observation requires host.frames").onFrame(function()
				-- upvalues: t1 (upval), t3 (upval), t2 (upval), Tbl (upval), Tbl1 (upval), v1 (upval), ReactorModule (upval), p2 (upval), publish (upval), OnFrameResult (upval), OwnerModule (upval)
				local Tbl = t1
				t1 = t3
				
				for i in t2 do
					Tbl[i] = true
				end
				local v3 = nil
				local Count = 0
				
				for i1 in Tbl do
					if i1.live then
						local Success, Result = pcall(i1.read)
						
						if not Success then
							local List = v3 or {}
							v3 = List
							table.insert(List, Result)
						elseif Result ~= i1.value:peek() then
							i1.quiet = 0
							Count += 1
							Tbl[Count] = i1
							Tbl1[Count] = Result
						elseif t2[i1] then
							i1.quiet += 1
							
							if i1.quiet >= 3 then
								t2[i1] = nil
							end
						end
					end
				end
				table.clear(Tbl)
				t3 = Tbl
				
				if Count > 0 then
					v1 = Count
					ReactorModule.batch(p2, publish)
				end
				if next(t1) == nil and next(t2) == nil and OnFrameResult then
					local Callback: () -> () = OnFrameResult
					OnFrameResult = nil
					Callback()
				end
				if v3 ~= nil then
					OwnerModule.raiseAll(v3)
				end
			end)
			
			return
		end
	end
	
	return function(Node, Text, p3)
		-- upvalues: Callback (copy), p1 (copy), t (copy), CellModule (upval), releaseRecord (copy), t1 (ref), t2 (copy), OnFrameResult (ref), t3 (ref), Tbl (copy), Tbl1 (copy), v1 (ref), ReactorModule (upval), p2 (copy), publish (copy), OwnerModule (upval)
		local Observe = Callback("observe")
		local ComposeObserveRequiresHostObservation = assert(p1.observation, "Compose observe requires host.observation")
		local IsStyled: boolean = p3 ~= nil and p3.styled == true
		
		if IsStyled then
			assert(ComposeObserveRequiresHostObservation.readStyledProperty, "Compose styled observation requires host.observation.readStyledProperty")
		end
		local ComposeStyledObservationRequiresHostObservationObserveStyledProperty = if IsStyled then assert(ComposeObserveRequiresHostObservation.observeStyledProperty, "Compose styled observation requires host.observation.observeStyledProperty") else ComposeObserveRequiresHostObservation.observeProperty
		local IsFrame: boolean = p3 ~= nil and p3.frame == true
		local IsPoll: boolean = p3 ~= nil and p3.poll == true
		assert(not IsPoll or IsFrame, "Compose polling observation requires frame = true")
		assert(not IsFrame or p1.frames ~= nil, "Compose frame observation requires host.frames")
		local Text1 = if IsStyled then Text .. "\0styled" else Text
		
		if IsPoll then
			Text1 ..= "\0poll"
		elseif IsFrame then
			Text1 ..= "\0frame"
		end
		local Entry = t[Node]
		
		if Entry == nil then
			Entry = {}
			t[Node] = Entry
		end
		local Entry1 = Entry[Text1]
		
		if Entry1 == nil then
			local function read(Node, p4)
				-- upvalues: IsStyled (copy), ComposeObserveRequiresHostObservation (copy)
				return if IsStyled then assert(ComposeObserveRequiresHostObservation.readStyledProperty)(Node, p4) else ComposeObserveRequiresHostObservation.readProperty(Node, p4)
			end
			
			local CellResult = CellModule.cell(read(Node, Text))
			local config = {
				references = 0,
				unsubscribe = nil,
				entry = nil,
				release = nil,
				node = Node,
				key = Text1,
				properties = Entry,
				value = CellResult
			}
			
			function config:release()
				-- upvalues: releaseRecord (upval), config (copy)
				releaseRecord(config)
			end
			
			if IsFrame then
				local Entry2 = {
					live = true,
					quiet = 0,
					read = function()
						-- upvalues: read (copy), Node (copy), Text (copy)
						return read(Node, Text)
					end,
					value = CellResult,
					polls = IsPoll
				}
				config.entry = Entry2
				config.unsubscribe = ComposeStyledObservationRequiresHostObservationObserveStyledProperty(Node, Text, function()
					-- upvalues: Entry2 (copy), t1 (upval), t2 (upval), OnFrameResult (upval), p1 (upval), t3 (upval), Tbl (upval), Tbl1 (upval), v1 (upval), ReactorModule (upval), p2 (upval), publish (upval), OwnerModule (upval)
					if Entry2.live then
						t1[Entry2] = true
						
						if Entry2.polls then
							Entry2.quiet = 0
							t2[Entry2] = true
						end
						if OnFrameResult then return end
						OnFrameResult = assert(p1.frames, "Compose frame observation requires host.frames").onFrame(function()
							-- upvalues: t1 (upval), t3 (upval), t2 (upval), Tbl (upval), Tbl1 (upval), v1 (upval), ReactorModule (upval), p2 (upval), publish (upval), OnFrameResult (upval), OwnerModule (upval)
							local Tbl = t1
							t1 = t3
							
							for i in t2 do
								Tbl[i] = true
							end
							local v3 = nil
							local Count = 0
							
							for i1 in Tbl do
								if i1.live then
									local Success, Result = pcall(i1.read)
									
									if not Success then
										local List = v3 or {}
										v3 = List
										table.insert(List, Result)
									elseif Result ~= i1.value:peek() then
										i1.quiet = 0
										Count += 1
										Tbl[Count] = i1
										Tbl1[Count] = Result
									elseif t2[i1] then
										i1.quiet += 1
										
										if i1.quiet >= 3 then
											t2[i1] = nil
										end
									end
								end
							end
							table.clear(Tbl)
							t3 = Tbl
							
							if Count > 0 then
								v1 = Count
								ReactorModule.batch(p2, publish)
							end
							if next(t1) == nil and next(t2) == nil and OnFrameResult then
								local Callback: () -> () = OnFrameResult
								OnFrameResult = nil
								Callback()
							end
							if v3 ~= nil then
								OwnerModule.raiseAll(v3)
							end
						end)
					end
				end)
				t1[Entry2] = true
				
				if IsPoll then
					t2[Entry2] = true
				end
				if not OnFrameResult then
					OnFrameResult = assert(p1.frames, "Compose frame observation requires host.frames").onFrame(function()
						-- upvalues: t1 (upval), t3 (upval), t2 (upval), Tbl (upval), Tbl1 (upval), v1 (upval), ReactorModule (upval), p2 (upval), publish (upval), OnFrameResult (upval), OwnerModule (upval)
						local Tbl = t1
						t1 = t3
						
						for i in t2 do
							Tbl[i] = true
						end
						local v3 = nil
						local Count = 0
						
						for i1 in Tbl do
							if i1.live then
								local Success, Result = pcall(i1.read)
								
								if not Success then
									local List = v3 or {}
									v3 = List
									table.insert(List, Result)
								elseif Result ~= i1.value:peek() then
									i1.quiet = 0
									Count += 1
									Tbl[Count] = i1
									Tbl1[Count] = Result
								elseif t2[i1] then
									i1.quiet += 1
									
									if i1.quiet >= 3 then
										t2[i1] = nil
									end
								end
							end
						end
						table.clear(Tbl)
						t3 = Tbl
						
						if Count > 0 then
							v1 = Count
							ReactorModule.batch(p2, publish)
						end
						if next(t1) == nil and next(t2) == nil and OnFrameResult then
							local Callback: () -> () = OnFrameResult
							OnFrameResult = nil
							Callback()
						end
						if v3 ~= nil then
							OwnerModule.raiseAll(v3)
						end
					end)
				end
			else
				config.unsubscribe = ComposeStyledObservationRequiresHostObservationObserveStyledProperty(Node, Text, function()
					-- upvalues: CellResult (copy), read (copy), Node (copy), Text (copy)
					CellResult:set(read(Node, Text))
				end)
			end
			Entry[Text1] = config
			Entry1 = config
		end
		local v3 = assert(Entry1)
		v3.references += 1
		OwnerModule.holdSubject(Observe, assert(v3.release), v3)
		
		return v3.value
	end
end