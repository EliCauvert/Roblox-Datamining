local Parent = script:FindFirstAncestor("ChatUIPrimitives").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local SignalsModule = require(Parent.Signals)
local _ = require(script.Parent.Parent.AutocompleteTypes)
local Utf8RangeModule = require(script.Parent.Parent.utf8Range)

local function _(p1): boolean
	return p1 == " " or p1 == "\n"
end

local function matchCommandTrigger(Text, p1: number)
	-- upvalues: Utf8RangeModule (copy)
	local Length = utf8.len(Text)
	
	if Length == nil or p1 < 2 or Length + 1 < p1 then
		return nil
	end
	local v1 = 1
	
	for i = p1 - 1, 1, -1 do
		local CharAtResult = Utf8RangeModule.charAt(Text, i)
		
		if CharAtResult == nil then
			return nil
		elseif CharAtResult ~= " " and CharAtResult ~= "\n" then
			continue
		else
			v1 = i + 1
			break
		end
	end
	if v1 == 1 and Utf8RangeModule.charAt(Text, 1) == "/" then
		local SliceResult = Utf8RangeModule.slice(Text, 1, p1 - 1)
		
		return if SliceResult == nil or SliceResult == "" then nil else {
			replaceStart = 1,
			query = SliceResult,
			replaceFinish = p1 - 1
		}
	else
		return nil
	end
end

local function buildSortedAliases(GetCommandSets, p2)
	local t = {}
	local List = {}
	
	for _, getCommandSet in GetCommandSets do
		for _, value in getCommandSet(p2) do
			if value.autocompleteVisible ~= false then
				for _, alias in value.aliases do
					local Lowered = string.lower(alias)
					
					if not t[Lowered] then
						t[Lowered] = true
						table.insert(List, Lowered)
					end
				end
			end
		end
	end
	table.sort(List)
	
	return List
end

local function searchSortedAliases(IsNotIdMatch, Text: string)
	local Lowered = string.lower(Text)
	local CountLowered = #Lowered
	local v2 = 1
	local v3 = #IsNotIdMatch + 1
	while v2 < v3 do
		local v4 = (v2 + v3) // 2
		
		if IsNotIdMatch[v4] < Lowered then
			v2 = v4 + 1
		else
			v3 = v4
		end
	end
	local List = {}
	
	for i = v2, #IsNotIdMatch do
		local Text1: string = IsNotIdMatch[i]
		
		if string.sub(Text1, 1, CountLowered) ~= Lowered then break end
		table.insert(List, Text1)
	end
	return List
end

local function formatCommandReplacement(p3)
	return p3
end

local function renderCommandEntry(Text, _)
	-- upvalues: ReactModule (copy), FoundationModule (copy)
	return ReactModule.createElement(FoundationModule.View, { tag = "row align-y-center size-full" }, {
		alias = ReactModule.createElement(FoundationModule.Text, {
			tag = "auto-xy text-body-medium content-emphasis",
			LayoutOrder = 1,
			Text = Text
		})
	})
end

return function(p3)
	-- upvalues: searchSortedAliases (copy), SignalsModule (copy), buildSortedAliases (copy), matchCommandTrigger (copy), formatCommandReplacement (copy), renderCommandEntry (copy)
	local t: boolean = type(p3.id) == "string" and p3.id ~= ""
	assert(t, "AutocompleteSources.commands requires an id")
	assert(type(p3.getCommandSets) == "table", "AutocompleteSources.commands requires getCommandSets")
	local GetCommandSets = p3.getCommandSets
	t = {}
	
	return {
		id = p3.id,
		matchTrigger = matchCommandTrigger,
		search = function(p4)
			-- upvalues: searchSortedAliases (upval), t (ref)
			return (searchSortedAliases(t, p4))
		end,
		formatReplacement = formatCommandReplacement,
		renderEntry = renderCommandEntry,
		maxResults = p3.maxResults,
		subscribe = function(Callback)
			-- upvalues: SignalsModule (upval), t (ref), buildSortedAliases (upval), GetCommandSets (copy)
			local Flag = false
			local Flag1 = false
			local Effect = SignalsModule.createEffect(function(p4)
				-- upvalues: t (upval), buildSortedAliases (upval), GetCommandSets (upval), Flag (ref), Flag1 (ref), Callback (copy)
				t = buildSortedAliases(GetCommandSets, p4)
				
				if Flag or not Flag1 then
					Flag1 = true
					
					return
				else
					Callback()
				end
			end)
			
			return function()
				-- upvalues: Flag (ref), Effect (copy)
				Flag = true
				Effect()
			end
		end
	}
end