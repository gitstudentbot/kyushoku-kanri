<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:fo="http://www.w3.org/1999/XSL/Format">

<xsl:attribute-set name="cell-base">
	<xsl:attribute name="border">0.8pt solid</xsl:attribute>
	<xsl:attribute name="display-align">center</xsl:attribute>
</xsl:attribute-set>

<!-- =========================================================== -->
<!-- Root                                                        -->
<!-- =========================================================== -->
	<xsl:template match="Sales">
		<fo:root font-size="9pt" font-family="IPA Gothic, IPAGothic">
			<fo:layout-master-set>
				<fo:simple-page-master master-name="A4" page-width="297mm" page-height="210mm"
					margin-top="5mm" margin-bottom="5mm" margin-left="10mm" margin-right="10mm">
					<fo:region-body margin-top="50mm" margin-bottom="5mm" margin-left="10mm" margin-right="10mm"/>
					<fo:region-before extent="40mm"/>
				</fo:simple-page-master>
			</fo:layout-master-set>

			<xsl:for-each select="Item">
				<fo:page-sequence master-reference="A4">
					<!--ヘッダー header-->
					<fo:static-content flow-name="xsl-region-before">
						<fo:block text-align="center" font-size="24pt" margin-top="25mm">求 職 管 理 簿</fo:block>
						<!--logo-->
						<fo:block-container absolute-position="absolute">
							<fo:block text-align="right" margin-right="2mm">
								<fo:external-graphic src="logo.png" content-height="scale-down-to-fit"
								content-width="scale-down-to-fit" height="20mm" width="50mm"/>
							</fo:block>
						</fo:block-container>
					</fo:static-content>

					<fo:flow flow-name="xsl-region-body">
						<fo:block space-after="2mm">
							<fo:inline-container width="50%" text-align="left">
								<fo:block font-size="10pt">
									<xsl:value-of select="Sales.U_329EF86EC8EC8534AD35E8EE04633B"/>
								</fo:block>
							</fo:inline-container>
							<fo:inline-container width="50%" text-align="right">
								<fo:block font-size="10pt">
									【有効期間の終了後２年間保存】
								</fo:block>
							</fo:inline-container>
						</fo:block>

						<fo:table table-layout="fixed" width="100%">
							<fo:table-column column-width="13%"/>
							<fo:table-column column-width="34%"/>
							<fo:table-column column-width="13%"/>
							<fo:table-column column-width="40%"/>
							<fo:table-body>
								<fo:table-row height="15mm">
									<fo:table-cell xsl:use-attribute-sets="cell-base">
										<fo:block text-align="center">
											①受付
										</fo:block>
										<fo:block text-align="center">
											年月日
										</fo:block>
									</fo:table-cell>
									<fo:table-cell xsl:use-attribute-sets="cell-base">
										<fo:block text-align="center" font-size="11pt">
											②求職者に係る氏名・住所・生年月日
										</fo:block>
									</fo:table-cell>
									<fo:table-cell xsl:use-attribute-sets="cell-base">
										<fo:block text-align="center">
											③有効期間/
										</fo:block>
										<fo:block text-align="center" font-size="11pt">
											紹介年月日
										</fo:block>
									</fo:table-cell>
									<fo:table-cell xsl:use-attribute-sets="cell-base">
										<fo:block text-align="center" font-size="11pt">
											④職業紹介の取扱状況
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
								<fo:table-row height="105mm">
									<fo:table-cell xsl:use-attribute-sets="cell-base">
										<fo:block text-align="center">
											<xsl:value-of select="Sales.U_6170B623017E191B4AA765AB985586"/>
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
							</fo:table-body>
						</fo:table>

						<fo:table table-layout="fixed" width="100%">
							<fo:table-column column-width="10mm"/>
							<fo:table-column column-width="30mm"/>
							<fo:table-body>
								<fo:table-row height="10mm">
									<fo:table-cell xsl:use-attribute-sets="cell-base">
										<fo:block text-align="center">
											氏名
										</fo:block>
									</fo:table-cell>
									<fo:table-cell xsl:use-attribute-sets="cell-base">
										<fo:block text-align="center">
											氏名
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
							</fo:table-body>
						</fo:table>
					
 						
						
					</fo:flow>
					
				</fo:page-sequence>
			</xsl:for-each>
		</fo:root>
	</xsl:template>
</xsl:stylesheet>