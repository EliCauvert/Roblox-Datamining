local ViewRecycler = script:FindFirstAncestor("ViewRecycler")
local DataSourceChangeTypeModule = require(ViewRecycler.Core.Enums.DataSourceChangeType)
local _ = require(ViewRecycler.Core.Virtualizer.ItemSequence)
local _ = require(ViewRecycler.Core.Types)

return function(ItemSequence, Predicate) --[[ Line: 24 | Named "createStickyIndexResolver" ]]
	-- upvalues: DataSourceChangeTypeModule (copy)
	local ItemSequence1 = ItemSequence
	local Callback = Predicate
	local v1 = nil
	local Flag = true
	
	local function _(Node, p1) --[[ Line: 33 | Named "applyShift" ]]
		if Node ~= nil then
			Node.index += p1
			Node.lazy += p1
		end
	end
	
	local _ = function(Node) --[[ Line: 40 | Named "push" ]]
		local Lazy = Node.lazy
		
		if Lazy ~= 0 then
			local Left = Node.left
			
			if Left ~= nil then
				Left.index += Lazy
				Left.lazy += Lazy
			end
			local Right = Node.right
			
			if Right ~= nil then
				Right.index += Lazy
				Right.lazy += Lazy
			end
			Node.lazy = 0
		end
	end
	
	local _ = function(p1) --[[ Line: 49 | Named "height" ]]
		return if p1 == nil then 0 else p1.height
	end
	
	local _ = function(Node) --[[ Line: 53 | Named "updateHeight" ]]
		local Left = Node.left
		local Right = Node.right
		Node.height = math.max(if Left == nil then 0 else Left.height, if Right == nil then 0 else Right.height) + 1
	end
	
	local _ = function(Left) --[[ Line: 57 | Named "rotateLeft" ]]
		local Right = Left.right
		local Lazy = Left.lazy
		
		if Lazy ~= 0 then
			local Left1 = Left.left
			
			if Left1 ~= nil then
				Left1.index += Lazy
				Left1.lazy += Lazy
			end
			local Right1 = Left.right
			
			if Right1 ~= nil then
				Right1.index += Lazy
				Right1.lazy += Lazy
			end
			Left.lazy = 0
		end
		local Lazy1 = Right.lazy
		
		if Lazy1 ~= 0 then
			local Left2 = Right.left
			
			if Left2 ~= nil then
				Left2.index += Lazy1
				Left2.lazy += Lazy1
			end
			local Right4 = Right.right
			
			if Right4 ~= nil then
				Right4.index += Lazy1
				Right4.lazy += Lazy1
			end
			Right.lazy = 0
		end
		Left.right = Right.left
		Right.left = Left
		local Left3 = Left.left
		local Right2 = Left.right
		Left.height = math.max(if Left3 == nil then 0 else Left3.height, if Right2 == nil then 0 else Right2.height) + 1
		local Left4 = Right.left
		local Right3 = Right.right
		Right.height = math.max(if Left4 == nil then 0 else Left4.height, if Right3 == nil then 0 else Right3.height) + 1
		
		return Right
	end
	
	local _ = function(Node) --[[ Line: 68 | Named "rotateRight" ]]
		local Left = Node.left
		local Lazy = Node.lazy
		
		if Lazy ~= 0 then
			local Left1 = Node.left
			
			if Left1 ~= nil then
				Left1.index += Lazy
				Left1.lazy += Lazy
			end
			local Right = Node.right
			
			if Right ~= nil then
				Right.index += Lazy
				Right.lazy += Lazy
			end
			Node.lazy = 0
		end
		local Lazy1 = Left.lazy
		
		if Lazy1 ~= 0 then
			local Left2 = Left.left
			
			if Left2 ~= nil then
				Left2.index += Lazy1
				Left2.lazy += Lazy1
			end
			local Right = Left.right
			
			if Right ~= nil then
				Right.index += Lazy1
				Right.lazy += Lazy1
			end
			Left.lazy = 0
		end
		Node.left = Left.right
		Left.right = Node
		local Left3 = Node.left
		local Right = Node.right
		Node.height = math.max(if Left3 == nil then 0 else Left3.height, if Right == nil then 0 else Right.height) + 1
		local Left4 = Left.left
		local Right1 = Left.right
		Left.height = math.max(if Left4 == nil then 0 else Left4.height, if Right1 == nil then 0 else Right1.height) + 1
		
		return Left
	end
	
	local function balance(Left) --[[ Line: 79 ]]
		local Left1 = Left.left
		local Right = Left.right
		Left.height = math.max(if Left1 == nil then 0 else Left1.height, if Right == nil then 0 else Right.height) + 1
		local Left2 = Left.left
		local Right1 = Left.right
		local v2 = (if Left2 == nil then 0 else Left2.height) - (if Right1 == nil then 0 else Right1.height)
		
		if v2 > 1 then
			local Left3 = Left.left
			local Lazy = Left3.lazy
			
			if Lazy ~= 0 then
				local Left4 = Left3.left
				
				if Left4 ~= nil then
					Left4.index += Lazy
					Left4.lazy += Lazy
				end
				local Right2 = Left3.right
				
				if Right2 ~= nil then
					Right2.index += Lazy
					Right2.lazy += Lazy
				end
				Left3.lazy = 0
			end
			local Left5 = Left3.left
			local Right3 = Left3.right
			
			if (if Left5 == nil then 0 else Left5.height) < (if Right3 == nil then 0 else Right3.height) then
				local Right4 = Left3.right
				local Lazy1 = Left3.lazy
				
				if Lazy1 ~= 0 then
					local Left7 = Left3.left
					
					if Left7 ~= nil then
						Left7.index += Lazy1
						Left7.lazy += Lazy1
					end
					local Right11 = Left3.right
					
					if Right11 ~= nil then
						Right11.index += Lazy1
						Right11.lazy += Lazy1
					end
					Left3.lazy = 0
				end
				local Lazy2 = Right4.lazy
				
				if Lazy2 ~= 0 then
					local Left8 = Right4.left
					
					if Left8 ~= nil then
						Left8.index += Lazy2
						Left8.lazy += Lazy2
					end
					local Right41 = Right4.right
					
					if Right41 ~= nil then
						Right41.index += Lazy2
						Right41.lazy += Lazy2
					end
					Right4.lazy = 0
				end
				Left3.right = Right4.left
				Right4.left = Left3
				local Left9 = Left3.left
				local Right2 = Left3.right
				Left3.height = math.max(if Left9 == nil then 0 else Left9.height, if Right2 == nil then 0 else Right2.height) + 1
				local Left10 = Right4.left
				local Right31 = Right4.right
				Right4.height = math.max(if Left10 == nil then 0 else Left10.height, if Right31 == nil then 0 else Right31.height) + 1
				Left.left = Right4
			end
			local Left6 = Left.left
			local Lazy1 = Left.lazy
			
			if Lazy1 ~= 0 then
				local Left11 = Left.left
				
				if Left11 ~= nil then
					Left11.index += Lazy1
					Left11.lazy += Lazy1
				end
				local Right5 = Left.right
				
				if Right5 ~= nil then
					Right5.index += Lazy1
					Right5.lazy += Lazy1
				end
				Left.lazy = 0
			end
			local Lazy3 = Left6.lazy
			
			if Lazy3 ~= 0 then
				local Left12 = Left6.left
				
				if Left12 ~= nil then
					Left12.index += Lazy3
					Left12.lazy += Lazy3
				end
				local Right6 = Left6.right
				
				if Right6 ~= nil then
					Right6.index += Lazy3
					Right6.lazy += Lazy3
				end
				Left6.lazy = 0
			end
			Left.left = Left6.right
			Left6.right = Left
			local Left13 = Left.left
			local Right7 = Left.right
			Left.height = math.max(if Left13 == nil then 0 else Left13.height, if Right7 == nil then 0 else Right7.height) + 1
			local Left14 = Left6.left
			local Right8 = Left6.right
			Left6.height = math.max(if Left14 == nil then 0 else Left14.height, if Right8 == nil then 0 else Right8.height) + 1
			
			return Left6
		else
			if v2 >= -1 then
				return Left
			end
			local Right9 = Left.right
			local Lazy = Right9.lazy
			
			if Lazy ~= 0 then
				local Left15 = Right9.left
				
				if Left15 ~= nil then
					Left15.index += Lazy
					Left15.lazy += Lazy
				end
				local Right6 = Right9.right
				
				if Right6 ~= nil then
					Right6.index += Lazy
					Right6.lazy += Lazy
				end
				Right9.lazy = 0
			end
			local Right5 = Right9.right
			local Left16 = Right9.left
			
			if (if Right5 == nil then 0 else Right5.height) < (if Left16 == nil then 0 else Left16.height) then
				local Left17 = Right9.left
				local Lazy4 = Right9.lazy
				
				if Lazy4 ~= 0 then
					local Left18 = Right9.left
					
					if Left18 ~= nil then
						Left18.index += Lazy4
						Left18.lazy += Lazy4
					end
					local Right8 = Right9.right
					
					if Right8 ~= nil then
						Right8.index += Lazy4
						Right8.lazy += Lazy4
					end
					Right9.lazy = 0
				end
				local Lazy41 = Left17.lazy
				
				if Lazy41 ~= 0 then
					local Left19 = Left17.left
					
					if Left19 ~= nil then
						Left19.index += Lazy41
						Left19.lazy += Lazy41
					end
					local Right10 = Left17.right
					
					if Right10 ~= nil then
						Right10.index += Lazy41
						Right10.lazy += Lazy41
					end
					Left17.lazy = 0
				end
				Right9.left = Left17.right
				Left17.right = Right9
				local Left20 = Right9.left
				local Right91 = Right9.right
				Right9.height = math.max(if Left20 == nil then 0 else Left20.height, if Right91 == nil then 0 else Right91.height) + 1
				local Left21 = Left17.left
				local Right12 = Left17.right
				Left17.height = math.max(if Left21 == nil then 0 else Left21.height, if Right12 == nil then 0 else Right12.height) + 1
				Left.right = Left17
			end
			local Right7 = Left.right
			local Lazy3 = Left.lazy
			
			if Lazy3 ~= 0 then
				local Left22 = Left.left
				
				if Left22 ~= nil then
					Left22.index += Lazy3
					Left22.lazy += Lazy3
				end
				local Right13 = Left.right
				
				if Right13 ~= nil then
					Right13.index += Lazy3
					Right13.lazy += Lazy3
				end
				Left.lazy = 0
			end
			local Lazy5 = Right7.lazy
			
			if Lazy5 ~= 0 then
				local Left23 = Right7.left
				
				if Left23 ~= nil then
					Left23.index += Lazy5
					Left23.lazy += Lazy5
				end
				local Right14 = Right7.right
				
				if Right14 ~= nil then
					Right14.index += Lazy5
					Right14.lazy += Lazy5
				end
				Right7.lazy = 0
			end
			Left.right = Right7.left
			Right7.left = Left
			local Left24 = Left.left
			local Right15 = Left.right
			Left.height = math.max(if Left24 == nil then 0 else Left24.height, if Right15 == nil then 0 else Right15.height) + 1
			local Left25 = Right7.left
			local Right16 = Right7.right
			Right7.height = math.max(if Left25 == nil then 0 else Left25.height, if Right16 == nil then 0 else Right16.height) + 1
			
			return Right7
		end
	end
	
	local _ = nil
	
	local function v15(Left, Node, Right) --[[ Line: 101 ]]
		-- upvalues: v15 (ref), balance (copy)
		local Height = if Left == nil then 0 else Left.height
		local Height1 = if Right == nil then 0 else Right.height
		
		if Height1 + 1 < Height then
			local Lazy = Left.lazy
			
			if Lazy ~= 0 then
				local Left1 = Left.left
				
				if Left1 ~= nil then
					Left1.index += Lazy
					Left1.lazy += Lazy
				end
				local Right1 = Left.right
				
				if Right1 ~= nil then
					Right1.index += Lazy
					Right1.lazy += Lazy
				end
				Left.lazy = 0
			end
			Left.right = v15(Left.right, Node, Right)
			
			return (balance(Left))
		else
			if Height + 1 >= Height1 then
				Node.left = Left
				Node.right = Right
				Node.lazy = 0
				local Left2 = Node.left
				local Right2 = Node.right
				Node.height = math.max(if Left2 == nil then 0 else Left2.height, if Right2 == nil then 0 else Right2.height) + 1
				
				return Node
			end
			local Lazy = Right.lazy
			
			if Lazy ~= 0 then
				local Left3 = Right.left
				
				if Left3 ~= nil then
					Left3.index += Lazy
					Left3.lazy += Lazy
				end
				local Right3 = Right.right
				
				if Right3 ~= nil then
					Right3.index += Lazy
					Right3.lazy += Lazy
				end
				Right.lazy = 0
			end
			Right.left = v15(Left, Node, Right.left)
			
			return (balance(Right))
		end
	end
	
	local function split(Node, FromIndex) --[[ Line: 122 ]]
		-- upvalues: split (copy), v15 (ref)
		if Node == nil then
			return nil, nil
		end
		local Lazy = Node.lazy
		
		if Lazy ~= 0 then
			local Left = Node.left
			
			if Left ~= nil then
				Left.index += Lazy
				Left.lazy += Lazy
			end
			local Right = Node.right
			
			if Right ~= nil then
				Right.index += Lazy
				Right.lazy += Lazy
			end
			Node.lazy = 0
		end
		if Node.index < FromIndex then
			local SplitResult, SplitResult2 = split(Node.right, FromIndex)
			Node.left = nil
			Node.right = nil
			
			return v15(Node.left, Node, SplitResult), SplitResult2
		else
			local SplitResult1, SplitResult2_1 = split(Node.left, FromIndex)
			Node.left = nil
			Node.right = nil
			
			return SplitResult1, v15(SplitResult2_1, Node, Node.right)
		end
	end
	
	local function removeFirst(Left) --[[ Line: 141 ]]
		-- upvalues: removeFirst (copy), balance (copy)
		local Lazy = Left.lazy
		
		if Lazy ~= 0 then
			local Left1 = Left.left
			
			if Left1 ~= nil then
				Left1.index += Lazy
				Left1.lazy += Lazy
			end
			local Right = Left.right
			
			if Right ~= nil then
				Right.index += Lazy
				Right.lazy += Lazy
			end
			Left.lazy = 0
		end
		if Left.left == nil then
			local Right = Left.right
			Left.right = nil
			local Left2 = Left.left
			local Right1 = Left.right
			Left.height = math.max(if Left2 == nil then 0 else Left2.height, if Right1 == nil then 0 else Right1.height) + 1
			
			return Right, Left
		else
			local RemoveFirstResult2
			Left.left, RemoveFirstResult2 = removeFirst(Left.left)
			
			return balance(Left), RemoveFirstResult2
		end
	end
	
	local _ = function(Left, Node) --[[ Line: 154 | Named "join" ]]
		-- upvalues: removeFirst (copy), balance (copy), v15 (ref)
		if Left == nil then
			return Node
		end
		if Node == nil then
			return Left
		end
		local Lazy = Node.lazy
		
		if Lazy ~= 0 then
			local Left1 = Node.left
			
			if Left1 ~= nil then
				Left1.index += Lazy
				Left1.lazy += Lazy
			end
			local Right = Node.right
			
			if Right ~= nil then
				Right.index += Lazy
				Right.lazy += Lazy
			end
			Node.lazy = 0
		end
		local Right2 = nil
		local Node1 = nil
		if Node.left == nil then
			local Right = Node.right
			Node.right = nil
			local Left2 = Node.left
			local Right1 = Node.right
			Node.height = math.max(if Left2 == nil then 0 else Left2.height, if Right1 == nil then 0 else Right1.height) + 1
			Right2 = Right
			Node1 = Node
		else
			local RemoveFirstResult2
			Node.left, RemoveFirstResult2 = removeFirst(Node.left)
			Right2 = balance(Node)
			Node1 = RemoveFirstResult2
		end
		return v15(Left, Node1, Right2)
	end
	
	local _ = function(Index) --[[ Line: 164 | Named "newNode" ]]
		return {
			height = 1,
			lazy = 0,
			left = nil,
			right = nil,
			index = Index
		}
	end
	
	local function buildBalanced(p1, p2, Count) --[[ Line: 174 ]]
		-- upvalues: buildBalanced (copy)
		if Count < p2 then
			return nil
		else
			local Floored = math.floor((p2 + Count) / 2)
			local config = {
				height = 1,
				lazy = 0,
				left = nil,
				right = nil,
				index = p1[Floored]
			}
			config.left = buildBalanced(p1, p2, Floored - 1)
			config.right = buildBalanced(p1, Floored + 1, Count)
			local Left = config.left
			local Right = config.right
			config.height = math.max(if Left == nil then 0 else Left.height, if Right == nil then 0 else Right.height) + 1
			
			return config
		end
	end
	
	local function rebuild() --[[ Line: 186 ]]
		-- upvalues: Callback (ref), ItemSequence1 (ref), v1 (ref), buildBalanced (copy), Flag (ref)
		local List = {}
		
		if Callback ~= nil then
			for i = 1, ItemSequence1.getItemCount() do
				if Callback((ItemSequence1.getItemKey(i))) then
					table.insert(List, i)
				end
			end
		end
		v1 = buildBalanced(List, 1, #List)
		Flag = false
	end
	
	return {
		setPredicate = function(Value): boolean --[[ Line: 221 ]]
			-- upvalues: Callback (ref), Flag (ref)
			if Callback == Value then
				return false
			else
				Callback = Value
				Flag = true
				
				return true
			end
		end,
		setItemSequence = function(Value) --[[ Line: 229 ]]
			-- upvalues: ItemSequence1 (ref), Flag (ref)
			if ItemSequence1 ~= Value then
				ItemSequence1 = Value
				Flag = true
			end
		end,
		applyDataSourceChange = function(p1) --[[ Line: 235 ]]
			-- upvalues: Flag (ref), Callback (ref), DataSourceChangeTypeModule (upval), split (copy), v1 (ref), buildBalanced (copy), removeFirst (copy), balance (copy), v15 (ref)
			if Flag or Callback == nil then return end
			for _, change in p1.changes do
				if change.type == DataSourceChangeTypeModule.Reset or change.type == DataSourceChangeTypeModule.Reorder then
					Flag = true
					break
				end
				if change.type == DataSourceChangeTypeModule.Insert then
					local Index = change.index
					local CountKeys = #change.keys
					local SplitResult, SplitResult2 = split(v1, Index)
					
					if SplitResult2 ~= nil then
						SplitResult2.index += CountKeys
						SplitResult2.lazy += CountKeys
					end
					local List = {}
					
					for i, key in change.keys do
						if Callback(key) then
							table.insert(List, Index + i - 1)
						end
					end
					local Balanced = buildBalanced(List, 1, #List)
					local Left = nil
					
					if SplitResult == nil then
						Left = Balanced
					elseif Balanced == nil then
						Left = SplitResult
					else
						local Lazy = Balanced.lazy
						
						if Lazy ~= 0 then
							local Left1 = Balanced.left
							
							if Left1 ~= nil then
								Left1.index += Lazy
								Left1.lazy += Lazy
							end
							local Right = Balanced.right
							
							if Right ~= nil then
								Right.index += Lazy
								Right.lazy += Lazy
							end
							Balanced.lazy = 0
						end
						local Balanced1 = nil
						local Right4 = nil
						if Balanced.left == nil then
							local Right = Balanced.right
							Balanced.right = nil
							local Left2 = Balanced.left
							local Right3 = Balanced.right
							Balanced.height = math.max(if Left2 == nil then 0 else Left2.height, if Right3 == nil then 0 else Right3.height) + 1
							Right4 = Right
							Balanced1 = Balanced
						else
							local RemoveFirstResult2_1
							Balanced.left, RemoveFirstResult2_1 = removeFirst(Balanced.left)
							Right4 = balance(Balanced)
							Balanced1 = RemoveFirstResult2_1
						end
						Left = v15(SplitResult, Balanced1, Right4)
					end
					local SplitResult1 = nil
					if Left == nil then
						SplitResult1 = SplitResult2
					elseif SplitResult2 == nil then
						SplitResult1 = Left
					else
						local Lazy = SplitResult2.lazy
						
						if Lazy ~= 0 then
							local Left4 = SplitResult2.left
							
							if Left4 ~= nil then
								Left4.index += Lazy
								Left4.lazy += Lazy
							end
							local Right = SplitResult2.right
							
							if Right ~= nil then
								Right.index += Lazy
								Right.lazy += Lazy
							end
							SplitResult2.lazy = 0
						end
						local Right6 = nil
						local SplitResult3 = nil
						if SplitResult2.left == nil then
							local Right = SplitResult2.right
							SplitResult2.right = nil
							local Left7 = SplitResult2.left
							local Right5 = SplitResult2.right
							SplitResult2.height = math.max(if Left7 == nil then 0 else Left7.height, if Right5 == nil then 0 else Right5.height) + 1
							Right6 = Right
							SplitResult3 = SplitResult2
						else
							local RemoveFirstResult2_3
							SplitResult2.left, RemoveFirstResult2_3 = removeFirst(SplitResult2.left)
							Right6 = balance(SplitResult2)
							SplitResult3 = RemoveFirstResult2_3
						end
						SplitResult1 = v15(Left, SplitResult3, Right6)
					end
					v1 = SplitResult1
				else
					if change.type ~= DataSourceChangeTypeModule.Remove then
						if change.type == DataSourceChangeTypeModule.Move then
							local FromIndex: number = change.fromIndex
							local ToIndex: number = change.toIndex
							
							if FromIndex < ToIndex then
								local SplitResult7, SplitResult2_3 = split(v1, FromIndex)
								local SplitResult8, SplitResult2_4 = split(SplitResult2_3, FromIndex + 1)
								local SplitResult9, SplitResult2_5 = split(SplitResult2_4, ToIndex + 1)
								
								if SplitResult9 ~= nil then
									SplitResult9.index += -1
									SplitResult9.lazy += -1
								end
								if SplitResult8 ~= nil then
									SplitResult8.index = ToIndex
								end
								local Left9 = nil
								if SplitResult7 == nil then
									Left9 = SplitResult9
								elseif SplitResult9 == nil then
									Left9 = SplitResult7
								else
									local Lazy3 = SplitResult9.lazy
									
									if Lazy3 ~= 0 then
										local Left10 = SplitResult9.left
										
										if Left10 ~= nil then
											Left10.index += Lazy3
											Left10.lazy += Lazy3
										end
										local Right = SplitResult9.right
										
										if Right ~= nil then
											Right.index += Lazy3
											Right.lazy += Lazy3
										end
										SplitResult9.lazy = 0
									end
									local Right10 = nil
									local SplitResult13 = nil
									if SplitResult9.left == nil then
										local Right = SplitResult9.right
										SplitResult9.right = nil
										local Left11 = SplitResult9.left
										local Right9 = SplitResult9.right
										SplitResult9.height = math.max(if Left11 == nil then 0 else Left11.height, if Right9 == nil then 0 else Right9.height) + 1
										Right10 = Right
										SplitResult13 = SplitResult9
									else
										local RemoveFirstResult2_5
										SplitResult9.left, RemoveFirstResult2_5 = removeFirst(SplitResult9.left)
										Right10 = balance(SplitResult9)
										SplitResult13 = RemoveFirstResult2_5
									end
									Left9 = v15(SplitResult7, SplitResult13, Right10)
								end
								local Left = nil
								if Left9 == nil then
									Left = SplitResult8
								elseif SplitResult8 == nil then
									Left = Left9
								else
									local Lazy2 = SplitResult8.lazy
									
									if Lazy2 ~= 0 then
										local Left12 = SplitResult8.left
										
										if Left12 ~= nil then
											Left12.index += Lazy2
											Left12.lazy += Lazy2
										end
										local Right = SplitResult8.right
										
										if Right ~= nil then
											Right.index += Lazy2
											Right.lazy += Lazy2
										end
										SplitResult8.lazy = 0
									end
									local Right12 = nil
									local SplitResult14 = nil
									if SplitResult8.left == nil then
										local Right = SplitResult8.right
										SplitResult8.right = nil
										local Left13 = SplitResult8.left
										local Right11 = SplitResult8.right
										SplitResult8.height = math.max(if Left13 == nil then 0 else Left13.height, if Right11 == nil then 0 else Right11.height) + 1
										Right12 = Right
										SplitResult14 = SplitResult8
									else
										local RemoveFirstResult2_6
										SplitResult8.left, RemoveFirstResult2_6 = removeFirst(SplitResult8.left)
										Right12 = balance(SplitResult8)
										SplitResult14 = RemoveFirstResult2_6
									end
									Left = v15(Left9, SplitResult14, Right12)
								end
								local SplitResult15 = nil
								if Left == nil then
									SplitResult15 = SplitResult2_5
								elseif SplitResult2_5 == nil then
									SplitResult15 = Left
								else
									local Lazy = SplitResult2_5.lazy
									
									if Lazy ~= 0 then
										local Left14 = SplitResult2_5.left
										
										if Left14 ~= nil then
											Left14.index += Lazy
											Left14.lazy += Lazy
										end
										local Right = SplitResult2_5.right
										
										if Right ~= nil then
											Right.index += Lazy
											Right.lazy += Lazy
										end
										SplitResult2_5.lazy = 0
									end
									local Right14 = nil
									local SplitResult16 = nil
									if SplitResult2_5.left == nil then
										local Right = SplitResult2_5.right
										SplitResult2_5.right = nil
										local Left15 = SplitResult2_5.left
										local Right13 = SplitResult2_5.right
										SplitResult2_5.height = math.max(if Left15 == nil then 0 else Left15.height, if Right13 == nil then 0 else Right13.height) + 1
										Right14 = Right
										SplitResult16 = SplitResult2_5
									else
										local RemoveFirstResult2_7
										SplitResult2_5.left, RemoveFirstResult2_7 = removeFirst(SplitResult2_5.left)
										Right14 = balance(SplitResult2_5)
										SplitResult16 = RemoveFirstResult2_7
									end
									SplitResult15 = v15(Left, SplitResult16, Right14)
								end
								v1 = SplitResult15
							else
								local SplitResult10, SplitResult2_6 = split(v1, ToIndex)
								local SplitResult11, SplitResult2_7 = split(SplitResult2_6, FromIndex)
								local SplitResult12, SplitResult2_8 = split(SplitResult2_7, FromIndex + 1)
								
								if SplitResult11 ~= nil then
									SplitResult11.index += 1
									SplitResult11.lazy += 1
								end
								if SplitResult12 ~= nil then
									SplitResult12.index = ToIndex
								end
								local Left6 = nil
								if SplitResult10 == nil then
									Left6 = SplitResult12
								elseif SplitResult12 == nil then
									Left6 = SplitResult10
								else
									local Lazy = SplitResult12.lazy
									
									if Lazy ~= 0 then
										local Left5 = SplitResult12.left
										
										if Left5 ~= nil then
											Left5.index += Lazy
											Left5.lazy += Lazy
										end
										local Right = SplitResult12.right
										
										if Right ~= nil then
											Right.index += Lazy
											Right.lazy += Lazy
										end
										SplitResult12.lazy = 0
									end
									local RemoveFirstResult = nil
									local BalanceResult = nil
									if SplitResult12.left == nil then
										local Right = SplitResult12.right
										SplitResult12.right = nil
										local Left = SplitResult12.left
										local Right15 = SplitResult12.right
										SplitResult12.height = math.max(if Left == nil then 0 else Left.height, if Right15 == nil then 0 else Right15.height) + 1
										BalanceResult = Right
										RemoveFirstResult = SplitResult12
									else
										local RemoveFirstResult2_2
										SplitResult12.left, RemoveFirstResult2_2 = removeFirst(SplitResult12.left)
										BalanceResult = balance(SplitResult12)
										RemoveFirstResult = RemoveFirstResult2_2
									end
									Left6 = v15(SplitResult10, RemoveFirstResult, BalanceResult)
								end
								local Left = nil
								if Left6 == nil then
									Left = SplitResult11
								elseif SplitResult11 == nil then
									Left = Left6
								else
									local Lazy = SplitResult11.lazy
									
									if Lazy ~= 0 then
										local Left3 = SplitResult11.left
										
										if Left3 ~= nil then
											Left3.index += Lazy
											Left3.lazy += Lazy
										end
										local Right = SplitResult11.right
										
										if Right ~= nil then
											Right.index += Lazy
											Right.lazy += Lazy
										end
										SplitResult11.lazy = 0
									end
									local Right17 = nil
									local SplitResult17 = nil
									if SplitResult11.left == nil then
										local Right = SplitResult11.right
										SplitResult11.right = nil
										local Left16 = SplitResult11.left
										local Right16 = SplitResult11.right
										SplitResult11.height = math.max(if Left16 == nil then 0 else Left16.height, if Right16 == nil then 0 else Right16.height) + 1
										Right17 = Right
										SplitResult17 = SplitResult11
									else
										local RemoveFirstResult2_8
										SplitResult11.left, RemoveFirstResult2_8 = removeFirst(SplitResult11.left)
										Right17 = balance(SplitResult11)
										SplitResult17 = RemoveFirstResult2_8
									end
									Left = v15(Left6, SplitResult17, Right17)
								end
								local SplitResult18 = nil
								if Left == nil then
									SplitResult18 = SplitResult2_8
								elseif SplitResult2_8 == nil then
									SplitResult18 = Left
								else
									local Lazy = SplitResult2_8.lazy
									
									if Lazy ~= 0 then
										local Left17 = SplitResult2_8.left
										
										if Left17 ~= nil then
											Left17.index += Lazy
											Left17.lazy += Lazy
										end
										local Right = SplitResult2_8.right
										
										if Right ~= nil then
											Right.index += Lazy
											Right.lazy += Lazy
										end
										SplitResult2_8.lazy = 0
									end
									local Right2 = nil
									local v2 = nil
									if SplitResult2_8.left == nil then
										local Right = SplitResult2_8.right
										SplitResult2_8.right = nil
										local Left8 = SplitResult2_8.left
										local Right1 = SplitResult2_8.right
										SplitResult2_8.height = math.max(if Left8 == nil then 0 else Left8.height, if Right1 == nil then 0 else Right1.height) + 1
										Right2 = Right
										v2 = SplitResult2_8
									else
										local RemoveFirstResult2
										SplitResult2_8.left, RemoveFirstResult2 = removeFirst(SplitResult2_8.left)
										Right2 = balance(SplitResult2_8)
										v2 = RemoveFirstResult2
									end
									SplitResult18 = v15(Left, v2, Right2)
								end
								v1 = SplitResult18
							end
						end
						continue
					end
					local Index = change.index
					local IndexDelta = Index + #change.keys - 1
					local SplitResult4, SplitResult2_1 = split(v1, Index)
					local _, SplitResult2_2 = split(SplitResult2_1, IndexDelta + 1)
					local Negated = -#change.keys
					
					if SplitResult2_2 ~= nil then
						SplitResult2_2.index += Negated
						SplitResult2_2.lazy += Negated
					end
					local SplitResult5 = nil
					if SplitResult4 == nil then
						SplitResult5 = SplitResult2_2
					elseif SplitResult2_2 == nil then
						SplitResult5 = SplitResult4
					else
						local Lazy1 = SplitResult2_2.lazy
						
						if Lazy1 ~= 0 then
							local Left = SplitResult2_2.left
							
							if Left ~= nil then
								Left.index += Lazy1
								Left.lazy += Lazy1
							end
							local Right = SplitResult2_2.right
							
							if Right ~= nil then
								Right.index += Lazy1
								Right.lazy += Lazy1
							end
							SplitResult2_2.lazy = 0
						end
						local Right8 = nil
						local SplitResult6 = nil
						if SplitResult2_2.left == nil then
							local Right = SplitResult2_2.right
							SplitResult2_2.right = nil
							local Left8 = SplitResult2_2.left
							local Right7 = SplitResult2_2.right
							SplitResult2_2.height = math.max(if Left8 == nil then 0 else Left8.height, if Right7 == nil then 0 else Right7.height) + 1
							Right8 = Right
							SplitResult6 = SplitResult2_2
						else
							local RemoveFirstResult2_4
							SplitResult2_2.left, RemoveFirstResult2_4 = removeFirst(SplitResult2_2.left)
							Right8 = balance(SplitResult2_2)
							SplitResult6 = RemoveFirstResult2_4
						end
						SplitResult5 = v15(SplitResult4, SplitResult6, Right8)
					end
					v1 = SplitResult5
				end
			end
		end,
		resolveActive = function(Callback) --[[ Line: 200 ]]
			-- upvalues: Flag (ref), rebuild (copy), v1 (ref)
			if Flag then
				rebuild()
			end
			local Index = nil
			local Index1 = nil
			local Left = v1
			while Left ~= nil do
				local Node = Left
				local Lazy = Node.lazy
				
				if Lazy ~= 0 then
					local Left1 = Node.left
					
					if Left1 ~= nil then
						Left1.index += Lazy
						Left1.lazy += Lazy
					end
					local Right = Node.right
					
					if Right ~= nil then
						Right.index += Lazy
						Right.lazy += Lazy
					end
					Node.lazy = 0
				end
				if Callback(Left.index) then
					Index = Left.index
					Left = Left.right
				else
					Index1 = Left.index
					Left = Left.left
				end
			end
			return Index, Index1
		end
	}
end