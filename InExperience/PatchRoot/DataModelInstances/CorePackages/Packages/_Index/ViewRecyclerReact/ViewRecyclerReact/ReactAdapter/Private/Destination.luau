local ViewRecyclerReact = script:FindFirstAncestor("ViewRecyclerReact")
local _ = require(ViewRecyclerReact.Parent.ViewRecycler)
local ViewRecyclerRobloxModule = require(ViewRecyclerReact.Parent.ViewRecyclerRoblox)
local _ = require(ViewRecyclerReact.Parent.Signals)
local HostPresentationPhase = ViewRecyclerRobloxModule.HostPresentationPhase
local ReparentableHost = ViewRecyclerRobloxModule.ReparentableHost
local Frozen = table.freeze({
	List = "list",
	Composition = "composition",
	Rect = "rect"
})

local function resetReparented(_, p1, _)
	-- upvalues: ReparentableHost (copy)
	ReparentableHost.detach(p1)
	p1.AnchorPoint = Vector2.zero
	p1.Position = UDim2.new()
	p1.Size = UDim2.new()
	p1.AutomaticSize = Enum.AutomaticSize.None
	p1.ZIndex = 1
end

local function attachNowhere(_, _) end

local function readValue(p1, _)
	return p1
end

return table.freeze({
	Kind = Frozen,
	behaviors = table.freeze({
		[Frozen.List] = table.freeze({
			sameOwner = function(p1, p2): boolean
				return p1.sink == p2.sink
			end,
			attach = attachNowhere,
			present = function(p1, Host, p2, Phase)
				p2.sink.apply(p1, { host = Host, phase = Phase, state = p2.state })
			end,
			detach = function(p1, _, p2)
				p2.sink.apply(p1, nil)
			end,
			readItem = readValue
		}),
		[Frozen.Composition] = table.freeze({
			sameOwner = function(p1, p2): boolean
				return p1.placementId == p2.placementId
			end,
			attach = attachNowhere,
			present = function(_, Frame, p1, Hidden)
				-- upvalues: ReparentableHost (copy), HostPresentationPhase (copy)
				if Frame.Parent ~= p1.placeholder or Frame.AutomaticSize ~= p1.automaticSize then
					ReparentableHost.place(Frame, p1)
				end
				Frame.Visible = Hidden ~= HostPresentationPhase.Hidden
			end,
			detach = resetReparented,
			readItem = function(Callback, p1)
				return Callback(p1)
			end
		}),
		[Frozen.Rect] = table.freeze({
			sameOwner = function(p1, p2): boolean
				return p1.rectPlacement == p2.rectPlacement
			end,
			attach = function(p1, p2)
				if p1.Parent ~= p2.container then
					p1.AutomaticSize = Enum.AutomaticSize.None
					p1.Parent = p2.container
				end
			end,
			present = function(_, p1, _, Hidden)
				-- upvalues: HostPresentationPhase (copy)
				p1.Visible = Hidden ~= HostPresentationPhase.Hidden
			end,
			detach = resetReparented,
			readItem = readValue
		})
	})
})