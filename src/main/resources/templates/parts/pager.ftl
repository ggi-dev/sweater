<#macro pager url page>
    <#if page.getTotalPages() gt 7 >
        <#assign
            totalPages = page.getTotalPages()
            pageNuber = page.getNumber() + 1

            head = (pageNuber > 4)?then([1, -1], [1, 2, 3])
            tail = (pageNuber < totalPages - 3)?then([-1, totalPages],[totalPages - 2, totalPages - 1, totalPages])
            bodyBefore = (pageNuber > 4 && pageNuber < totalPages - 1)?then([pageNuber - 2, pageNuber - 1],[])
            bodyAfter = (pageNuber > 2 && pageNuber < totalPages - 3)?then([pageNuber + 1, pageNuber + 2],[])

            body = head + bodyBefore + (pageNuber > 3 && pageNuber < totalPages - 2)?then([pageNuber],[]) + bodyAfter + tail
        >
    <#else>
        <#assign body = 1..page.getTotalPages()>
    </#if>
    <div class="mt-3">
        <ul class="pagination">
            <li class="page-item disabled">
                <a class="page-link" href="#" tabindex="-1">Страница</a>
            </li>
            <#list body as p>
                <#if (p -1) == page.getNumber()>
                    <li class="page-item active">
                        <a class="page-link" href="#" tabindex="-1">${p}</a>
                    </li>
                <#elseif p == -1 >
                    <li class="page-item disabled">
                        <a class="page-link" href="#" tabindex="-1">...</a>
                    </li>
                <#else>
                    <li class="page-item">
                        <a class="page-link" href="${url}?page=${p - 1}&size=${page.getSize()}" tabindex="-1">${p}</a>
                    </li>
                </#if>
            </#list>
        </ul>

        <ul class="pagination">
            <li class="page-item disabled">
                <a class="page-link" href="#" tabindex="-1">Элементов на странице</a>
            </li>
            <#list [5, 10, 25, 50] as c>
                <#if c == page.getSize()>
                    <li class="page-item active">
                        <a class="page-link" href="#" tabindex="-1">${c}</a>
                    </li>
                <#else>
                    <li class="page-item">
                        <a class="page-link" href="${url}?page=${page.getNumber()}&size=${c}" tabindex="-1">${c}</a>
                    </li>
                </#if>
            </#list>
        </ul>
    </div>
</#macro>