local HomePerfLogModule = {
	IDLE_SECONDS = 10,
	IDLE_15S_SECONDS = 15,
	output = print,
	delay = task.delay
}
local Total = 0

function HomePerfLogModule.write(p1, p2, List)
	-- upvalues: HomePerfLogModule (copy)
	local List1 = { "HomePerf 1", p1, p2 }
	
	if List then
		local List2 = {}
		
		for i in List do
			table.insert(List2, i)
		end
		table.sort(List2)
		
		for _, value in List2 do
			table.insert(List1, `{value}={math.floor(List[value] + 0.5)}`)
		end
	end
	HomePerfLogModule.output(table.concat(List1, " "))
end

function HomePerfLogModule.homeInteractive(Object)
	-- upvalues: HomePerfLogModule (copy)
	HomePerfLogModule.write("mark", "home_interactive")
	
	local function memory(p3)
		-- upvalues: HomePerfLogModule (upval), Object (copy)
		HomePerfLogModule.write("memory", p3, {
			luaKb = collectgarbage("count"),
			instances = if Object.Parent then #Object:GetDescendants() else 0
		})
	end
	
	HomePerfLogModule.delay(HomePerfLogModule.IDLE_SECONDS, function()
		-- upvalues: memory (copy)
		memory("home_idle")
	end)
	HomePerfLogModule.delay(HomePerfLogModule.IDLE_15S_SECONDS, function()
		-- upvalues: memory (copy)
		memory("home_idle_15s")
	end)
end

function HomePerfLogModule.addTilesImpressed(Add)
	-- upvalues: Total (ref), HomePerfLogModule (copy)
	Total += Add
	HomePerfLogModule.write("count", "tiles_impressed", { add = Add, total = Total })
end

function HomePerfLogModule.resetForTesting()
	-- upvalues: Total (ref)
	Total = 0
end

return HomePerfLogModule