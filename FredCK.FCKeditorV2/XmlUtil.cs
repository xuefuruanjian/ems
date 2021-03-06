using System;
using System.Collections.Generic;
using System.Text;
using System.Xml;

namespace FredCK.FCKeditorV2
{
    internal sealed class XmlUtil
    {
        private XmlUtil()
        {
        }

        public static XmlNode AppendElement(XmlNode node, string newElementName)
        {
            return AppendElement(node, newElementName, null);
        }

        public static XmlNode AppendElement(XmlNode node, string newElementName, string innerValue)
        {
            XmlNode node2;
            if (node is XmlDocument)
            {
                node2 = node.AppendChild(((XmlDocument)node).CreateElement(newElementName));
            }
            else
            {
                node2 = node.AppendChild(node.OwnerDocument.CreateElement(newElementName));
            }
            if (innerValue != null)
            {
                node2.AppendChild(node.OwnerDocument.CreateTextNode(innerValue));
            }
            return node2;
        }

        public static XmlAttribute CreateAttribute(XmlDocument xmlDocument, string name, string value)
        {
            XmlAttribute attribute = xmlDocument.CreateAttribute(name);
            attribute.Value = value;
            return attribute;
        }

        public static void SetAttribute(XmlNode node, string attributeName, string attributeValue)
        {
            if (node.Attributes[attributeName] != null)
            {
                node.Attributes[attributeName].Value = attributeValue;
            }
            else
            {
                node.Attributes.Append(CreateAttribute(node.OwnerDocument, attributeName, attributeValue));
            }
        }
    }
}
