local RecycledInlineLayout = script:FindFirstAncestor("RecycledInlineLayout")
local DashModule = require(RecycledInlineLayout.Parent.Dash)
local _ = require(RecycledInlineLayout.Types)
local config = { none = true, measure = true, split = true }
local config1 = { binding = true, state = true, callback = true }
local TestId = { layout = "none", delivery = "binding" }

return {
	normalize = function(p1, Tbl)
		-- upvalues: TestId (copy), config (copy), config1 (copy), DashModule (copy)
		if Tbl.testId ~= nil then
			warn(`RecycledInlineLayout: {p1} declares testId, which every Leaf and Span has built in; the declaration is ignored`)
		end
		local Copy = table.clone(Tbl)
		Copy.testId = TestId
		local Tbl1 = {}
		
		for i, TestId1 in Copy do
			local Layout = TestId1.layout
			local Delivery = TestId1.delivery
			assert(Layout ~= nil, `{p1}.{i}: layout is required ("none", "measure" or "split")`)
			assert(Delivery ~= nil, `{p1}.{i}: delivery is required ("binding", "state" or "callback")`)
			assert(config[Layout], `{p1}.{i}: unknown layout impact "{Layout}"`)
			assert(config1[Delivery], `{p1}.{i}: unknown delivery "{Delivery}"`)
			assert(Delivery ~= "callback" or Layout == "none", `{p1}.{i}: a callback prop cannot affect layout`)
			Tbl1[i] = table.freeze({
				layout = Layout,
				delivery = Delivery,
				equals = TestId1.equals or DashModule.shallowEqual
			})
		end
		return table.freeze(Tbl1)
	end
}