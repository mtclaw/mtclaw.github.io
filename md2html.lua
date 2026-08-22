--[[
Author: mtclaw kagamicannery@outlook.com
Date: 2026-08-22 15:53:55
LastEditors: mtclaw kagamicannery@outlook.com
LastEditTime: 2026-08-22 16:21:39
--]]

-- md2html.lua

-- 处理pandoc解析为Link的节点
function Link(el)
  -- 把 .md/ 替换为 .html/
  if el.target:match("%.md$") then
    el.target = el.target:gsub("%.md([#?]?.*)$", ".html%1")
  end
  if el.target:match("%.md#") then
    el.target = el.target:gsub("%.md#", ".html#")
  end
  -- 把 .odt/ 替换为 .html/
  if el.target:match("%.odt$") then
    el.target = el.target:gsub("%.odt([#?]?.*)$", ".html%1")
  end
  if el.target:match("%.odt#") then
    el.target = el.target:gsub("%.odt#", ".html#")
  end
  return el
end

-- 把第一个 H1 当作 title
function Pandoc(doc)
  if not doc.meta.title and #doc.blocks > 0 then
    for _, block in ipairs(doc.blocks) do
      if block.t == "Header" and block.level == 1 then
        doc.meta.title = pandoc.MetaString(pandoc.utils.stringify(block.content))
        break
      end
    end
  end
  return doc
end
